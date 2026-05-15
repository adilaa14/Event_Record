<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\EventNote;
use App\Models\Collaborator;
use App\Events\DocumentUpdated;
use App\Events\CursorMoved;
use App\Events\MouseMoved;
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

        // Broadcast to others
        broadcast(new DocumentUpdated($note->id, $request->content, Auth::id()))->toOthers();

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
