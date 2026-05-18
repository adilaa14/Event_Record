<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

use App\Http\Controllers\NoteController;
use App\Http\Controllers\CollaboratorController;
use App\Http\Controllers\RevisionController;

Route::get('/', function () {
    return redirect()->route('dashboard');
});

Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/dashboard', [NoteController::class, 'index'])->name('dashboard');
    
    Route::prefix('notes')->name('notes.')->group(function () {
        Route::post('/', [NoteController::class, 'store'])->name('store');
        Route::get('/{note}', [NoteController::class, 'show'])->name('show');
        Route::patch('/{note}', [NoteController::class, 'update'])->name('update');
        Route::post('/{note}/cursor', [NoteController::class, 'updateCursor'])->name('cursor');
        Route::post('/{note}/mouse', [NoteController::class, 'updateMouse'])->name('mouse');
        
        Route::post('/{note}/collaborators', [CollaboratorController::class, 'store'])->name('collaborators.store');
        Route::post('/{note}/revisions', [RevisionController::class, 'store'])->name('revisions.store');
    });

    Route::post('/revisions/{revision}/restore', [RevisionController::class, 'restore'])->name('revisions.restore');

    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
