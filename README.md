# Dokumentasi Struktur RealTime Document Editor

Aplikasi ini dibangun menggunakan stack **Laravel 11**, **Inertia.js**, **Vue.js**, dan **Laravel Reverb** untuk fitur kolaborasi real-time.

---

## 📂 1. Arsitektur Frontend (Tampilan)
Lokasi utama: `resources/js/`

### 🖥️ Halaman Utama (Pages)
| File | Fungsi |
| :--- | :--- |
| `resources/js/Pages/Dashboard.vue` | Menampilkan daftar dokumen yang dimiliki pengguna dan tombol untuk membuat dokumen baru. |
| `resources/js/Pages/Editor.vue` | **Inti Aplikasi.** Tempat pengguna mengetik, berkolaborasi secara real-time, melihat kursor teman, dan mencetak dokumen. |

### 🏗️ Tata Letak (Layouts)
| File | Fungsi |
| :--- | :--- |
| `resources/js/Layouts/BootstrapLayout.vue` | Template dasar yang berisi Navbar dan background pink. Semua halaman utama dibungkus oleh file ini. |
| `resources/js/Layouts/GuestLayout.vue` | Digunakan untuk halaman Login dan Register (tampilan minimalis). |

---

## ⚙️ 2. Arsitektur Backend (Logika)
Lokasi utama: `app/` dan `routes/`

### 🎮 Controller (Pengatur Alur)
| File | Fungsi |
| :--- | :--- |
| `app/Http/Controllers/NoteController.php` | Menangani logika pembuatan dokumen, penyimpanan teks ke database, dan mengundang kolaborator. |

### 🗃️ Models & Database
| File | Fungsi |
| :--- | :--- |
| `app/Models/EventNote.php` | Mewakili tabel dokumen di database. Menyimpan judul, konten, dan ukuran kertas. |
| `database/migrations/` | Berisi skema tabel database (tabel users, notes, collaborators, dll). |

### 🛣️ Routing (Jalur Web)
| File | Fungsi |
| :--- | :--- |
| `routes/web.php` | Mendefinisikan alamat URL web (contoh: `/dashboard`, `/notes/{id}`). |

---

## 📡 3. Sistem Real-Time (Kolaborasi)
Fitur "Ajaib" yang membuat pengetikan sinkron antar pengguna.

| Bagian | Fungsi |
| :--- | :--- |
| **Laravel Reverb** | Server WebSocket yang mengirimkan sinyal pengetikan secara instan tanpa delay. |
| **Broadcasting Events** | Mengirimkan data kursor dan teks dari satu browser ke browser lainnya saat terjadi perubahan. |
| **Inertia Whisper** | Fitur yang digunakan di `Editor.vue` untuk mengirim posisi mouse/kursor secara sangat cepat ke pengguna lain. |

---

## 📄 4. Fitur Khusus: Mesin Cetak (Printing)
Lokasi: Bagian `<style>` di dalam `Editor.vue`.
*   Menggunakan `@media print` untuk menghilangkan semua elemen UI (Navbar, tombol) saat dokumen dicetak.
*   Mengatur margin standar dokumen agar hasil print rapi seperti Microsoft Word.

---

## 🚀 Cara Menjalankan Pengembangan
Jika Anda ingin mengerjakan proyek ini lagi di lain waktu, jalankan 3 perintah ini di terminal terpisah:
1. `php artisan serve` (Server Backend)
2. `php artisan reverb:start` (Server Real-time)
3. `npm run dev` (Server Frontend/Tampilan)

---
*Dokumen ini dibuat secara otomatis untuk membantu pemahaman struktur kode aplikasi.*
