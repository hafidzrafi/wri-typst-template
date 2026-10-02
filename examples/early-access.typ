#import "../lib/proposal.typ": *

#show: proposal

// ==========================================
// 1. DATA KEGIATAN & KEPANITIAAN
// ==========================================

#let ketua-pelaksana = (
  nama: "Nobbel Kaisar Bhumi",
  nim: "254107020098",
  jurusan: "Teknologi Informasi",
  prodi: "D-IV Teknik Informatika",
  alamat: "Jl. Sekargadung No.34, Banjararum, Singosari, Malang",
  telp: "087847512517"
)

#let kepanitiaan = (
  ketua-pelaksana: ketua-pelaksana,
  sekretaris: (nama: "Indhira Yuantika Christy", nim: "244107020171"),
  bendahara: (nama: "Dil-Awar Harun El Rashid", nim: "244107020229"),
  sekretaris-title: "Sekretaris Pelaksana",
  bendahara-title: "Bendahara Pelaksana",
  sie-list: (
    (
      nama: "Sie Acara",
      koordinator: (nama: "Mohammad Hafidz Rafi' Rabbani", nim: "254107020084"),
      anggota: (
        (nama: "Muhammad Unggul Satria Adjie", nim: "254107020040"),
        (nama: "Surya Sadikin Firdaus", nim: "254107020105"),
      )
    ),
    (
      nama: "Sie Kesekretariatan",
      koordinator: (nama: "Salsabila Keisha Ayu Setiadi", nim: "254107020048"),
      anggota: (
        (nama: "Resya Fajar Putra Pratama", nim: "254107020124"),
        (nama: "Aulia Resty Azizah", nim: "244107020015"),
      )
    ),
    (
      nama: "Sie Humas",
      koordinator: (nama: "Melvin Karya Wiryawan", nim: "254107060076"),
      anggota: (
        (nama: "Nindya Aulia Sari Hardyanto", nim: "254107020033"),
        (nama: "Marvelino Husca", nim: "254107020184"),
      )
    ),
    (
      nama: "Sie Pubdekdok",
      koordinator: (nama: "Lembah Manah", nim: "254107020014"),
      anggota: (
        (nama: "Geraldi Rama Nugraha", nim: "254107020100"),
        (nama: "Rizal Maulana Hakimullah", nim: "254107060012"),
      )
    ),
    (
      nama: "Sie Konsumsi",
      koordinator: (nama: "Kinanti Nailah Ambarwati", nim: "254107060007"),
      anggota: (
        (nama: "Aliyah Mafazah", nim: "254107060049"),
        (nama: "Muhammad Farhan", nim: "264107027002"),
      )
    ),
    (
      nama: "Sie Perlengkapan",
      koordinator: (nama: "Pandhu Arya Munjalindra", nim: "254107060090"),
      anggota: (
        (nama: "Adrian Alexander Sanda", nim: "254107020138"),
        (nama: "Ayusha Marella Arisanti", nim: "254107060027"),
      )
    ),
  )
)

#let sumber-dana = (
  (
    uraian: "Swadana",
    rincian: (
      (uraian: "Kas WRI", jumlah: 499000),
    )
  ),
)

#let pengeluaran = (
  "Sie Acara": (
    (uraian: [#emph[Snack Reward] (3 #emph[set] x \@Rp12.000)], jumlah: 36000),
    (uraian: [#emph[Keychain] (10 #emph[pcs] x \@Rp5.000)], jumlah: 50000),
    (uraian: [#emph[Coaster] (8 #emph[pcs] x \@Rp6.000)], jumlah: 48000),
  ),
  "Sie Kesekretariatan": (
    (uraian: "Cetak Presensi (16 lembar x @Rp500)", jumlah: 8000),
    (uraian: "Cetak Proposal Kegiatan (12 lembar x @Rp500)", jumlah: 6000),
    (uraian: "Cetak Surat Peminjaman (6 lembar x @Rp500)", jumlah: 3000),
    (uraian: "Cetak Surat Pernyataan Ketua Pelaksana", jumlah: 500),
    (uraian: "Cetak LPJ Kegiatan (15 lembar x @Rp500)", jumlah: 7500),
    (uraian: "Materai Rp10.000 (1 lembar x @Rp12.000)", jumlah: 12000),
    (uraian: "Jilid Proposal Kegiatan (2 buah x @Rp3.000)", jumlah: 6000),
    (uraian: [Cetak #emph[Text] MC (20 lembar x \@Rp500)], jumlah: 10000),
    (uraian: "Cetak Sertifikat Panitia (22 lembar x @Rp1.000)", jumlah: 22000),
  ),
  "Sie Konsumsi": (
    (uraian: "Air Galon Isi Ulang", jumlah: 7000),
    (uraian: [#emph[Snack] (87 #emph[pcs] x \@Rp2.500)], jumlah: 217500),
    (uraian: [Air mineral 600ml (10 #emph[pcs] x \@Rp3.000)], jumlah: 30000),
    (uraian: "Gula (1kg @Rp18.000)", jumlah: 18000),
    (uraian: [#emph[Cup] gelas (1 #emph[pack] \@Rp7.500)], jumlah: 7500),
    (uraian: [Teh celup (1 #emph[pack] \@Rp10.000)], jumlah: 10000),
  )
)

#let total-biaya = hitung-total-pengeluaran(pengeluaran)

// ==========================================
// HALAMAN 1: COVER
// ==========================================
#render-cover(
  ketua-pelaksana: ketua-pelaksana,
  tahun: "2026"
)

#pagebreak()

// ==========================================
// HALAMAN 2: SURAT PERNYATAAN KAPEL
// ==========================================
#render-surat-pernyataan(
  ketua-pelaksana: ketua-pelaksana,
  nama-kegiatan: [Workshop Riset Informatika – #emph[Early Access]],
  hari-kegiatan: "Minggu",
  tanggal-pelaksanaan-teks: "hari Minggu tanggal 4 bulan Oktober tahun 2026",
  jam-pelaksanaan: "09.00",
  periode-wri: "2026/2027",
  tanggal-surat: "25 September 2025"
)

#pagebreak()

// ==========================================
// HALAMAN 3: LEMBAR PENGESAHAN
// ==========================================
#render-lembar-pengesahan(
  nama-kegiatan: [Workshop Riset Informatika – #emph[Early Access]],
  sub-judul: [#emph[OPEN TALK] KE-23 WORKSHOP DAN RISET INFORMATIKA],
  ketua-pelaksana: ketua-pelaksana,
  waktu-pelaksanaan: "Minggu, 4 Oktober 2026",
  tempat-pelaksanaan: [Ruang LSI 1, LSI 2, LSI 3 Lantai 6 Gedung Teknik\ Sipil Politeknik Negeri Malang],
  total-biaya: total-biaya,
  sumber-dana-list: ("Swadana",), // Single source without hyphen
  panitia-count: 21,
  peserta-count: 60,
  peserta-keterangan: [Mahasiswa Baru Jurusan Teknologi\ Informasi Politeknik Negeri Malang],
  tanggal-pengesahan: "10 September 2026"
)

#pagebreak()
#set page(margin: (top: 3.0cm, bottom: 3.0cm, left: 4.0cm, right: 2.5cm))

// ==========================================
// HALAMAN 4: BATANG TUBUH (BAGIAN I, II, III)
// ==========================================

= I. PENDAHULUAN

== 1.1. Latar Belakang
#pad(left: 21.3pt)[
  #set par(first-line-indent: (amount: 32.4pt, all: true))
  #emph[Early Access] merupakan suatu kegiatan dari Workshop dan Riset Informatika di Politeknik Negeri Malang. Kegiatan tersebut secara umum dilakukan untuk mengenalkan komunitas Workshop dan Riset Informatika, serta sekaligus #emph[sharing] ilmu kepada mahasiswa Politeknik Negeri Malang, khususnya Jurusan Teknologi Informasi. Kegiatan ini diharapkan juga dapat menjadi wadah #emph[sharing] dan diskusi antara komunitas dan mahasiswa, terutama halnya tentang pengetahuan dasar ataupun terbaru, yang berkaitan dengan bidang Teknologi Informasi.

  Dalam Workshop Riset Informatika – #emph[Early Access] ini mengusung tema pengenalan komunitas Workshop dan Riset Informatika (WRI #emph[Early Access]). Dalam menjalani perkuliahan, mahasiswa IT tentunya harus mempersiapkan diri. Untuk itu dibutuhkan pembekalan terkait apa saja yang perlu dilakukan supaya dapat produktif di bangku perkuliahan, kiat-kiat dalam belajar, serta pengenalan kegiatan pembelajaran melalui diskusi dan tutor sebaya seperti yang telah diterapkan pada Workshop dan Riset Informatika.
]

== 1.2. Landasan Kegiatan
#pad(left: 21.3pt)[
  AD/ART Workshop dan Riset Informatika Politeknik Negeri Malang periode\ 2026/2027.
]

#v(18pt)
= II. NAMA KEGIATAN
#v(12pt)
#align(center)[“Workshop Riset Informatika – #emph[Early Access]”]
#v(18pt)

= III. TEMA KEGIATAN
#v(12pt)
#align(center)[“Workshop Riset Informatika – #emph[Early Access]”]
#v(12pt)

#pagebreak()

// ==========================================
// HALAMAN 5: BATANG TUBUH (BAGIAN IV, V, VI)
// ==========================================

= IV. TUJUAN KEGIATAN
Tujuan diadakan Program Kerja ini adalah:
#pad(left: 18.0pt)[
  #set enum(indent: 0pt, body-indent: 18.0pt, spacing: 12pt)
  + Memperkenalkan komunitas Workshop Riset dan Informatika.
  + Mengetahui program serta kegiatan yang ada di Workshop dan Riset Informatika.
  + Memberikan informasi terkait berbagai manfaat yang diperoleh jika bergabung dengan Workshop dan Riset Informatika.
  + Memberikan kesempatan untuk berbagi cerita bersama Alumni WRI yang telah masuk ke dunia kerja.
]

#v(18pt)
= V. WAKTU DAN TEMPAT KEGIATAN
Waktu dan tempat pelaksanaan kegiatan  ini adalah:
#pad(left: 21.3pt)[
  #grid(
    columns: (80pt, 12pt, 1fr),
    row-gutter: 10pt,
    [hari, tanggal], [:], [Minggu, 4 Oktober 2026],
    [waktu], [:], [09.00 – 14.55 WIB],
    [tempat], [:], [Ruang LSI 1, LSI 2, LSI 3 Lantai 6 Gedung Teknik Sipil Politeknik Negeri Malang]
  )
]

#v(18pt)
= VI. SASARAN KEGIATAN
Sasaran kegiatan ini adalah :
#pad(left: 18.0pt)[
  #set enum(indent: 0pt, body-indent: 18.0pt)
  + Mahasiswa Baru Jurusan Teknologi Informasi Politeknik Negeri Malang tahun 2026.
]

#pagebreak()

// ==========================================
// HALAMAN 6: SUSUNAN KEPANITIAAN (BAGIAN 1)
// ==========================================

= VII. SUSUNAN KEPANITIAAN
#render-susunan-kepanitiaan(
  kepanitiaan: kepanitiaan,
  tampilkan-petinggi: true,
  sie-start: 1,
  sie-end: 4
)

#pagebreak()

// ==========================================
// HALAMAN 7: SUSUNAN KEPANITIAAN (BAGIAN 2)
// ==========================================

#v(12pt)
#render-susunan-kepanitiaan(
  kepanitiaan: kepanitiaan,
  tampilkan-petinggi: false,
  sie-start: 5,
  sie-end: 6
)

#pagebreak()

// ==========================================
// HALAMAN 8: SUSUNAN ACARA
// ==========================================

= VIII. SUSUNAN ACARA
#render-susunan-acara((
  (
    hari-tanggal: [Minggu, 4 Oktober 2026],
    sesi: (
      (waktu: "09.00 – 09.50", acara: emph("Open Gate & Registrasi")),
      (waktu: "10.00 – 10.10", acara: emph("Opening")),
      (waktu: "10.10 – 10.25", acara: "Sambutan"),
      (waktu: "10.25 – 11.05", acara: "Materi dari Kakak-Kakak Alumni WRI dan Tanya Jawab"),
      (waktu: "11.05 – 11.25", acara: emph[Coffee Break & Game/Ice\ Breaking]),
      (waktu: "11.25 – 12.25", acara: emph[Sharing Divisi & Tanya\ Jawab]),
      (waktu: "12.25 – 12.45", acara: emph("FGD with Pemateri")),
      (waktu: "12.45 – 12.55", acara: emph("Closing MC")),
      (waktu: "12.55 – 13.55", acara: "Berkemas dan Inventaris"),
      (waktu: "13.55 – 14.55", acara: [Evaluasi & Laporan Penanggung\ Jawab]),
    )
  ),
))

#pagebreak()

// ==========================================
// HALAMAN 9: ALOKASI DANA (SUMBER DANA & SIE 1-2)
// ==========================================

= IX. ALOKASI DANA

== 9.1 SUMBER DANA
#render-sumber-dana(sumber-dana)

== 9.2 PENGELUARAN TIAP SIE
#render-pengeluaran-sie(pengeluaran, sie-names: ("Sie Acara", "Sie Kesekretariatan"), sie-offset: 1)

#pagebreak()

// ==========================================
// HALAMAN 10: ALOKASI DANA (SIE 3 & REKAPITULASI)
// ==========================================

#v(12pt)
#render-pengeluaran-sie(pengeluaran, sie-names: ("Sie Konsumsi",), sie-offset: 3)

== 9.3 TOTAL PENGELUARAN
#render-rekapitulasi(pengeluaran)

#pagebreak()

// ==========================================
// HALAMAN 11: PENUTUP
// ==========================================

= X. PENUTUP
#v(6pt)

#h(21.3pt) Demikian proposal Workshop Riset Informatika – #emph[Early Access] ini kami susun dengan sesungguh-sungguhnya, guna terlaksananya program kerja Workshop dan Riset Informatika Politeknik Negeri Malang periode 2026/2027.

Untuk merealisasikannya, kami sangat berharap kerja sama dan bantuan semua pihak yang terkait baik secara moral maupun spriritual demi kesuksesan penyelenggaraan kegiatan ini.

Atas kesediaan dan perhatian semua pihak, kami mengucapkan terima kasih.

#pagebreak()

// ==========================================
// HALAMAN 12: LAMPIRAN (DAFTAR PANITIA OFFLINE)
// ==========================================
#render-daftar-panitia-offline(
  [#emph[OPEN TALK] KE-23 WORKSHOP DAN RISET INFORMATIKA],
  kepanitiaan
)
