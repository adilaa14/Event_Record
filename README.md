# RealTime_Doc — Collaborative Document Editor
### *Editor Dokumen Kolaboratif Real-Time dengan Tema Premium Soft Blossom Pink*

<p align="center">
  <img src="https://img.shields.io/badge/Laravel-11-FF2D20?style=for-the-badge&logo=laravel&logoColor=white" alt="Laravel 11" />
  <img src="https://img.shields.io/badge/Vue.js-3-4FC08D?style=for-the-badge&logo=vue.js&logoColor=white" alt="Vue 3" />
  <img src="https://img.shields.io/badge/Inertia.js-1.0-2b2f3c?style=for-the-badge&logo=inertia&logoColor=white" alt="Inertia.js" />
  <img src="https://img.shields.io/badge/Laravel_Reverb-Active-00b0ff?style=for-the-badge&logo=broadcasting&logoColor=white" alt="Laravel Reverb" />
  <img src="https://img.shields.io/badge/Nginx-Laragon-009639?style=for-the-badge&logo=nginx&logoColor=white" alt="Nginx" />
</p>

---

## Tentang Proyek

**RealTime_Doc** adalah aplikasi penyunting dokumen (editor) berbasis web modern yang memungkinkan beberapa pengguna berkolaborasi dan menulis pada dokumen yang sama secara **real-time** tanpa delay. 

Aplikasi ini dibalut dengan estetika **Premium Blossom Pink** yang minimalis, rapi, dan profesional. Dirancang menggunakan arsitektur modern berbasis **Laravel 11**, **Vue.js 3 (Inertia.js)**, serta didukung server WebSocket berkinerja tinggi **Laravel Reverb** untuk sinkronisasi ketikan dan posisi kursor secara instan.

---

## Fitur Utama

*   **Estetika Premium Blossom Pink:** Antarmuka login, register, dashboard, hingga editor yang dikustomisasi dengan nuansa pink pastel yang bersih dan profesional.
*   **Kolaborasi Ketik Real-Time:** Sinkronisasi teks dokumen secara instan antar pengguna yang aktif menggunakan Laravel Reverb.
*   **Kursor Kolaborator Langsung:** Melihat pergerakan dan nama kursor kolaborator lain secara real-time langsung di dalam editor teks.
*   **Daftar Kolaborator Aktif:** Menampilkan siapa saja yang sedang membuka dokumen secara live di sidebar atas.
*   **Log Aktivitas Dinamis:** Riwayat aktivitas seperti pengetikan, penambahan kolaborator, dan perubahan yang terekam secara otomatis.
*   **Riwayat Versi & Pemulihan (Version Control):** Menyimpan riwayat revisi dokumen secara otomatis dan memungkinkan memulihkan (*restore*) dokumen ke versi terdahulu dengan sekali klik.
*   **Pengaturan Kertas & Cetak (Printing):** Pilihan ukuran kertas (A4, F4, Letter, Legal) dengan dukungan pencetakan langsung (`@media print`) yang bersih tanpa menyertakan elemen UI web.
*   **Sistem Hak Akses:** Proteksi dokumen di mana hanya pemilik sah (*owner*) dokumen yang dapat menambah, menghapus, atau memulihkan versi kolaborator.

---

## Stack Teknologi

*   **Backend:** Laravel 11 (PHP 8.2+)
*   **WebSockets:** Laravel Reverb (Sistem Penyiaran Event Real-Time)
*   **Frontend:** Vue.js 3 (Composition API) & Inertia.js 1.0 (Single Page Application)
*   **Styling & UI:** Bootstrap 5, FontAwesome 6, dan Custom CSS Blossom Pink
*   **Database:** MySQL / MariaDB
*   **Development Env:** Laragon (Nginx, MySQL)
*   **Tunneling:** ngrok (dengan Laragon Nginx Reverse Proxy)

---

## Struktur Kode Utama

```bash
RealTime_Doc/
├── app/
│   ├── Http/Controllers/       # Logika utama (NoteController, CollaboratorController, dll)
│   ├── Events/                 # Event real-time WebSocket (ActivityLogged, NoteUpdated, dll)
│   └── Models/                 # Model database (EventNote, Collaborator, Revision, ActivityLog)
├── config/                     # File konfigurasi sistem Laravel
├── database/migrations/        # Migrasi skema database MySQL
├── resources/
│   ├── css/app.css             # Kustomisasi CSS Global & Blossom Pink Theme
│   └── js/
│       ├── Layouts/            # Layout aplikasi (BootstrapLayout, GuestLayout)
│       └── Pages/              # Halaman utama (Dashboard, Editor, Auth Pages)
├── routes/
│   ├── web.php                 # Jalur HTTP Aplikasi
│   └── channels.php            # Jalur Otorisasi WebSocket Reverb
└── vite.config.js              # Konfigurasi Compiler Aset Frontend
```

---

## Panduan Instalasi Lokal

Ikuti langkah-langkah berikut untuk menjalankan proyek di komputer lokal Anda:

### 1. Prasyarat (Laragon Setup)
Pastikan Anda menjalankan **Laragon** (direkomendasikan versi Full) dengan **Nginx** dan **MySQL** yang aktif.

### 2. Kloning & Pemasangan Dependensi
Buka terminal di folder `C:\laragon\www\` dan jalankan:
```bash
# Masuk ke folder proyek
cd RealTime_Doc

# Unduh dependensi backend (PHP)
composer install

# Unduh dependensi frontend (JavaScript)
npm install
```

### 3. Konfigurasi Database
1.  Buka Laragon, klik **Database** (HeidiSQL).
2.  Buat database baru bernama **`realtime_doc`**.
3.  Jalankan migrasi tabel database:
    ```bash
    php artisan migrate
    ```

### 4. Menyiapkan File Lingkungan (`.env`)
Salin file `.env.example` menjadi `.env`, lalu konfigurasikan koneksi database Anda:
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=realtime_doc
DB_USERNAME=root
DB_PASSWORD=
```

### 5. Menjalankan Server Pengembangan
Buka **3 terminal terpisah** di folder proyek Anda dan jalankan perintah berikut:
*   **Terminal 1 (Web Server):**
    ```bash
    php artisan serve
    ```
*   **Terminal 2 (WebSocket Server):**
    ```bash
    php artisan reverb:start --host=0.0.0.0 --port=8080
    ```
*   **Terminal 3 (Compiler Frontend):**
    ```bash
    npm run dev
    ```

Akses website secara lokal di browser melalui: **`http://127.0.0.1:8000`** atau **`http://RealTime_Doc.test`**.

---

## Konfigurasi Publik ngrok + Nginx Reverse Proxy (Terbaik!)

Untuk membagikan proyek ini ke internet agar bisa diakses orang lain dengan **satu terowongan ngrok gratis** tanpa terblokir ISP/Internet Positif:

### 1. Konfigurasi Nginx di Laragon
1.  Buat file **`RealTime_Doc.test.conf`** di folder **`C:\laragon\etc\nginx\sites-enabled\`**.
2.  Gunakan konfigurasi Nginx Reverse Proxy berikut untuk menyatukan lalu lintas Web dan WebSocket:
```nginx
server {
    listen 80;
    server_name RealTime_Doc.test *.RealTime_Doc.test spousal-cauterize-track.ngrok-free.dev;
    root "C:/laragon/www/RealTime_Doc/public";
    
    index index.html index.htm index.php;
 
    location / {
        try_files $uri $uri/ /index.php$is_args$args;
		autoindex on;
    }
    
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass php_upstream;		
    }
	
    # Reverse Proxy untuk WebSocket Reverb ke Port 8080
    location /app {
        proxy_pass http://127.0.0.1:8080;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "Upgrade";
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
	
    charset utf-8;
    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }
    location ~ /\.ht { deny all; }
}
```
3.  **Restart Laragon Nginx** Anda agar aturan ini di-load.

### 2. Konfigurasi `.env` & Kompilasi Aset
Atur alamat di `.env` Anda agar mengarah ke domain statis ngrok Anda:
```env
APP_URL=https://spousal-cauterize-track.ngrok-free.dev

REVERB_HOST="spousal-cauterize-track.ngrok-free.dev"
REVERB_PORT=443
REVERB_SCHEME=https
```
Jalankan kompilasi aset agar mengenali alamat baru ini:
```bash
npm run build
```

### 3. Konfigurasi `ngrok.yml`
Pastikan file konfigurasi ngrok Anda (`C:\Users\<Username>\AppData\Local\ngrok\ngrok.yml`) menggunakan format modern berikut:
```yaml
version: 3
agent:
  authtoken: <TOKEN_NGROK_ANDA>

endpoints:
  - name: laravel_web
    url: https://poncho-purr-selection.ngrok-free.dev
    upstream:
      url: 80
```

### 4. Jalankan Terowongan
Di terminal Anda, cukup jalankan:
```powershell
.\ngrok start --all
```
Kini, website Anda dapat diakses di internet secara aman dan terintegrasi penuh lewat alamat:
**`https://poncho-purr-selection.ngrok-free.dev`**

---

## Panduan Migrasi Proyek ke Laptop Lain

Memindahkan proyek Laravel + Laragon + Reverb ke laptop lain sebenarnya cukup mudah jika dilakukan dengan urutan yang benar. Berikut adalah panduan lengkap langkah-demi-langkah yang perlu Anda lakukan di laptop baru:

### Langkah 1: Persiapan di Laptop Baru
Pastikan laptop baru sudah menginstal software pendukung berikut:
1. **Laragon (Versi Full):** Sangat direkomendasikan karena sudah langsung membundel PHP, MySQL, Nginx, Node.js (npm), dan Git dalam satu instalasi.
2. **Visual Studio Code (VS Code):** Untuk mengedit kode.
3. **ngrok:** Unduh file `ngrok.exe` dan letakkan di folder proyek seperti di laptop lama.

### Langkah 2: Memindahkan File Proyek (Laptop Lama ➡️ Laptop Baru)
1. Di laptop lama, masuk ke folder `C:\laragon\www\`.
2. **Compress / ZIP** folder proyek `RealTime_Doc` Anda.
   > [!TIP]
   > Agar file ZIP tidak terlalu besar dan cepat disalin, Anda boleh menghapus folder `vendor` dan `node_modules` sebelum di-ZIP. Kedua folder ini nantinya bisa diunduh ulang secara otomatis di laptop baru.
3. Pindahkan file ZIP tersebut menggunakan Flashdisk ke laptop baru, lalu **Extract** di dalam folder `C:\laragon\www\` laptop baru.

### Langkah 3: Memindahkan Database
1. **Di Laptop Lama:**
   * Buka Laragon, klik tombol **Database** (HeidiSQL).
   * Klik kanan pada nama database proyek Anda (misal: `realtime_doc`), pilih **Export database as SQL**.
   * Simpan file `.sql` tersebut ke Flashdisk.
2. **Di Laptop Baru:**
   * Buka Laragon, klik **Start All**.
   * Klik **Database** (HeidiSQL) ➡️ Masuk sebagai root.
   * Klik kanan di area kiri, pilih **Create new** ➡️ **Database**, beri nama `realtime_doc`.
   * Klik menu **File** ➡️ **Load SQL file**, pilih file `.sql` dari Flashdisk tadi, lalu tekan tombol **Play** (F9) untuk mengimpor seluruh tabel.

### Langkah 4: Menyiapkan Proyek di Laptop Baru
Buka folder `C:\laragon\www\RealTime_Doc` menggunakan VS Code di laptop baru, buka **Terminal**, lalu jalankan perintah berikut secara berurutan:

1. **Unduh paket PHP Laravel:**
   ```powershell
   composer install
   ```
2. **Unduh paket JavaScript Vue:**
   ```powershell
   npm install
   ```
3. **Salin file konfigurasi .env:**
   * Salin file `.env` dari laptop lama ke folder proyek di laptop baru (pastikan isinya sama, terutama bagian database dan kredensial Reverb).
4. **Kompilasi Aset:**
   ```powershell
   npm run build
   ```

### Langkah 5: Memindahkan Konfigurasi Nginx Custom (Penting untuk WebSocket!)
Agar WebSocket Reverb bisa dilewatkan melalui Nginx seperti di laptop lama:
1. Salin file `RealTime_Doc.test.conf` dari folder `C:\laragon\etc\nginx\sites-enabled\` di laptop lama.
2. Tempel (Paste) file tersebut ke folder yang sama di laptop baru: `C:\laragon\etc\nginx\sites-enabled\`.
3. **Restart Nginx** di Laragon laptop baru (klik Stop lalu Start All pada Laragon).

### Langkah 6: Konfigurasi ngrok di Laptop Baru
1. Buka terminal di laptop baru, daftarkan token ngrok Anda kembali:
   ```powershell
   .\ngrok.exe config add-authtoken <TOKEN_NGROK_ANDA>
   ```
2. Salin isi file `ngrok.yml` Anda dari laptop lama (yang berisi aturan port 80 saja) ke file konfigurasi ngrok di laptop baru.

---

Setelah semua langkah di atas selesai, Anda tinggal menjalankan kembali 2 terminal di laptop baru (tidak perlu `php artisan serve` karena web server sudah ditangani oleh Nginx bawaan Laragon):
1. `php artisan reverb:start --host=0.0.0.0 --port=8080`
2. `.\ngrok.exe start --all`

Proyek Anda langsung aktif kembali 100% di laptop baru!

---

## Lisensi

Proyek ini bersumber terbuka (open-source) di bawah lisensi [MIT License](LICENSE).
