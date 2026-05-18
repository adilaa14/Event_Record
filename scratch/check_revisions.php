<?php
require __DIR__.'/../vendor/autoload.php';
$app = require_once __DIR__.'/../bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

use App\Models\Revision;

$revisions = Revision::all();
echo "Total Revisions: " . $revisions->count() . "\n";
foreach ($revisions as $rev) {
    echo "ID: {$rev->id}, Note ID: {$rev->event_note_id}, User ID: {$rev->user_id}, Created: {$rev->created_at}\n";
    echo "Content After Length: " . strlen($rev->content_after) . "\n";
}
