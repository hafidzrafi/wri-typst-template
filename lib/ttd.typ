// lib/ttd.typ
// Komponen tanda tangan (Signature Blocks) Proposal Kegiatan WRI Polinema

#let render-box-materai(nominal: "10000") = {
  rect(
    width: 55pt,
    height: 44pt,
    stroke: 0.75pt,
    align(center + horizon)[
      #text(size: 8.5pt, weight: "bold")[Materai\ #nominal]
    ]
  )
}

#let render-ttd-pair(
  ttd-kiri: (
    jabatan: "",
    nama: "",
    id: "",
  ),
  ttd-kanan: (
    jabatan: "",
    nama: "",
    id: "",
  ),
  space: 72pt,
  gutter: 15pt,
) = {
  grid(
    columns: (1fr, 1fr),
    gutter: gutter,
    align: left,
    [
      #ttd-kiri.jabatan,\
      #v(space)
      #ttd-kiri.nama\
      #ttd-kiri.id
    ],
    [
      #ttd-kanan.jabatan,\
      #v(space)
      #ttd-kanan.nama\
      #ttd-kanan.id
    ]
  )
}

#let render-ttd-pernyataan(
  tanggal: "",
  pembina: (
    nama: "",
    nip: "",
    jabatan: "Dosen Pembina Kemahasiswaan",
  ),
  ketua-pelaksana: (
    nama: "",
    nim: "",
  ),
  space: 52pt,
  gutter: 20pt,
) = {
  grid(
    columns: (1fr, 1fr),
    gutter: gutter,
    align: left,

    // Baris 1: Tanggal Malang di kolom kanan
    [], [Malang, #tanggal],

    // Baris 2: Menyetujui di kolom kiri, kolom kanan kosong (1 line di bawah tanggal)
    [Menyetujui,], [],

    // Baris 3: Jabatan sejajar (Dosen Pembina Kemahasiswaan & Ketua Pelaksana)
    [#pembina.jabatan,], [Ketua Pelaksana,],

    // Baris 4: Ruang TTD basah (kiri) & Kotak Materai 10000 (kanan)
    [#v(space)],
    [
      #v(4pt)
      #render-box-materai()
      #v(4pt)
    ],

    // Baris 5: Nama Penandatangan (Sejajar presisi)
    [#pembina.nama], [#ketua-pelaksana.nama],

    // Baris 6: NIP & NIM (Sejajar presisi)
    [NIP. #pembina.nip], [NIM. #ketua-pelaksana.nim],
  )
}
