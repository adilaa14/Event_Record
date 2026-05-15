<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CursorPosition extends Model
{
    use HasFactory;

    protected $fillable = [
        'event_note_id',
        'user_id',
        'index',
        'length',
        'color',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
