<script setup>
import { Link } from '@inertiajs/vue3';
</script>

<template>
    <div class="min-h-screen blossom-bg">
        <nav class="navbar navbar-expand-lg navbar-light bg-blossom-navbar shadow-sm">
            <div class="container">
                <Link class="navbar-brand fw-bold" href="/">EventNotes</Link>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <Link class="nav-link" :href="route('dashboard')">Dashboard</Link>
                        </li>
                    </ul>
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">
                                {{ $page.props.auth.user.name }}
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li><Link class="dropdown-item" :href="route('profile.edit')">Profil</Link></li>
                                <li><hr class="dropdown-divider"></li>
                                <li>
                                    <Link class="dropdown-item" :href="route('logout')" method="post" as="button">
                                        Keluar
                                    </Link>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <header class="bg-white shadow-sm mb-4" v-if="$slots.header">
            <div class="container py-3">
                <slot name="header" />
            </div>
        </header>

        <main class="container">
            <slot />
        </main>
    </div>
</template>

<style scoped>
.navbar-brand {
    font-size: 1.5rem;
    color: #ad1457 !important;
}
.bg-blossom-navbar {
    background-color: #fce4ec !important; /* Soft Blossom Pink */
}
.blossom-bg {
    background-color: #fff5f8; /* Very Light Blossom White */
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}
.nav-link {
    color: #880e4f !important;
    font-weight: 500;
}
</style>
