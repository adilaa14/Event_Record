<script setup>
import { Link } from '@inertiajs/vue3';
</script>

<template>
    <div class="min-h-screen d-flex flex-column align-items-center justify-content-center blossom-bg py-4">
        <div class="mb-4">
            <Link href="/" class="text-decoration-none">
                <h1 class="display-4 fw-bold text-pink-dark">EventNotes</h1>
            </Link>
        </div>

        <div class="card shadow-sm border-0 border-top border-pink border-3" style="width: 100%; max-width: 400px;">
            <div class="card-body p-4">
                <slot />
            </div>
        </div>
    </div>
</template>
