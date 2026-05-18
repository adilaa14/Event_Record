<?php

use Illuminate\Support\Facades\Broadcast;

Broadcast::channel('App.Models.User.{id}', function ($user, $id) {
    return (int) $user->id === (int) $id;
});

Broadcast::channel('note.{noteId}', function ($user, $noteId) {
    $note = \App\Models\EventNote::find($noteId);
    
    if (!$note) return false;

    $isCollaborator = $note->owner_id === $user->id || 
        $note->collaborators()->where('user_id', $user->id)->exists();

    if ($isCollaborator) {
        return [
            'id' => $user->id,
            'name' => $user->name,
            'color' => '#' . substr(md5($user->email), 0, 6)
        ];
    }

    return false;
});
