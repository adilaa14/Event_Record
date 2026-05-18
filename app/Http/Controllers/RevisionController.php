<?php

namespace App\Http\Controllers;

use App\Models\Revision;
use App\Models\EventNote;
use App\Events\DocumentUpdated;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RevisionController extends Controller
{
    public function store(Request $request, EventNote $note)
    {
        Revision::create([
            'event_note_id' => $note->id,
            'user_id' => Auth::id(),
            'content_before' => $note->content,
            'content_after' => $request->content,
        ]);

        return response()->json(['status' => 'success']);
    }

    public function restore(Revision $revision)
    {
        $note = $revision->eventNote;
        $note->update([
            'content' => $revision->content_after
        ]);

        // Broadcast the restoration to others
        try {
            broadcast(new DocumentUpdated($note->id, $revision->content_after, Auth::id()))->toOthers();
        } catch (\Exception $e) {
            \Log::error("Broadcasting restoration failed: " . $e->getMessage());
        }

        return response()->json(['status' => 'success']);
    }
}
