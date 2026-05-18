<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\EventNote;
use App\Models\Collaborator;
use App\Models\ActivityLog;
use App\Models\Revision;
use App\Events\DocumentUpdated;
use App\Events\CursorMoved;
use App\Events\MouseMoved;
use App\Events\ActivityLogged;
use Inertia\Inertia;
use Illuminate\Support\Facades\Auth;

class NoteController extends Controller
{
    public function index()
    {
        $userId = Auth::id();
        
        // Notes where user is owner or collaborator
        $notes = EventNote::where('owner_id', $userId)
            ->orWhereHas('collaborators', function($query) use ($userId) {
                $query->where('user_id', $userId);
            })
            ->with(['owner', 'collaborators'])
            ->latest()
            ->get();

        return Inertia::render('Dashboard', [
            'notes' => $notes
        ]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'paper_size' => 'required|string|in:A4,Letter,Legal',
        ]);

        $note = $request->user()->notes()->create([
            'title' => $validated['title'],
            'paper_size' => $validated['paper_size'],
            'owner_id' => Auth::id(),
            'content' => '',
        ]);

        // Add owner as a collaborator with owner role
        Collaborator::create([
            'event_note_id' => $note->id,
            'user_id' => Auth::id(),
            'role' => 'owner',
        ]);

        // Log Activity
        $activity = ActivityLog::create([
            'event_note_id' => $note->id,
            'user_id' => Auth::id(),
            'action' => 'membuat dokumen ini',
        ]);

        try {
            broadcast(new ActivityLogged($note->id, $activity->load('user')))->toOthers();
        } catch (\Exception $e) {
            \Log::error("Broadcasting failed: " . $e->getMessage());
        }

        return redirect()->route('notes.show', $note->id);
    }

    public function show(EventNote $note)
    {
        $this->authorize('view', $note);

        return Inertia::render('Editor', [
            'note' => $note->load(['owner', 'collaborators.user', 'revisions.user', 'activityLogs.user']),
            'currentUser' => Auth::user(),
        ]);
    }

    public function update(Request $request, EventNote $note)
    {
        $this->authorize('update', $note);

        $note->update([
            'content' => $request->content
        ]);

        // 1. Log Activity (Debounced: only once every 5 minutes per user per action)
        $lastLog = ActivityLog::where('event_note_id', $note->id)
            ->where('user_id', Auth::id())
            ->where('action', 'updated the content')
            ->where('created_at', '>', now()->subMinutes(5))
            ->first();

        if (!$lastLog) {
            $activity = ActivityLog::create([
                'event_note_id' => $note->id,
                'user_id' => Auth::id(),
                'action' => 'memperbarui isi dokumen',
            ]);
            try {
                broadcast(new ActivityLogged($note->id, $activity->load('user')))->toOthers();
            } catch (\Exception $e) {
                \Log::error("Broadcasting failed: " . $e->getMessage());
            }
        }

        // 2. Create Revision (Snapshots every 5 minutes of editing)
        $lastRevision = Revision::where('event_note_id', $note->id)
            ->where('created_at', '>', now()->subMinutes(5))
            ->first();

        if (!$lastRevision) {
            Revision::create([
                'event_note_id' => $note->id,
                'user_id' => Auth::id(),
                'content_before' => $note->getOriginal('content'),
                'content_after' => $request->content,
            ]);
        }

        // 3. Broadcast to others
        try {
            broadcast(new DocumentUpdated($note->id, $request->content, Auth::id()))->toOthers();
        } catch (\Exception $e) {
            \Log::error("Broadcasting failed: " . $e->getMessage());
        }

        return response()->json(['status' => 'success']);
    }

    public function updateCursor(Request $request, EventNote $note)
    {
        broadcast(new CursorMoved($note->id, Auth::id(), $request->position))->toOthers();
        return response()->json(['status' => 'success']);
    }

    public function updateMouse(Request $request, EventNote $note)
    {
        broadcast(new MouseMoved($note->id, Auth::id(), $request->position))->toOthers();
        return response()->json(['status' => 'success']);
    }
}
