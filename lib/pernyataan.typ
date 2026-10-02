// lib/pernyataan.typ
// Layout Surat Pernyataan Ketua Pelaksana (Kegiatan Offline)

#let render-surat-pernyataan(
  ketua-pelaksana: (
    nama: "",
    nim: "",
    prodi: "D-IV Teknik Informatika",
    jurusan: "Teknologi Informasi",
    alamat: "",
    telp: ""
  ),
  nama-kegiatan: "",
  hari-kegiatan: "",
  tanggal-pelaksanaan-teks: "", // e.g. "hari Minggu tanggal 4 bulan Oktober tahun 2026"
  jam-pelaksanaan: "", // e.g. "09.00" atau "08.30 – 11.05"
  periode-wri: "2026/2027",
  tanggal-surat: "25 September 2025",
  pembina: (
    nama: "Anugrah Nur Rahmanto, S.Sn, M.Ds.",
    nip: "199112302019031016",
    jabatan: "Dosen Pembina Kemahasiswaan"
  )
) = {
  set page(margin: (top: 1.8cm, bottom: 1.2cm, left: 4.0cm, right: 2.5cm))
  set par(leading: 0.75em, spacing: 10pt, justify: true, first-line-indent: 0pt)

  align(center)[
    #underline[#text(weight: "bold", size: 12pt)[SURAT PERNYATAAN]]
  ]
  v(8pt)

  [Saya yang bertanda tangan dibawah ini.]
  v(8pt)

  grid(
    columns: (52pt, 10pt, 1fr),
    row-gutter: 7.0pt,
    [Nama], [:], [#ketua-pelaksana.nama],
    [NIM], [:], [#ketua-pelaksana.nim],
    [Prodi], [:], [#ketua-pelaksana.prodi],
    [Jurusan], [:], [#ketua-pelaksana.jurusan],
    [Alamat], [:], [#ketua-pelaksana.alamat],
    [Telp/Hp], [:], [#ketua-pelaksana.telp],
  )

  v(8pt)
  [adalah ketua pelaksana kegiatan #nama-kegiatan, pada Workshop dan Riset Informatika Politeknik Negeri Malang.]

  v(8pt)
  [Pada #tanggal-pelaksanaan-teks diselenggarakan kegiatan #nama-kegiatan di Politeknik Negeri Malang. Unsur kepanitiaan kegiatan adalah mahasiswa aktif yang menjadi anggota fungsionaris Workshop dan Riset Informatika periode #periode-wri.]

  v(8pt)
  [Untuk itu saya menyatakan dengan sebenarnya bahwa:]
  v(6pt)

  show enum: set par(leading: 12pt, justify: true)
  set enum(indent: 0pt, body-indent: 14pt, spacing: 12pt)
  [
    + Kegiatan ini dilaksanakan secara Luring (#emph[Offline]) dengan menerapkan protokol kesehatan yang ketat sesuai dengan arahan dari kampus dan pemerintah.
    + Dalam pelaksanaan kegiatan tersebut, panitia pelaksana tidak akan bertindak untuk mencederai fisik atau mental peserta kegiatan.
    + Dalam pelaksanaan kegiatan apabila terjadi kekerasan fisik atau mental yang mengakibatkan cidera fisik maupun mental peserta kegiatan, yang dilakukan oleh panitia menjadi tanggung jawab panitia pelaksana, bukan tanggung jawab institusi.
    + Apabila terjadi tindakan pelanggaran hukum dalam kegiatan, menjadi tanggung jawab panitia pelaksanaan, bukan tanggung jawab institusi.
    + Kegiatan ini dilaksanakan pada pukul #jam-pelaksanaan WIB.
  ]

  v(8pt)
  [Demikian surat pernyataan ini saya buat dengan penuh kesadaran dan tanggung jawab.]

  v(14pt)

  // Tanggal Malang di kanan atas
  grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    [],
    [Malang, #tanggal-surat]
  )
  v(12pt) // Kosong 1 line

  // Signature Block menggunakan grid multi-baris agar NAMA SEJAJAR PRESISI
  grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    align: (left, left),

    // Baris 1: Jabatan
    [
      Menyetujui,\
      #pembina.jabatan,
    ],
    [
      Ketua Pelaksana,
    ],

    // Baris 2: Ruang tanda tangan & materai
    [
      #v(66pt)
    ],
    [
      #v(6pt)
      #rect(
        width: 55pt,
        height: 44pt,
        stroke: 0.75pt,
        align(center + horizon)[
          #text(size: 8.5pt, weight: "bold")[Materai\ 10000]
        ]
      )
      #v(6pt)
    ],

    // Baris 3: Nama (SEJAJAR)
    [
      #pembina.nama
    ],
    [
      #ketua-pelaksana.nama
    ],

    // Baris 4: NIP & NIM (SEJAJAR)
    [
      NIP. #pembina.nip
    ],
    [
      NIM. #ketua-pelaksana.nim
    ]
  )
}
