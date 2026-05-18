<script setup>
import BootstrapLayout from '@/Layouts/BootstrapLayout.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';
import { ref } from 'vue';

const props = defineProps({
    notes: Array
});

const form = useForm({
    title: '',
    paper_size: 'A4',
});

const createNote = () => {
    form.post(route('notes.store'), {
        onSuccess: () => {
            form.reset();
            // Close modal (standard bootstrap way or just let page reload)
        }
    });
};
</script>

<template>
    <Head title="Dashboard" />

    <BootstrapLayout>
        <template #header>
            <div class="d-flex justify-content-between align-items-center">
                <h2 class="h4 mb-0 text-dark">Catatan Saya</h2>
                <button class="btn btn-pink" data-bs-toggle="modal" data-bs-target="#createNoteModal">
                    + Catatan Baru
                </button>
            </div>
        </template>

        <div class="row row-cols-1 row-cols-md-3 g-4">
            <div v-for="note in notes" :key="note.id" class="col">
                <div class="card h-100 shadow-sm border-0 transition-hover">
                    <div class="card-body">
                        <h5 class="card-title fw-bold text-pink-dark">{{ note.title }}</h5>
                        <p class="card-text text-muted small">
                            Dimiliki oleh {{ note.owner.name }}
                        </p>
                        <p class="card-text">
                            <span class="badge bg-light text-dark border me-1">
                                {{ note.collaborators.length }} Kolaborator
                            </span>
                        </p>
                    </div>
                    <div class="card-footer bg-white border-0 pb-3">
                        <Link :href="route('notes.show', note.id)" class="btn btn-outline-pink btn-sm w-100">
                            Buka Editor
                        </Link>
                    </div>
                </div>
            </div>
            <div v-if="notes.length === 0" class="col-12 text-center py-5">
                <div class="text-muted">Belum ada catatan. Buat catatan pertama Anda!</div>
            </div>
        </div>

        <!-- Create Note Modal -->
        <div class="modal fade" id="createNoteModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Buat Catatan Baru</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <form @submit.prevent="createNote">
                        <div class="modal-body">
                            <div class="mb-3">
                                <label class="form-label">Judul Catatan</label>
                                <input v-model="form.title" type="text" class="form-control" placeholder="contoh: Rapat Seminar Kampus" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Ukuran Kertas</label>
                                <select v-model="form.paper_size" class="form-select" required>
                                    <option value="A4">A4 (Standar)</option>
                                    <option value="Letter">Letter (US)</option>
                                    <option value="Legal">Legal</option>
                                </select>
                                <small class="text-muted">Ini akan menentukan dimensi area kerja.</small>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                            <button type="submit" class="btn btn-pink" :disabled="form.processing" data-bs-dismiss="modal">
                                Buat Catatan
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </BootstrapLayout>
</template>

<style scoped>
.transition-hover {
    transition: transform 0.2s;
}
.transition-hover:hover {
    transform: translateY(-5px);
}
.btn-pink {
    background-color: #f06292; /* Blossom Primary Pink */
    border-color: #f06292;
    color: white;
    font-weight: 600;
}
.btn-pink:hover {
    background-color: #ec407a;
    border-color: #ec407a;
    color: white;
}
.btn-outline-pink {
    color: #f06292;
    border-color: #f06292;
}
.btn-outline-pink:hover {
    background-color: #f06292;
    color: white;
}
.text-pink-dark {
    color: #ad1457;
}
</style>
