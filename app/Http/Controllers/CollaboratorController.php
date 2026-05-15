<?php

namespace App\Http\Controllers;

use App\Models\Collaborator;
use App\Models\EventNote;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CollaboratorController extends Controller
{
    public function store(Request $request, EventNote $note)
    {
        $request->validate([
            'email' => 'required|email|exists:users,email',
            'role' => 'required|in:editor,viewer',
        ]);

        $user = User::where('email', $request->email)->first();

        // Check if already collaborator
        $exists = Collaborator::where('event_note_id', $note->id)
            ->where('user_id', $user->id)
            ->exists();

        if ($exists) {
            return back()->with('error', 'User is already a collaborator.');
        }

        Collaborator::create([
            'event_note_id' => $note->id,
            'user_id' => $user->id,
            'role' => $request->role,
        ]);

        return back()->with('success', 'Collaborator added successfully.');
    }

    public function destroy(Collaborator $collaborator)
    {
        $collaborator->delete();
        return back();
    }
}
