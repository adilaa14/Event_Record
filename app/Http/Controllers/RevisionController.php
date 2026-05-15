<?php

namespace App\Http\Controllers;

use App\Models\Revision;
use App\Models\EventNote;
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

        return back();
    }
}
