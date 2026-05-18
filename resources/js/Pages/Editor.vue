<script setup>
import BootstrapLayout from '@/Layouts/BootstrapLayout.vue';
import { Head, useForm, Link } from '@inertiajs/vue3';
import { onMounted, ref, nextTick, onBeforeUnmount } from 'vue';
import Quill from 'quill';
import 'quill/dist/quill.snow.css';

const props = defineProps({
    note: Object,
    currentUser: Object
});

const quillElement = ref(null);
let quill = null;
let echoChannel = null; // Store channel globally in component
const onlineUsers = ref([]);
const activeCursors = ref({}); // { userId: { index, length, name, color } }
const activityLog = ref(props.note.activity_logs || []);
const revisions = ref(props.note.revisions || []);
const scrollPos = ref(0); // Reactive scroll position
const activePointers = ref({}); // { userId: { x, y, name, color } }
let lastMouseMove = 0;
let saveTimeout = null;
const paperSize = ref(props.note.paper_size || 'A4'); // Initial size from DB
const previewRevision = ref(null);

const paperStyles = {
    'A4': { width: '210mm', minHeight: '297mm' },
    'Letter': { width: '215.9mm', minHeight: '279.4mm' },
    'Legal': { width: '215.9mm', minHeight: '355.6mm' }
};

const inviteForm = useForm({
    email: '',
    role: 'editor',
});

const sendInvite = () => {
    inviteForm.post(route('notes.collaborators.store', props.note.id), {
        onSuccess: () => inviteForm.reset(),
    });
};

const printDocument = () => {
    window.print();
};

const restoreVersion = (id) => {
    if (confirm('Apakah Anda yakin ingin memulihkan versi ini? Semua perubahan yang belum tersimpan akan hilang.')) {
        axios.post(route('revisions.restore', id)).then(() => {
            window.location.reload();
        });
    }
};

const showPreview = (rev) => {
    previewRevision.value = rev;
};

onMounted(() => {
    // Initialize Quill
    quill = new Quill(quillElement.value, {
        theme: 'snow',
        modules: {
            toolbar: [
                [{ header: [1, 2, 3, false] }],
                ['bold', 'italic', 'underline', 'strike'],
                ['blockquote', 'code-block'],
                [{ list: 'ordered' }, { list: 'bullet' }, { list: 'check' }],
                ['clean']
            ]
        }
    });

    // Set initial content
    if (props.note.content) {
        quill.setContents(JSON.parse(props.note.content));
    }

    // Update cursors on scroll
    quill.root.addEventListener('scroll', () => {
        scrollPos.value = quill.root.scrollTop;
    });

    // Handle Global Mouse Movement (Figma Style)
    window.addEventListener('mousemove', (e) => {
        const now = Date.now();
        if (now - lastMouseMove > 25) { 
            // We use viewport coordinates (clientX/Y) for global movement
            if (echoChannel) {
                echoChannel.whisper('MouseMoved', {
                    x: e.clientX,
                    y: e.clientY,
                    userId: props.currentUser.id,
                    name: props.currentUser.name,
                    color: props.currentUser.color
                });
            }
            lastMouseMove = now;
        }
    });

    // Handle Local Changes
    quill.on('text-change', (delta, oldDelta, source) => {
        if (source === 'user') {
            // 1. INSTANT SYNC: Whisper the delta to others immediately
            window.Echo.join(`note.${props.note.id}`)
                .whisper('DocumentUpdated', {
                    delta: delta,
                    userId: props.currentUser.id
                });

            // 2. CURSOR SYNC: Update cursor position for others when typing
            const range = quill.getSelection();
            if (range && echoChannel) {
                echoChannel.whisper('CursorMoved', {
                    index: range.index,
                    length: range.length,
                    userId: props.currentUser.id
                });
            }

            // 3. DEBOUNCED SAVE: Save to DB after 1.5s of inactivity
            clearTimeout(saveTimeout);
            saveTimeout = setTimeout(() => {
                const content = JSON.stringify(quill.getContents());
                axios.patch(route('notes.update', props.note.id), {
                    content: content
                });
            }, 1500);
        }
    });

    // Handle Cursor Movement
    quill.on('selection-change', (range) => {
        if (range && echoChannel) {
            // ONLY use whisper for selection moves to avoid jumping
            echoChannel.whisper('CursorMoved', {
                index: range.index,
                length: range.length,
                userId: props.currentUser.id
            });
        }
    });

    // Realtime Listeners
    echoChannel = window.Echo.join(`note.${props.note.id}`);
    
    echoChannel
        .here((users) => {
            onlineUsers.value = users;
        })
        .joining((user) => {
            onlineUsers.value.push(user);
        })
        .leaving((user) => {
            onlineUsers.value = onlineUsers.value.filter(u => u.id !== user.id);
            delete activeCursors.value[user.id];
            delete activePointers.value[user.id];
        })
        .listen('.DocumentUpdated', (e) => {
            if (e.userId !== props.currentUser.id) {
                // We rely on Whisper for live typing. 
                // Server broadcast is only for persistence confirmation or major sync.
                // To prevent jumping, we don't force setContents here.
            }
        })
        .listenForWhisper('DocumentUpdated', (e) => {
            if (e.userId !== props.currentUser.id) {
                quill.updateContents(e.delta, 'silent');
            }
        })
        .listen('.CursorMoved', (e) => {
            // IGNORE server-side cursor moves to prevent jumping/back-and-forth
            // updateCaret(e.userId, e.position[0], e.position[1]);
        })
        .listenForWhisper('CursorMoved', (e) => {
            updateCaret(e.userId, e.index, e.length);
        })
        .listen('.ActivityLogged', (e) => {
            activityLog.value.unshift(e.activity);
        })
        .listenForWhisper('MouseMoved', (e) => {
            updatePointer(e.userId, e.x, e.y, e);
        });
});

const updateCaret = (userId, index, length) => {
    if (userId !== props.currentUser.id) {
        const user = onlineUsers.value.find(u => u.id === userId);
        if (user) {
            activeCursors.value[userId] = {
                index: index,
                length: length,
                name: user.name,
                color: user.color
            };
        }
    }
};

const updatePointer = (userId, x, y, extra) => {
    if (userId !== props.currentUser.id) {
        const user = onlineUsers.value.find(u => u.id === userId) || extra;
        if (user) {
            activePointers.value[userId] = {
                x: x,
                y: y,
                name: user.name,
                color: user.color
            };
        }
    }
};

onBeforeUnmount(() => {
    window.Echo.leave(`note.${props.note.id}`);
});

const getCursorStyle = (cursor) => {
    if (!quill) return { display: 'none' };
    
    const bounds = quill.getBounds(cursor.index);
    if (!bounds) return { display: 'none' };

    const toolbar = document.querySelector('.ql-toolbar');
    const toolbarHeight = toolbar ? toolbar.offsetHeight : 0;
    
    // Account for scrolling inside the editor
    // We use scrollPos.value here to make this function reactive to scrolls
    const scrollTop = scrollPos.value;

    return {
        left: `${bounds.left}px`,
        top: `${bounds.top + toolbarHeight - scrollTop}px`,
        height: `${bounds.height}px`,
        backgroundColor: cursor.color,
        position: 'absolute',
        width: '2px',
        zIndex: 10,
        transition: 'left 0.15s ease-out, top 0.15s ease-out',
        pointerEvents: 'none'
    };
};
</script>

<template>
    <Head :title="note.title" />

    <BootstrapLayout>
        <template #header>
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <h2 class="h4 mb-0 text-pink-dark">{{ note.title }}</h2>
                    <small class="text-muted">Pemilik: {{ note.owner.name }}</small>
                </div>
                <div class="d-flex align-items-center">
                    <div class="me-3">
                        <span v-for="user in onlineUsers" :key="user.id" 
                              class="badge rounded-pill me-1" 
                              :style="{ backgroundColor: user.color }"
                              :title="user.name">
                            {{ user.name.charAt(0) }}
                        </span>
                    </div>
                    <button class="btn btn-outline-pink btn-sm" data-bs-toggle="modal" data-bs-target="#inviteModal">
                        Undang
                    </button>
                </div>
            </div>
        </template>

        <div class="row">
            <!-- Main Editor -->
            <div class="col-md-9">
                <!-- Paper Controls -->
                <div class="d-flex justify-content-center mb-3 gap-2 no-print">
                    <div class="badge bg-white text-dark border px-3 d-flex align-items-center">
                        <i class="bi bi-file-earmark-text me-2"></i> Format {{ paperSize }}
                    </div>
                    <button @click="printDocument" class="btn btn-sm btn-dark">
                        <i class="bi bi-printer"></i> Cetak Dokumen
                    </button>
                </div>

                <div class="paper-container">
                    <div class="paper-sheet shadow" :style="paperStyles[paperSize]">
                        <div class="card-body p-0 pos-relative">
                            <div ref="quillElement" id="editor-container"></div>
                        
                        <!-- Floating Cursors -->
                        <div v-for="(cursor, userId) in activeCursors" :key="userId" 
                             class="custom-cursor" 
                             :style="getCursorStyle(cursor)">
                            <div class="cursor-label" :style="{ backgroundColor: cursor.color }">
                                {{ cursor.name }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

            <!-- Sidebar Activity -->
            <div class="col-md-3 no-print">
                <div class="sticky-sidebar">
                    <!-- Collaborators Card -->
                    <div class="card shadow-sm border-0 mb-3">
                        <div class="card-header bg-white fw-bold d-flex align-items-center">
                            <i class="bi bi-people me-2 text-pink"></i> Kolaborator
                        </div>
                        <div class="card-body p-3" style="max-height: 200px; overflow-y: auto;">
                            <div v-for="collab in note.collaborators" :key="collab.id" class="d-flex align-items-center mb-3">
                                <div class="avatar-sm rounded-circle me-2 text-center text-white" :style="{ backgroundColor: collab.user.color || '#ddd' }">
                                    {{ collab.user.name.charAt(0) }}
                                </div>
                                <div class="small">
                                    <div class="fw-bold">{{ collab.user.name }}</div>
                                    <div class="text-muted x-small text-capitalize">
                                        {{ collab.role === 'editor' ? 'Editor' : (collab.role === 'owner' ? 'Pemilik' : 'Pengamat') }}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Activity Card -->
                    <div class="card shadow-sm border-0 mb-3">
                        <div class="card-header bg-white fw-bold d-flex align-items-center">
                            <i class="bi bi-clock-history me-2 text-pink"></i> Aktivitas Terbaru
                        </div>
                        <div class="card-body p-3" style="max-height: 200px; overflow-y: auto;">
                            <div v-for="log in activityLog" :key="log.id" class="small mb-3 border-start ps-2 border-pink">
                                <span class="fw-bold">{{ log.user.name }}</span> {{ log.action }}
                                <div class="text-muted x-small">{{ new Date(log.created_at).toLocaleString() }}</div>
                            </div>
                            <div v-if="activityLog.length === 0" class="text-muted small text-center py-2">Belum ada aktivitas.</div>
                        </div>
                    </div>

                    <!-- History Card -->
                    <div class="card shadow-sm border-0 mb-3">
                        <div class="card-header bg-white fw-bold d-flex align-items-center">
                            <i class="bi bi-layers me-2 text-pink"></i> Riwayat Versi
                        </div>
                        <div class="card-body p-3" style="max-height: 250px; overflow-y: auto;">
                            <div v-for="rev in revisions" :key="rev.id" class="small mb-3 p-2 bg-light rounded border">
                                <div class="d-flex justify-content-between align-items-start">
                                    <div>
                                        <div class="fw-bold">{{ rev.user.name }}</div>
                                        <div class="text-muted x-small">{{ new Date(rev.created_at).toLocaleString() }}</div>
                                    </div>
                                    <button @click="showPreview(rev)" class="btn btn-xs btn-outline-pink p-1 py-0" data-bs-toggle="modal" data-bs-target="#previewModal">
                                        <i class="bi bi-eye"></i>
                                    </button>
                                </div>
                                <button @click="restoreVersion(rev.id)" class="btn btn-xs btn-pink w-100 mt-2 py-0 x-small">
                                    Pulihkan versi ini
                                </button>
                            </div>
                            <div v-if="revisions.length === 0" class="text-muted small text-center py-2">Belum ada revisi.</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Preview Modal -->
        <div class="modal fade" id="previewModal" tabindex="-1">
            <div class="modal-dialog modal-lg">
                <div class="modal-content border-0 shadow-lg">
                    <div class="modal-header bg-light">
                        <h5 class="modal-title">Pratinjau Versi</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body p-0">
                        <div v-if="previewRevision" class="p-4 bg-white" style="min-height: 400px; max-height: 70vh; overflow-y: auto;">
                            <div class="mb-3 border-bottom pb-2">
                                <span class="badge bg-pink">Disimpan pada {{ new Date(previewRevision.created_at).toLocaleString() }}</span>
                                <span class="ms-2 text-muted">oleh {{ previewRevision.user.name }}</span>
                            </div>
                            <div class="preview-content-area" v-html="previewRevision.content_after ? JSON.parse(previewRevision.content_after).ops.map(op => op.insert).join('') : ''">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                        <button v-if="previewRevision" @click="restoreVersion(previewRevision.id)" class="btn btn-pink" data-bs-dismiss="modal">
                            Pulihkan versi ini
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Global Mouse Pointers (Arrows) -->
        <div v-for="(pointer, userId) in activePointers" :key="'p'+userId" 
                class="mouse-pointer-global" 
                :style="{ transform: `translate(${pointer.x}px, ${pointer.y}px)` }">
            <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M1 1V14.5L4.5 11L7.5 17L9.5 16L6.5 10L11 9.5L1 1Z" :fill="pointer.color" :stroke="pointer.color" stroke-width="1" stroke-linejoin="round"/>
            </svg>
            <div class="pointer-label" :style="{ backgroundColor: pointer.color }">
                {{ pointer.name }}
            </div>
        </div>

        <!-- Invite Modal -->
        <div class="modal fade" id="inviteModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Undang Kolaborator</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <form @submit.prevent="sendInvite">
                        <div class="modal-body">
                            <div class="mb-3">
                                <label class="form-label">Alamat Email</label>
                                <input v-model="inviteForm.email" type="email" class="form-control" placeholder="user@example.com" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Peran</label>
                                <select v-model="inviteForm.role" class="form-select">
                                    <option value="editor">Editor (Bisa mengedit)</option>
                                    <option value="viewer">Pengamat (Hanya baca)</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                            <button type="submit" class="btn btn-pink" :disabled="inviteForm.processing">
                                Kirim Undangan
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </BootstrapLayout>
</template>

<style>
.text-pink { color: #f06292; }
.pos-relative { position: relative; }
.custom-cursor {
    pointer-events: none;
}
.cursor-label {
    position: absolute;
    top: -18px;
    left: 0;
    color: white;
    font-size: 10px;
    padding: 1px 4px;
    white-space: nowrap;
    border-radius: 2px;
}
.avatar-sm { width: 30px; height: 30px; line-height: 30px; font-size: 12px; font-weight: bold; }
.x-small { font-size: 0.75rem; }
.ql-container { font-size: 16px; border-bottom-left-radius: 0.5rem; border-bottom-right-radius: 0.5rem; }
.ql-toolbar { border-top-left-radius: 0.5rem; border-top-right-radius: 0.5rem; border-top: none; border-left: none; border-right: none; }

.mouse-pointer-global {
    position: fixed;
    top: 0;
    left: 0;
    pointer-events: none;
    z-index: 9999; /* Always on top of everything */
    transition: transform 0.08s linear;
    will-change: transform;
}
.pointer-label {
    position: absolute;
    top: 12px;
    left: 12px;
    color: white;
    font-size: 11px;
    font-weight: 600;
    padding: 2px 8px;
    white-space: nowrap;
    border-radius: 4px;
    border-top-left-radius: 0;
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
}

/* Page Simulation Styling */
.paper-container {
    display: block;
    background-color: transparent !important; /* Blends with web background */
    padding: 20px 0;
    min-height: 800px;
    overflow-x: auto;
    text-align: center;
}
.paper-sheet {
    display: inline-block;
    background-color: white; /* Keep the paper white */
    text-align: left;
    transition: width 0.3s ease;
    vertical-align: top;
    border: none !important; /* Remove border to blend in */
    box-shadow: 0 2px 10px rgba(0,0,0,0.05); /* Very subtle shadow for depth */
}
.btn-xs {
    padding: 1px 5px;
    font-size: 0.7rem;
}
.border-pink {
    border-color: #f06292 !important;
}
.nav-tabs .nav-link {
    border: none;
    color: #888;
    border-bottom: 2px solid transparent;
}
.nav-tabs .nav-link.active {
    color: #f06292;
    border-bottom: 2px solid #f06292;
    background: transparent;
}
.sticky-sidebar {
    position: sticky;
    top: 20px;
}
.preview-content-area {
    white-space: pre-wrap;
    font-family: serif;
    font-size: 1.1rem;
    line-height: 1.6;
}
.btn-pink {
    background-color: #f06292;
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
#editor-container {
    height: auto;
    min-height: 100%;
    border: none !important;
}
.ql-container.ql-snow {
    border: none !important;
}
.ql-editor {
    min-height: 297mm;
    padding: 30mm 25mm !important; /* Increased top padding to 30mm */
}

/* Print Styling */
@media print {
    /* Target only non-document elements */
    nav, header, footer, .no-print, .sidebar, .ql-toolbar, 
    .mouse-pointer-global, .activity-log, .btn, .modal, .badge, 
    .modal-backdrop, .navbar-brand, .nav-item, .card-header, .custom-cursor {
        display: none !important;
    }
    
    /* Ensure page is clean */
    body, html {
        background: white !important;
        margin: 0 !important;
        padding: 0 !important;
    }
    
    /* Document container adjustments */
    .paper-container, .paper-sheet, .card-body, #editor-container {
        display: block !important;
        padding: 0 !important;
        margin: 0 !important;
        width: 100% !important;
        border: none !important;
        box-shadow: none !important;
        background: transparent !important;
    }

    .ql-editor { 
        padding: 0 !important; /* Let @page margin handle the space */
        overflow: visible !important; 
        border: none !important;
        display: block !important;
        text-align: left;
    }

    /* THE MOST IMPORTANT PART: Unified Margin */
    @page {
        size: auto;
        margin: 25mm; /* Clean 2.5cm margin handled by the browser/printer */
    }
    
    .col-md-9 { 
        width: 100% !important; 
        max-width: 100% !important; 
        flex: 0 0 100% !important; 
        padding: 0 !important;
        margin: 0 !important;
    }

    /* Reset background and text colors */
    * {
        color: black !important;
        background: transparent !important;
        box-shadow: none !important;
    }
}
</style>
