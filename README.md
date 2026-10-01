# WRI Proposal Typst Template

Standard proposal document template for Workshop dan Riset Informatika (WRI) Politeknik Negeri Malang, built with Typst.

This repository provides an automated typesetting engine that replaces legacy Microsoft Word workflows. It handles layout calibration, Polinema academic margins, heading banner styles, signature tiers, dynamic committee lists, and automatic budget (RAB) calculations.

## Requirements

Install the Typst CLI (version 0.11 or later):

```bash
# macOS
brew install typst

# Windows
winget install --id Typst.Typst

# Linux (Arch)
sudo pacman -S typst
```

For VS Code or Antigravity IDE users, install the **Tinymist Typst** extension for live previews and autocomplete.

## Quick Start

1. Clone or download this repository.
2. Edit `template.typ` to update your event data:
   - `ketua-pelaksana`: Name, NIM, department, and contact info.
   - `kepanitiaan`: Core committee and division members.
   - `sumber-dana` and `pengeluaran`: Budget entries. Subtotals, totals, and Indonesian Rupiah spelling are calculated automatically.
   - Main body text (Background, Objectives, Time/Place, and Closing).
3. Compile the document:

```bash
typst compile template.typ proposal.pdf
```

To enable live reloads while editing:

```bash
typst watch template.typ proposal.pdf --open
```

## Repository Structure

```
.
├── template.typ          # Main proposal template
├── lib/                  # Reusable document modules
│   ├── proposal.typ      # Page margins, typography, and heading banner styling
│   ├── cover.typ         # Cover page layout and banner styling
│   ├── pernyataan.typ    # Letter of statement (Surat Pernyataan)
│   ├── pengesahan.typ    # 3-tier approval sheet (Lembar Pengesahan)
│   ├── kepanitiaan.typ   # Dynamic committee structure generator
│   ├── acara.typ         # Event rundown table generator
│   ├── rab.typ           # Budget calculations and table renderers
│   ├── lampiran.typ      # Offline committee appendix with official prefixes
│   └── terbilang.typ     # Pure Typst Indonesian currency-to-words converter
├── assets/               # Official visual assets (Polinema logo)
├── examples/             # Full reference document examples
│   └── early-access.typ  # Early Access proposal example
├── TYPST_GUIDE.md        # Comprehensive Typst syntax and workflow handbook
├── LICENSE               # MIT License
└── README.md
```

## Compiling Examples

Reference examples located in the `examples/` directory import components from `lib/`. When compiling from the repository root, specify `--root .`:

```bash
typst compile --root . examples/early-access.typ output.pdf
```

## Documentation

A complete guide covering Typst syntax, styling rules (`set` / `show`), layouts, scripting, and troubleshooting is available in [TYPST_GUIDE.md](TYPST_GUIDE.md).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
