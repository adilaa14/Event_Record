<script setup>
import GuestLayout from '@/Layouts/GuestLayout.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';

const form = useForm({
    name: '',
    email: '',
    password: '',
    password_confirmation: '',
});

const submit = () => {
    form.post(route('register'), {
        onFinish: () => form.reset('password', 'password_confirmation'),
    });
};
</script>

<template>
    <GuestLayout>
        <Head title="Daftar" />

        <form @submit.prevent="submit">
            <div class="mb-3">
                <label for="name" class="form-label">Nama</label>
                <input
                    id="name"
                    type="text"
                    class="form-control"
                    :class="{ 'is-invalid': form.errors.name }"
                    v-model="form.name"
                    required
                    autofocus
                    autocomplete="name"
                />
                <div v-if="form.errors.name" class="invalid-feedback">
                    {{ form.errors.name }}
                </div>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input
                    id="email"
                    type="email"
                    class="form-control"
                    :class="{ 'is-invalid': form.errors.email }"
                    v-model="form.email"
                    required
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
                    autocomplete="new-password"
                />
                <div v-if="form.errors.password" class="invalid-feedback">
                    {{ form.errors.password }}
                </div>
            </div>

            <div class="mb-3">
                <label for="password_confirmation" class="form-label">Konfirmasi Kata Sandi</label>
                <input
                    id="password_confirmation"
                    type="password"
                    class="form-control"
                    :class="{ 'is-invalid': form.errors.password_confirmation }"
                    v-model="form.password_confirmation"
                    required
                    autocomplete="new-password"
                />
                <div v-if="form.errors.password_confirmation" class="invalid-feedback">
                    {{ form.errors.password_confirmation }}
                </div>
            </div>

            <div class="d-flex align-items-center justify-content-between mt-4">
                <Link
                    :href="route('login')"
                    class="small link-pink text-decoration-none"
                >
                    Sudah punya akun?
                </Link>

                <button
                    type="submit"
                    class="btn btn-pink"
                    :disabled="form.processing"
                >
                    Daftar
                </button>
            </div>
        </form>
    </GuestLayout>
</template>
