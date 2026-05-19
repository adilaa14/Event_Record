<script setup>
import GuestLayout from '@/Layouts/GuestLayout.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';

defineProps({
    canResetPassword: {
        type: Boolean,
    },
    status: {
        type: String,
    },
});

const form = useForm({
    email: '',
    password: '',
    remember: false,
});

const submit = () => {
    form.post(route('login'), {
        onFinish: () => form.reset('password'),
    });
};
</script>

<template>
    <GuestLayout>
        <Head title="Masuk" />

        <div v-if="status" class="alert alert-success mb-4">
            {{ status }}
        </div>

        <form @submit.prevent="submit">
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input
                    id="email"
                    type="email"
                    class="form-control"
                    :class="{ 'is-invalid': form.errors.email }"
                    v-model="form.email"
                    required
                    autofocus
                    autocomplete="username"
                />
                <div v-if="form.errors.email" class="invalid-feedback">
                    {{ form.errors.email }}
                </div>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Kata Sandi</label>
                <input
                    id="password"
                    type="password"
                    class="form-control"
                    :class="{ 'is-invalid': form.errors.password }"
                    v-model="form.password"
                    required
                    autocomplete="current-password"
                />
                <div v-if="form.errors.password" class="invalid-feedback">
                    {{ form.errors.password }}
                </div>
            </div>

            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="remember" v-model="form.remember">
                <label class="form-check-label" for="remember">Ingat saya</label>
            </div>

            <div class="d-flex align-items-center justify-content-between">
                <Link
                    v-if="canResetPassword"
                    :href="route('password.request')"
                    class="small link-pink"
                >
                    Lupa kata sandi?
                </Link>

                <button
                    type="submit"
                    class="btn btn-pink"
                    :disabled="form.processing"
                >
                    Masuk
                </button>
            </div>

            <div class="mt-4 text-center">
                <span class="small text-muted">Belum punya akun? </span>
                <Link :href="route('register')" class="small fw-bold link-pink">Daftar</Link>
            </div>
        </form>
    </GuestLayout>
</template>
