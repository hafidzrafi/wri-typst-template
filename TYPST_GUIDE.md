# Panduan Lengkap Typst & Standar Dokumen WRI

Panduan ini disusun sebagai referensi teknis bagi anggota dan fungsionaris Workshop dan Riset Informatika (WRI) Politeknik Negeri Malang dalam memahami sintaks Typst, cara kerja engine dokumen, serta alur pembuatan dokumen resmi (seperti proposal kegiatan) secara terstandarisasi.

---

## 1. Pengenalan Typst

Typst adalah sistem typesetting berbasis markup generasi baru yang dirancang sebagai alternatif modern untuk LaTeX dan Microsoft Word. Ditulis dalam bahasa pemrograman Rust, Typst menggabungkan kesederhanaan penulisan Markdown dengan fleksibilitas pemrograman dan presisi tipografi tingkat tinggi.

### Perbandingan Karakteristik

| Aspek | Microsoft Word | LaTeX | Typst |
|---|---|---|---|
| **Format Berkas** | Binary / XML tertutup (`.docx`) | Plain Text (`.tex`) | Plain Text (`.typ`) |
| **Version Control (Git)** | Sulit ditrack (binary diff kotor) | Sangat baik | Sangat baik |
| **Kecepatan Kompilasi** | Instan (WYSIWYG) | Lambat (beberapa detik/menit) | Sangat cepat (milidetik) |
| **Kurva Belajar** | Rendah di awal, frustrasi di layout besar | Sangat tinggi, macro kompleks | Rendah ke menengah, sintaks intuitif |
| **Dukungan Scripting** | VBA / Macro terpisah | Macro TeX rumit | Bahasa pemrograman native (fungsi, loop, array, dictionary) |
| **Package Management** | Tidak ada | CTAN (berat, butuh distro gigabyte) | Registry modular otomatis terintegrasi |

---

## 2. Instalasi & Pengaturan Lingkungan (Environment Setup)

### 2.1. Memasang CLI Typst

Pilih perintah instalasi sesuai sistem operasi Anda:

- **macOS (via Homebrew):**
  ```bash
  brew install typst
  ```
- **Windows (via Winget atau Scoop):**
  ```powershell
  winget install --id Typst.Typst
  # atau
  scoop install typst
  ```
- **Linux (Arch Linux / Ubuntu / Cargo):**
  ```bash
  # Arch Linux
  sudo pacman -S typst

  # Cargo (Semua distro Rust)
  cargo install --locked typst-cli
  ```

Verifikasi instalasi dengan menjalankan:
```bash
typst --version
```

### 2.2. Rekomendasi Ekstensi Editor (VS Code / Antigravity IDE)

Untuk pengalaman terbaik dengan live-preview, instal ekstensi berikut di VS Code atau Antigravity IDE:
1. **Tinymist Typst** (direkomendasikan): Menyediakan autocomplete, syntax highlighting, formatting, linter, dan live PDF preview terintegrasi.
2. Pintasan pratinjau: Buka berkas `.typ`, lalu klik tombol pratinjau di pojok kanan atas atau gunakan shortcut `Ctrl+K V` (Windows/Linux) / `Cmd+K V` (macOS).

---

## 3. Tiga Mode Inti Typst (The Three Modes)

Typst memiliki tiga mode eksekusi yang bekerja secara mulus:

```
[Markup Mode]  <--- default (menulis teks, judul, paragraf)
      │
      ├── dipicu oleh simbol '#'  --->  [Code Mode] (variabel, logika, fungsi, import)
      │
      └── dipicu oleh simbol '$'  --->  [Math Mode] (rumus matematika & formula)
```

### 1. Markup Mode (Default)
Mode untuk mengetik teks dan narasi biasa. Karakter khusus ditafsirkan sebagai format teks (misalnya `*` untuk tebal, `_` untuk miring).

### 2. Code Mode (Dipicu oleh `#`)
Mode untuk mengeksekusi komputasi, variabel, pemanggilan fungsi, dan kondisional. Setiap ekspresi diawali dengan `#`:
```typst
#let tahun = 2026
#let nama = "WRI"
Tahun ini #nama berumur #{tahun - 2018} tahun.
```

### 3. Math Mode (Dipicu oleh `$`)
Mode untuk menulis persamaan matematika matematis:
```typst
$ A = pi r^2 $
$ sum_(i=1)^n i = (n(n+1)) / 2 $
```

---

## 4. Sintaks Dasar & Markup Cheatsheet

### 4.1. Struktur Judul (Heading)
```typst
= Judul Tingkat 1 (Heading 1)
== Judul Tingkat 2 (Heading 2)
=== Judul Tingkat 3 (Heading 3)
```

### 4.2. Penekanan Teks (Formatting)
```typst
*Teks Tebal (Bold)*
_Teks Miring (Italic)_
*_Teks Tebal dan Miring_*
`Teks Kode / Monospace`
~Teks Coret (Strikethrough)~
```

### 4.3. Daftar Poin (List & Enum)
```typst
// Unordered List (Bullet)
- Poin pertama
- Poin kedua
  - Sub-poin indentasi

// Numbered List (Enumerate)
+ Langkah kesatu
+ Langkah kedua
+ Langkah ketiga
```

### 4.4. Jarak dan Spasi (Spacing)
- **Spasi Horizontal:** `#h(20pt)` atau `#h(1em)`
- **Spasi Vertikal:** `#v(12pt)` atau `#v(2cm)`
- **Pemisah Halaman:** `#pagebreak()`

### 4.5. Perataan Paragraf (Alignment)
```typst
#align(center)[Teks berada di tengah]
#align(right)[Teks rata kanan]
#align(center + horizon)[Teks pas di tengah-tengah secara vertikal dan horizontal]
```

### 4.6. Menyisipkan Gambar
```typst
#image("assets/logo-polinema.png", width: 4.5cm)
```

---

## 5. Sistem Styling: Aturan `set` dan `show`

Ini adalah konsep terpenting dalam Typst untuk mengontrol tampilan dokumen.

### 5.1. Aturan `set` (Mengubah Properti Bawaan)
Aturan `set` digunakan untuk mengubah nilai konfigurasi standar sebuah elemen:

```typst
// Mengatur ukuran halaman dan margin
set page(
  paper: "a4",
  margin: (top: 3cm, bottom: 3cm, left: 4cm, right: 2.5cm)
)

// Mengatur font global
set text(
  font: "Times New Roman",
  size: 12pt,
  lang: "id"
)

// Mengatur paragraf
set par(
  leading: 0.5em,        // Jarak antar baris
  justify: true,         // Rata kanan-kiri (Justified)
  first-line-indent: 0pt // Indentasi baris pertama
)
```

### 5.2. Aturan `show` (Transformasi Elemen)
Aturan `show` digunakan untuk mencegat elemen dan mengubah tampilannya secara drastis (mirip hook / wrapper):

```typst
// Mengubah setiap heading level 1 agar berlatar abu-abu
show heading.where(level: 1): it => block(
  fill: rgb("E0E0E0"),
  inset: 8pt,
  width: 100%,
  text(weight: "bold", fill: blue)[#it.body]
)
```

---

## 6. Layout Tingkat Lanjut: Grid, Table, dan Box

### 6.1. Grid (Struktur Tata Letak Tanpa Garis)
Gunakan `grid` untuk menyusun tata letak berdampingan seperti formulir atau kolom tanda tangan:

```typst
#grid(
  columns: (80pt, 10pt, 1fr),
  row-gutter: 4pt,
  [Nama], [:], [Hafidz Rafi Rabbani],
  [NIM], [:], [244107020000],
  [Jurusan], [:], [Teknologi Informasi]
)
```

### 6.2. Table (Penyajian Data Bergaris)
Gunakan `table` untuk data tabular yang membutuhkan border, header, dan cell merging:

```typst
#table(
  columns: (1.5cm, 1fr, 3cm),
  stroke: 0.5pt,
  inset: 6pt,
  align: (center + horizon, left + horizon, right + horizon),
  table.header(
    [*No.*], [*Nama Barang*], [*Harga*]
  ),
  [1.], [Sertifikat Peserta], [Rp150.000,00],
  [2.], [Konsumsi Pemateri], [Rp100.000,00],
  table.cell(colspan: 2, align: center)[*Total*],
  [*Rp250.000,00*]
)
```

---

## 7. Pemrograman & Scripting di Typst

Typst adalah bahasa fungsional murni (*pure functional language*).

### 7.1. Variabel dan Tipe Data
```typst
#let nama-organisasi = "Workshop dan Riset Informatika"
#let tahun-berdiri = 2018
#let isActive = true
#let divisi = ("Software", "Multimedia", "Networking", "AI") // Array
#let profil = (nama: "Ketua WRI", periode: "2026/2027")       // Dictionary
```

### 7.2. Percabangan (`if` - `else`)
```typst
#let sumber-dana = ("Kas WRI", "Dana DIPA")

#if sumber-dana.len() == 1 [
  Sumber dana tunggal: #sumber-dana.at(0)
] else [
  Sumber dana gabungan:
  #for dana in sumber-dana [
    - #dana
  ]
]
```

### 7.3. Perulangan (`for`)
```typst
#let panitia = ("Rafi", "Savero", "Dinda")

#for (idx, nama) in panitia.enumerate() [
  #str(idx + 1). #nama \
]
```

### 7.4. Membuat Fungsi Kustom
```typst
#let card-info(judul, isi, warna: blue) = {
  rect(
    stroke: 1pt + warna,
    radius: 4pt,
    fill: warna.lighten(90%),
    inset: 10pt,
    width: 100%
  )[
    #text(weight: "bold", fill: warna)[#judul]\
    #v(4pt)
    #isi
  ]
}

// Pemanggilan fungsi:
#card-info("Pengumuman Penting", "Rapat koordinasi dimulai pukul 19.00 WIB.")
```

---

## 8. Alur Kerja Praktis Proposal WRI

Dalam repositori ini, seluruh kebutuhan proposal kegiatan WRI telah diatur dalam arsitektur modular di direktori `docs/proposal/`.

```
docs/proposal/
├── template.typ                 <-- Berkas acuan pembuatan proposal baru
├── early-access-reproduced.typ  <-- Berkas acuan referensi visual 1:1
└── lib/                         <-- Pustaka komponen terisolasi
    ├── proposal.typ             # Master engine (margin, font, heading 1 banner)
    ├── cover.typ                # Layout cover depan
    ├── pernyataan.typ           # Surat pernyataan kapel + kotak materai
    ├── pengesahan.typ           # Lembar pengesahan (3-tier signatures)
    ├── kepanitiaan.typ          # Struktur kepanitiaan
    ├── acara.typ                # Tabel rundown kegiatan
    ├── rab.typ                  # Perhitungan otomatis subtotal & total RAB
    ├── lampiran.typ             # Tabel panitia offline dengan prefix resmi
    └── terbilang.typ            # Konverter angka ke kata rupiah bahasa Indonesia
```

### 8.1. Panduan Membuat Proposal Kegiatan Baru

1. **Duplikasi Template:**
   Salin berkas `docs/proposal/template.typ` menjadi berkas baru sesuai nama kegiatan Anda:
   ```bash
   cp docs/proposal/template.typ docs/proposal/proposal-web-development.typ
   ```

2. **Perbarui Data Variabel:**
   Buka berkas baru tersebut dan modifikasi kamus data di bagian atas:
   - `ketua-pelaksana`: Masukkan nama, NIM, jurusan, nomor HP.
   - `kepanitiaan`: Masukkan nama BPH dan seksi-seksi (`sie-list`) beserta koordinator dan anggotanya.
   - `sumber-dana`: Masukkan estimasi sumber anggaran.
   - `pengeluaran`: Masukkan pos belanja tiap sie. **Subtotal tiap sie, total biaya akhir, angka pada lembar pengesahan, dan ejaan terbilang rupiah akan dihitung otomatis oleh Typst.**

3. **Tulis Isi Narasi Batang Tubuh:**
   Tulis latar belakang, tujuan, waktu pelaksanaan, dan penutup menggunakan teks biasa.

4. **Kompilasi ke PDF:**
   Jalankan perintah kompilasi:
   ```bash
   # Kompilasi sekali
   typst compile docs/proposal/proposal-web-development.typ output.pdf

   # Mode Watch (otomatis update saat berkas disimpan)
   typst watch docs/proposal/proposal-web-development.typ output.pdf --open
   ```

---

## 9. Masalah Umum & Solusi (Troubleshooting & Pitfalls)

### 1. Perbedaan Spasi 1.5 Microsoft Word vs Typst
- **Masalah:** Mengatur `leading: 1.5em` di Typst menghasilkan spasi yang jauh lebih renggang daripada Word.
- **Penyebab:** Di Microsoft Word, spasi 1.5 baris berarti jarak antar *baseline* adalah `150% x font size` (18pt pada font 12pt). Di Typst, `leading` adalah jarak *antara bagian bawah baris atas ke bagian atas baris bawah*, bukan antar baseline.
- **Solusi:** Gunakan `leading: 0.5em` pada font 12pt (`12pt + 6pt = 18pt line pitch`), persis seperti yang diimplementasikan pada [lib/proposal.typ](lib/proposal.typ).

### 2. Error: `cannot join string with content`
- **Masalah:** Terjadi error saat menggabungkan string biasa dengan blok teks Typst.
- **Solusi:** Gunakan interpolasi `#` atau konversikan tipe datanya:
  ```typst
  // Salah:
  let teks = "Halo " + [Dunia]

  // Benar:
  let teks = [Halo #dunia]
  // atau
  let nama = "Dunia"
  let teks = "Halo " + nama
  ```

### 3. Halaman Bertambah Tanpa Disengaja (*Page Spilling*)
- **Masalah:** Dokumen meluap ke halaman baru padahal isi konten terlihat sedikit.
- **Penyebab:** Umumnya disebabkan oleh padding tabel (`inset`), spasi vertikal (`v(...)`), atau margin halaman yang melebihi batas printable area A4.
- **Solusi:** Periksa `inset: (y: ...)` pada tabel dan kecilkan nilai `v(...)`. Pada lembar pengesahan, gunakan margin khusus:
  ```typst
  set page(margin: (top: 2.25cm, bottom: 1.75cm, left: 4.0cm, right: 2.5cm))
  ```

### 4. Format List Menjorok Tidak Rata
- **Masalah:** Baris kedua dari penomoran daftar kembali ke tepi kiri.
- **Solusi:** Atur properti `indent` dan `body-indent` menggunakan `pad`:
  ```typst
  #pad(left: 18pt)[
    #set enum(indent: 0pt, body-indent: 18pt)
    + Poin pertama dengan penjelasan panjang yang otomatis rata pada baris selanjutnya.
  ]
  ```

