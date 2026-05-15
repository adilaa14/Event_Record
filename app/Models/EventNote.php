<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EventNote extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'content',
        'owner_id',
        'paper_size',
    ];

    public function owner()
    {
        return $this->belongsTo(User::class, 'owner_id');
    }

    public function collaborators()
    {
        return $this->hasMany(Collaborator::class);
    }

    public function revisions()
    {
        return $this->hasMany(Revision::class);
    }

    public function cursorPositions()
    {
        return $this->hasMany(CursorPosition::class);
    }

    public function activityLogs()
    {
        return $this->hasMany(ActivityLog::class);
    }
}
