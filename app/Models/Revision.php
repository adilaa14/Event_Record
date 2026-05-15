<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Revision extends Model
{
    use HasFactory;

    protected $fillable = [
        'event_note_id',
        'user_id',
        'content_before',
        'content_after',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function eventNote()
    {
        return $this->belongsTo(EventNote::class);
    }
}
