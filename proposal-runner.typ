// proposal-runner.typ
// Engine Proposal WRI Polinema berbasis data eksternal (proposal.yaml)
// Pengguna TIDAK PERLU mengedit file ini. Cukup edit data di 'proposal.yaml'.

#import "lib/proposal.typ": *

#let data = yaml("proposal.yaml")

#show: proposal

// ====================================================================
// 1. DATA TRANSFORMATION & MAPPING DARI YAML
// ====================================================================

#let ketua-pelaksana = (
  nama: data.ketua_pelaksana.nama,
  nim: str(data.ketua_pelaksana.nim),
  prodi: data.ketua_pelaksana.prodi,
  jurusan: data.ketua_pelaksana.jurusan,
  alamat: data.ketua_pelaksana.alamat,
  telp: str(data.ketua_pelaksana.telp),
)

#let sie-list = ()
#for d in data.kepanitiaan.divisi {
  let anggota-list = ()
  for a in d.anggota {
    anggota-list.push((nama: a.nama, nim: str(a.nim)))
  }
  sie-list.push((
    nama: d.nama,
    koordinator: (nama: d.koordinator.nama, nim: str(d.koordinator.nim)),
    anggota: anggota-list,
  ))
}

#let kepanitiaan = (
  ketua-pelaksana: ketua-pelaksana,
  sekretaris: (nama: data.kepanitiaan.sekretaris.nama, nim: str(data.kepanitiaan.sekretaris.nim)),
  bendahara: (nama: data.kepanitiaan.bendahara.nama, nim: str(data.kepanitiaan.bendahara.nim)),
  sekretaris-title: "Sekretaris Pelaksana",
  bendahara-title: "Bendahara Pelaksana",
  sie-list: sie-list,
)

#let sumber-dana = ()
#for s in data.anggaran.sumber_dana {
  let rincian = ()
  if "rincian" in s and s.rincian != none {
    for r in s.rincian {
      rincian.push((uraian: r.uraian, jumlah: r.jumlah))
    }
  }
  sumber-dana.push((uraian: s.uraian, rincian: rincian))
}

#let pengeluaran = (:)
#for sie-group in data.anggaran.pengeluaran {
  let items = ()
  for it in sie-group.items {
    items.push((uraian: it.uraian, jumlah: it.jumlah))
  }
  pengeluaran.insert(sie-group.sie, items)
}

#let total-biaya = hitung-total-pengeluaran(pengeluaran)
#let sumber-dana-names = ()
#for s in data.anggaran.sumber_dana {
  sumber-dana-names.push(s.uraian)
}

// ====================================================================
// HALAMAN 1: COVER
// ====================================================================
#render-cover(
  nama-kegiatan: [PROPOSAL KEGIATAN\ #upper(data.kegiatan.nama)],
  tema-kegiatan: [“#upper(data.kegiatan.tema)”],
  ketua-pelaksana: ketua-pelaksana,
  organisasi: data.kegiatan.organisasi,
  institusi: data.kegiatan.institusi,
  tahun: str(data.kegiatan.tahun),
)

#pagebreak()

// ====================================================================
// HALAMAN 2: SURAT PERNYATAAN KAPEL
// ====================================================================
#render-surat-pernyataan(
  ketua-pelaksana: ketua-pelaksana,
  nama-kegiatan: data.kegiatan.nama,
  hari-kegiatan: data.jadwal.hari,
  tanggal-pelaksanaan-teks: data.jadwal.tanggal_teks,
  jam-pelaksanaan: data.jadwal.jam_pernyataan,
  periode-wri: data.kegiatan.periode_wri,
  tanggal-surat: data.administrasi.tanggal_surat_pernyataan,
)

#pagebreak()

// ====================================================================
// HALAMAN 3: LEMBAR PENGESAHAN
// ====================================================================
#render-lembar-pengesahan(
  nama-kegiatan: data.kegiatan.nama,
  sub-judul: data.kegiatan.sub_judul,
  ketua-pelaksana: ketua-pelaksana,
  waktu-pelaksanaan: data.jadwal.tanggal,
  tempat-pelaksanaan: data.jadwal.tempat,
  total-biaya: total-biaya,
  sumber-dana-list: sumber-dana-names,
  panitia-count: 1 + 1 + 1 + sie-list.map(s => 1 + s.anggota.len()).sum(),
  peserta-count: data.administrasi.peserta_count,
  peserta-keterangan: data.administrasi.peserta_keterangan,
  tanggal-pengesahan: data.administrasi.tanggal_pengesahan,
)

#pagebreak()

// ====================================================================
// HALAMAN 4: BATANG TUBUH (BAB I S.D. BAB III)
// ====================================================================
= I. PENDAHULUAN

== 1.1. Latar Belakang
#pad(left: 21.3pt)[
  #set par(first-line-indent: (amount: 32.4pt, all: true))
  #for p in data.narasi.latar_belakang [
    #p \
  ]
]

== 1.2. Landasan Kegiatan
#pad(left: 21.3pt)[
  #data.narasi.landasan_kegiatan
]

#v(18pt)
= II. NAMA KEGIATAN
#v(12pt)
#align(center)[“#data.kegiatan.nama”]
#v(18pt)

= III. TEMA KEGIATAN
#v(12pt)
#align(center)[“#data.kegiatan.tema”]
#v(12pt)

#pagebreak()

// ====================================================================
// HALAMAN 5: TUJUAN, WAKTU & SASARAN
// ====================================================================
= IV. TUJUAN KEGIATAN
Tujuan diadakan Program Kerja ini adalah:
#pad(left: 18.0pt)[
  #set enum(indent: 0pt, body-indent: 18.0pt, spacing: 12pt)
  #for t in data.narasi.tujuan [
    + #t
  ]
]

= V. WAKTU DAN TEMPAT KEGIATAN
Waktu dan tempat pelaksanaan kegiatan  ini adalah:
#pad(left: 10pt)[
  #grid(
    columns: (80pt, 10pt, 1fr),
    row-gutter: 10pt,
    [hari, tanggal], [:], [#data.jadwal.tanggal],
    [waktu], [:], [#data.jadwal.jam],
    [tempat], [:], [#data.jadwal.tempat],
  )
]

= VI. SASARAN KEGIATAN
Sasaran kegiatan ini adalah :
#for s in data.narasi.sasaran [
  + #s
]

#pagebreak()

// ====================================================================
// HALAMAN 6 & 7: SUSUNAN KEPANITIAAN
// ====================================================================
= VII. SUSUNAN KEPANITIAAN
#render-susunan-kepanitiaan(
  kepanitiaan: kepanitiaan,
  tampilkan-petinggi: true,
  sie-start: 1,
  sie-end: 4,
)

#pagebreak()

#v(20pt)
#render-susunan-kepanitiaan(
  kepanitiaan: kepanitiaan,
  tampilkan-petinggi: false,
  sie-start: 5,
  sie-end: sie-list.len(),
)

#pagebreak()

// ====================================================================
// HALAMAN 8: SUSUNAN ACARA
// ====================================================================
= VIII. SUSUNAN ACARA
#let acara-data = ()
#for d in data.susunan_acara {
  let sesi-list = ()
  for s in d.sesi {
    sesi-list.push((waktu: s.waktu, acara: s.acara))
  }
  acara-data.push((hari-tanggal: d.hari_tanggal, sesi: sesi-list))
}
#render-susunan-acara(acara-data)

#pagebreak()

// ====================================================================
// HALAMAN 9 & 10: ALOKASI DANA (RAB)
// ====================================================================
= IX. ALOKASI DANA

== 9.1 SUMBER DANA
#render-sumber-dana(sumber-dana)

#let sie-names-all = ()
#for s in data.anggaran.pengeluaran {
  sie-names-all.push(s.sie)
}

== 9.2 PENGELUARAN TIAP SIE
#render-pengeluaran-sie(pengeluaran, sie-names: sie-names-all.slice(0, 2), sie-offset: 1)

#pagebreak()

#render-pengeluaran-sie(pengeluaran, sie-names: sie-names-all.slice(2, 4), sie-offset: 3)

== 9.3 TOTAL PENGELUARAN
#render-rekapitulasi(pengeluaran)

#pagebreak()

// ====================================================================
// HALAMAN 11: PENUTUP
// ====================================================================
= X. PENUTUP
#v(6pt)

#h(21.3pt) #data.narasi.penutup.paragraf_1

#data.narasi.penutup.paragraf_2

Atas kesediaan dan perhatian semua pihak, kami mengucapkan terima kasih.

#pagebreak()

// ====================================================================
// HALAMAN 12: LAMPIRAN PANITIA OFFLINE
// ====================================================================
#render-daftar-panitia-offline(
  upper(data.kegiatan.nama),
  kepanitiaan,
)
