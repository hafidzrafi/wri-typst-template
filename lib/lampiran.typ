// lib/lampiran.typ
// Generator tabel Daftar Panitia Offline dengan prefix Koordinator & Anggota

#let render-daftar-panitia-offline(kegiatan-judul, kepanitiaan) = {
  // Hitung dan kumpulkan semua baris panitia
  let baris = ()
  
  // BPH
  if kepanitiaan.at("ketua-pelaksana", default: none) != none {
    baris.push((
      nama: kepanitiaan.ketua-pelaksana.nama,
      jabatan: "Ketua Pelaksana"
    ))
  }
  if kepanitiaan.at("sekretaris", default: none) != none {
    let title = kepanitiaan.at("sekretaris-title", default: "Sekretaris Pelaksana")
    baris.push((
      nama: kepanitiaan.sekretaris.nama,
      jabatan: title
    ))
  }
  if kepanitiaan.at("bendahara", default: none) != none {
    let title = kepanitiaan.at("bendahara-title", default: "Bendahara Pelaksana")
    baris.push((
      nama: kepanitiaan.bendahara.nama,
      jabatan: title
    ))
  }
  
  // Sie-sie
  for sie in kepanitiaan.at("sie-list", default: ()) {
    // Koordinator
    if sie.at("koordinator", default: none) != none {
      baris.push((
        nama: sie.koordinator.nama,
        jabatan: "Koordinator " + sie.nama
      ))
    }
    // Anggota
    for agg in sie.at("anggota", default: ()) {
      baris.push((
        nama: agg.nama,
        jabatan: "Anggota " + sie.nama
      ))
    }
  }

  // Judul Lampiran
  align(center)[
    #text(weight: "bold")[DAFTAR PANITIA #emph[OFFLINE]\ #upper(kegiatan-judul)]
  ]
  v(8pt)

  // Tabel Panitia
  table(
    columns: (1.24cm, 8.00cm, 5.00cm),
    rows: (27.35pt, ..(auto,)*baris.len()),
    align: (center + horizon, left + horizon, center + horizon),
    stroke: 0.5pt,
    inset: (x: 4pt, y: 3pt),
    table.header(
      align(center + horizon)[*NO*],
      align(center + horizon)[*NAMA*],
      align(center + horizon)[*JABATAN*]
    ),
    ..for (idx, p) in baris.enumerate() {
      (
        str(idx + 1) + ".",
        p.nama,
        p.jabatan
      )
    }
  )
}
