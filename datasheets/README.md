# Datasheets

**Naming convention:** `<part_number>_<vendor>_<short_name>.pdf`
- `part_number` — the **manufacturer** part number (not the CPC/Farnell order code).
- `vendor` — the manufacturer / brand.
- `short_name` — a short, hyphenated description of what it is.

CPC/Farnell order codes are recorded against the order in the project's shopping-list
ticket, tracked outside this repo — not in the filename.

## Current datasheets

| File | Part | Vendor | Order code | What it is |
|------|------|--------|-----------|------------|
| `TM15-24_ABB_transformer.pdf` | TM15/24 | ABB | Farnell 3293957 | 230V→24V AC bell transformer, 15VA |
| `HDR-15-5_MeanWell_5V-PSU.pdf` | HDR-15-5 | Mean Well | CPC PW04665 | 230V→5V DC DIN PSU, 2.4A |
| `221-413_Wago_lever-connector.pdf` | 221-413 | Wago | CPC CN20136 | 3-way lever splicing connector |
| `ESP32-WROOM-32_Espressif_MCU-module.pdf` | ESP32-WROOM-32 | Espressif | Amazon (ELEGOO board) | ESP32 module — GPIO/pinout reference |
| `GR17016_CE-TEK_IP65-enclosure.pdf` | GR17016 | CE-TEK | CPC EN84548 | IP65 ABS enclosure, 310×240×100mm |

## Missing

- **8-channel relay module** (ELEGOO, Amazon) — no official ELEGOO datasheet. The board uses
  **SONGLE SRD-05VDC-SL-C** relays; grab that component datasheet for the real contact ratings.
