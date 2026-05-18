<script setup>
import { Link } from '@inertiajs/vue3';
</script>

<template>
    <div class="min-h-screen d-flex flex-column align-items-center justify-content-center bg-light py-4">
        <div class="mb-4">
            <Link href="/" class="text-decoration-none">
                <h1 class="display-4 fw-bold text-primary">EventNotes</h1>
            </Link>
        </div>

        <div class="card shadow-sm border-0" style="width: 100%; max-width: 400px;">
            <div class="card-body p-4">
                <slot />
            </div>
        </div>
    </div>
</template>
