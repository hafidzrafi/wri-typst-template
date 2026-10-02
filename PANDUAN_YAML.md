# Panduan Pengisian Proposal Berbasis YAML (WRI Polinema)

Panduan ini ditujukan untuk Sekretaris dan Panitia Pelaksana Kegiatan Workshop dan Riset Informatika (WRI) Polinema yang ingin membuat proposal kegiatan **tanpa perlu memahami atau menyentuh sintaks Typst**.

---

## 1. Konsep Dasar

Alur kerja ini memisahkan antara **data kegiatan** dan **desain/layout dokumen**:

- **`proposal.yaml` (File Data):** Berkas teks sederhana tempat Anda mengisi seluruh informasi proposal (nama kegiatan, ketua pelaksana, tanggal, kepanitiaan, susunan acara, dan RAB).
- **`proposal-runner.typ` (Engine Runner):** Berkas Typst otomatis yang membaca data dari `proposal.yaml` dan merendernya sesuai standar resmi Polinema (12 halaman). Anda **tidak perlu** mengedit berkas ini.

---

## 2. Cara Pengisian `proposal.yaml`

Buka berkas `proposal.yaml` menggunakan teks editor pilihan Anda (VS Code, Notepad, dsb).

### Aturan Format YAML:
1. **Nilai Teks:** Ditulis di sebelah kanan tanda titik dua (`:`) di dalam tanda kutip `"..."`.
   ```yaml
   kegiatan:
     nama: "Workshop Riset Informatika – Early Access"
   ```
2. **Nilai Angka / Nominal:** Tulis angka murni tanpa tanda titik pemisah ribuan.
   ```yaml
   biaya:
     jumlah: 500000    # Benar (akan diformat otomatis menjadi Rp500.000,00)
     # jumlah: 500.000 # SALAH! Jangan gunakan titik
   ```
3. **Daftar Berbutir (List):** Diawali tanda strip (`-`) diikuti satu spasi.
   ```yaml
   tujuan:
     - "Memperkenalkan kultur riset WRI."
     - "Meningkatkan kemampuan problem solving peserta."
   ```
4. **Indentasi (Spasi):** Gunakan spasi (bukan tab) untuk merapikan tingkatan data.

---

## 3. Kompilasi Menjadi PDF

Setelah selesai mengisi atau mengubah data di `proposal.yaml`, buka terminal pada direktori ini dan jalankan perintah:

```bash
typst compile proposal-runner.typ proposal.pdf
```

Berkas `proposal.pdf` akan langsung terbuat dalam waktu kurang dari satu detik dengan format layout yang presisi dan rapi.

---

## 4. Keuntungan Alur Ini
1. **Aman:** Tidak ada risiko susunan tabel atau grid tanda tangan berantakan karena salah hapus tanda kurung atau koma.
2. **Mudah Digunakan Bersama:** Cukup kirim file `proposal.yaml` ke koordinator divisi untuk melengkapi data masing-masing.
3. **Kompatibel:** Format PDF hasil kompilasi 100% identik dengan standar proposal WRI.
