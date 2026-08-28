# Datasheets

Manufacturer documentation for every part in the Petrichor build.

**Naming convention:** `<part_number>_<vendor>_<short_name>.pdf`
- `part_number` — the **manufacturer** part number (not the CPC/Farnell/EGI order code).
- `vendor` — the manufacturer / brand.
- `short_name` — a short, hyphenated description of what it is.

Order codes (CPC, Farnell, EGI) are recorded against the order in
`docs/plumbing-rebuild.md` and the shopping-list ticket — **not** in the filename.

## Sourcing rules

- **Manufacturer sites only.** rainbird.com, hunterirrigation.com, hansenproducts.com,
  plasson.co.uk / plasson.com, espressif.com, meanwell.com, wago.com, abb.com.
  A retailer PDF, a marketplace listing or a datasheet-aggregator mirror is **not**
  a source. If nothing manufacturer-issued exists, that is recorded as unavailable
  rather than papered over with a worse source.
- **Metric / international edition wins.** This is a UK build: BSP threads, bar, litres.
  Rain Bird and Hunter both publish separate US and metric documents and *they do not
  always agree*. Where they differ, the divergence is called out below.
- **Re-fetching.** `hunterirrigation.com` returns **HTTP 403** to plain `curl`/`wget`. Its
  documents fetch fine with a browser-like request — a real `User-Agent`, `Accept-Language`,
  `Sec-Fetch-*` headers and a **same-origin `Referer`** (`https://www.hunterirrigation.com/`).
  A `Referer` from anywhere else still 403s. rainbird.com, hansenproducts.com and Plasson's
  CDN serve to plain `curl`.
- **Page extracts.** A few entries are page ranges lifted from a large manufacturer
  catalogue (Rain Bird's 164-page international catalogue, Plasson's 246-page technical
  catalogue) because the manufacturer publishes no standalone sheet for that part. The
  content is unaltered; the full-catalogue URL and the page numbers are given so the
  extract can be checked against the original.

---

## Water side

| File | Part | Vendor | Edition | What it is | Source | Retrieved |
|---|---|---|---|---|---|---|
| `I100-DV_RainBird_solenoid-valve-metric.pdf` | I100-DV / I100-DVF | Rain Bird | **Metric / BSP** | DV/DVF series page from the 2023 *International* Landscape Turf catalogue (p. 54). The BSP valve is catalogued as **`I100-DV`** — the `I` prefix is the international/BSP variant. Carries the 50/60 Hz solenoid figures, bar pressure-loss tables and cm dimensions. | [2023 International Landscape Turf Products Catalog](https://www.rainbird.com/sites/default/files/media/documents/2022-11/d42140_2023_intl_turf_catalog_v3_eng.pdf) — PDF p. 54 | 2026-08-25 |
| `100-DVF_RainBird_solenoid-valve.pdf` | 100-DV / 100-DVF | Rain Bird | **US** | DV/DVF/ASVF Tech Spec. Still Rain Bird's current revision (no newer exists) but it is the **US** sheet — 60 Hz coil figures, psi-first. Kept for the cutaway, filter detail and the model matrix. ⚠ Its electrical figures are superseded for a 50 Hz build — see *Contradictions*. | [ts_dv-dvf-asvf.pdf](https://www.rainbird.com/sites/default/files/media/documents/2018-02/ts_dv-dvf-asvf.pdf) (= [/media/4650](https://www.rainbird.com/media/4650)) | 2026-08-25 (unchanged since 2026-07-19) |
| `1301-410_RainBird_4-way-valve-manifold.pdf` | RB1301-410 | Rain Bird | **Metric / BSP** | PVC Manifold System pages from the 2023 International catalogue (PDF p. 66). `RB1301-410` = 4-outlet manifold, 1" F × 4 outlets 1" M swivel × 1" M, 10.5 bar. Also covers **MTT-100** manifold tee — 1" (26/34) BSP, **120 mm long per valve**, which is the only manufacturer-published valve-pitch figure. ⚠ **Rain Bird publishes no dimensions for the 1301-410 itself** — see *Could not obtain*. | [2023 International Landscape Turf Products Catalog](https://www.rainbird.com/sites/default/files/media/documents/2022-11/d42140_2023_intl_turf_catalog_v3_eng.pdf) — PDF p. 66 · HTML product page: [PVC Manifold System](https://www.rainbird.com/products/pvc-manifold-system) | 2026-08-25 |
| `VB-Series_RainBird_valve-boxes-metric.pdf` | VB series | Rain Bird | **Metric** | VB Series valve boxes page from the 2023 International catalogue (PDF p. 70). Gives the outer dimensions the repo's box comparison already uses: VB-STD 59.0 × 49.1 × 31.8 cm, VB-JMB 70.0 × 53.2 × 31.6 cm. | [2023 International Landscape Turf Products Catalog](https://www.rainbird.com/sites/default/files/media/documents/2022-11/d42140_2023_intl_turf_catalog_v3_eng.pdf) — PDF p. 70 | 2026-08-25 |
| `VB-STD_RainBird_valve-box.pdf` | VB-STD | Rain Bird | US (dual-unit) | Standard Series valve box Tech Spec. **The only source for the lid/top aperture** — Top Opening 36.8 × 23.9 cm, Maximum Top 44.4 × 33.1 cm, Bottom Opening 47.6 × 35.9 cm, Maximum Bottom 59.0 × 49.0 cm. Knock-out sizes and the model-code decoder. | [ts_valvebox_STD.pdf](https://www.rainbird.com/sites/default/files/media/documents/2018-02/ts_valvebox_STD.pdf) | 2026-08-25 |
| `VB-JMB_RainBird_valve-box.pdf` | VB-JMB | Rain Bird | US (dual-unit) | Jumbo Series valve box Tech Spec. Min Top Opening 47.4 × 30.9 cm, Maximum Top 56.7 × 40.2 cm, Min Bottom Opening 61.1 × 44.2 cm, Maximum Bottom 70.1 × 53.3 cm. | [ts_valvebox_JMB.pdf](https://www.rainbird.com/sites/default/files/media/documents/2018-02/ts_valvebox_JMB.pdf) | 2026-08-25 |
| `VB-SPR_RainBird_super-jumbo-valve-box.pdf` | VB-SPR | Rain Bird | US (dual-unit) | Super Jumbo Series valve box Tech Spec. Top Opening 57.1 × 33.0 cm, Maximum Top 69.1 × 45.2 cm, Bottom Opening 73.1 × 49.6 cm, Maximum Bottom 84.1 × 60.6 cm, Height 38.1 cm. **The only UK-available box with a clear opening wider than the measured 500 mm manifold** — rejected on price (£282–£322) and depth. | [ts_valvebox_SPR.pdf](https://www.rainbird.com/sites/default/files/media/documents/2018-02/ts_valvebox_SPR.pdf) | 2026-08-27 |
| `DBRY-6_3M_direct-bury-splice-INSTRUCTIONS.pdf` | DBR/Y-6 | 3M (sold by Rain Bird as `DBR/Y`) | Metric+imperial | **The install manual for the waterproof splices in EGI144337.** Rain Bird publish no manual of their own — the part *is* the 3M kit, so 3M's sheet is the primary source. 5 steps, wire-combination table, and the small-gauge push-down note. | [3M instruction sheet](https://multimedia.3m.com/mws/media/660391O/3m-direct-bury-splice-kit-dbry-6-instruction-sheet.pdf) | 2026-08-27 |
| `DBRY-6_3M_direct-bury-splice-datasheet.pdf` | DBR/Y-6 | 3M | Metric+imperial | Data sheet, Jan 2019. 600 V max; application temp **0–49 °C**; operating −40 to 105 °C; UL 486D wet/damp/direct-bury/submersible; **IP68 but "not recommended for long-term continuous submersion"**; tube 3.7in long, 1in dia. Full wire-combination chart. | [3M data sheet](https://multimedia.3m.com/mws/media/653865O/3m-direct-bury-splice-kit-dbr-y-6-data-sheet-78-8129-9255-6-c.pdf) | 2026-08-27 |
| `PROS-04-PRS40-CV_Hunter_spray-body-metric.pdf` | PROS-04-PRS40-CV | Hunter | **Metric (EM)** | Pro-Spray PRS40 product cutsheet, metric edition (rev. 2022-06). Regulates to **2.8 bar / 280 kPa**; operating range 1.0–7.0 bar; **grey cap**; ½" inlet; FloGuard; retracted 15.5 cm / pop-up 10 cm / exposed dia. 5.7 cm. ⚠ Thread *standard* is not stated — see *Contradictions*. | [CA-Cutsheet-PRS40-EM.pdf](https://www.hunterirrigation.com/sites/default/files/CA-Cutsheet-PRS40-EM.pdf) | 2026-08-25 |
| `MP3500_Hunter_MP-rotator-nozzle-metric.pdf` | MP3500-90 | Hunter | **Metric (EM)** | Standard MP Rotator product cutsheet, metric (rev. 2024-04). Full **MP3500 performance table in bar / m³·h⁻¹ / l·min⁻¹ / mm·h⁻¹** for 90°, 180°, 210°. Also MP1000/2000/3000 and the specialty nozzles. Supersedes the 2013 MP3500-only brochure. | [CA-Cutsheet-MP-Rotator-EM.pdf](https://www.hunterirrigation.com/sites/default/files/CA-Cutsheet-MP-Rotator-EM.pdf) | 2026-08-25 |
| `LIT-461_Hunter_MP-rotator-design-guide-metric.pdf` | LIT-461 Rev J | Hunter | **Metric (EM)** | MP Rotator **Design Guide**, metric, Rev J (2024-08). The full performance data set for every MP nozzle at 2.1–3.8 bar and every arc, plus spacing, precipitation-rate and matched-precipitation design tables, and the model matrix showing which arcs each nozzle is made in. | [LIT-461-RevJ-DG-MPR-EM-web_1.pdf](https://www.hunterirrigation.com/sites/default/files/2024-08/LIT-461-RevJ-DG-MPR-EM-web_1.pdf) | 2026-08-25 |
| `HRB2520_Hansen_reducing-bush.pdf` | HRB2520 / SRB2520 | Hansen Products (NZ) | Metric + imperial | True Fit Threaded Fittings brochure. Reducing Bush **SRB** family, sizes include **25 × 20 mm**; glass-fibre reinforced nylon; precision heavy-duty **tapered** threads; WRAS-approved; installation rule *"finger tight plus one to two turns — no more"*. | [hansenproducts.com — 25×20 mm Reducing Bush](https://www.hansenproducts.com/products/pipe-fittings/true-fit-threaded-fittings/25x20mm-reducing-bush) → *True Fit Threaded Fittings Brochure* | 2026-08-25 |
| `TrueFit_Hansen_threaded-fittings-pressure-spec.pdf` | True Fit range | Hansen Products (NZ) | Metric + imperial | True Fit threaded-fittings spec one-pager. **Maximum working pressure 16 bar (232 psi) @ 20 °C for sizes 15–50 mm** (10 bar for 80–100 mm). Manufacturer-class confirmation of the 16 bar figure the build notes previously carried only on trade-supplier authority. Max water temperature **60 °C** (from Hansen's own product FAQ). | [hansenproducts.com — 25×20 mm Reducing Bush](https://www.hansenproducts.com/products/pipe-fittings/true-fit-threaded-fittings/25x20mm-reducing-bush) → *True Fit Threaded Fittings Cheat Sheet* | 2026-08-25 |
| `SilverLine_Plasson_compression-fittings.pdf` | Silver Line 1401xx–1485xx | Plasson | **Metric, ISO** | Silver Line chapter (pp. 246–260) of Plasson's *Technical Catalogue 2026*. Full dimensioned product tables — including **Male Adaptor `140200020007` = 20 mm × ¾"** and **Female Adaptor `140300020007`** — plus the **Technical Specifications page**: materials, ISO 17885, 10 bar, thread standards and the complete 16–63 mm assembly method. **This settles the pipe-liner question — see below.** | [Plasson_Fittings-Catalog_Black_2026.pdf](https://s3.eu-west-1.amazonaws.com/plasson.media/wp-content/uploads/2026/03/10093844/Plasson_Fittings-Catalog_Black_2026.pdf) (Plasson's own CDN, linked from [plasson.com download centre](https://flowsolutions.plasson.com/download-center/)) — PDF pp. 232–246 | 2026-08-25 |

### The pipe-liner question — **SETTLED**

`SilverLine_Plasson_compression-fittings.pdf`, Technical Specifications page (catalogue p. 260):

- **Materials — the complete component list is four parts:** Body — polypropylene copolymer ·
  Nut — polypropylene copolymer · **Split Ring — polyacetal (POM)** · Seal — nitrile rubber.
  **There is no liner among the components of a Silver Line fitting.**
- **Installation Instructions For Fittings 16 mm – 63 mm** — cut square, chamfer, undo the nut to
  the last thread, *"twist the pipe into the fitting through the split ring and rubber seal to the
  pipe stop"*, tighten. **No liner or insert step exists.** Lubricate with silicone to ease entry.
- The **Pipe Liner for PE SDR 11 Pipe is a separate catalogue item, code `07950`** (20 mm =
  `079500020`, sized *pipe OD × wall thickness* = 20 × 1.9 mm), filed under **Tooling** with its
  own pack quantities. It is bought separately — it does not ship inside the fitting.
- The **Grip Ring `07970` is specified "for UPVC and PP pipe"**, i.e. not for PE/MDPE at all.

⇒ The white acetal part inside each 20 mm connector is the **split ring**. Nothing is missing.

---

## Electrical side

| File | Part | Vendor | Order code | What it is | Edition / revision | Source | Retrieved |
|---|---|---|---|---|---|---|---|
| `ESP32-WROOM-32_Espressif_MCU-module.pdf` | ESP32-WROOM-32 | Espressif | Amazon (ELEGOO board) | ESP32 module datasheet — GPIO map, strapping pins, DC characteristics | **v3.7** (2026-08-06, 46 pp) — ⬆ **replaced** v3.6 (2025-08-08, 45 pp). v3.7 adds `VIH_nRST` to the DC-characteristics table, restructures §1 into Features + Ordering Information, fixes UART/I²C typos. | [esp32-wroom-32_datasheet_en.pdf](https://www.espressif.com/sites/default/files/documentation/esp32-wroom-32_datasheet_en.pdf) | 2026-08-25 |
| `HDR-15-5_MeanWell_5V-PSU.pdf` | HDR-15-5 | Mean Well | CPC PW04665 | 230 V → 5 V DC DIN-rail PSU, 2.4 A, universal input 85–264 VAC, Class II | **`HDR-15-SPEC 2026-04-03`** — ⬆ **replaced** `HDR-15-20240311`. Pinout (1 = +V, 2 = −V, 3 = AC/N, 4 = AC/L), 5 V / 2.4 A and Vo ADJ 4.5–5.5 V all unchanged. | [HDR-15-SPEC.PDF](https://www.meanwell.com/Upload/PDF/HDR-15/HDR-15-SPEC.PDF) — note `productPdf.aspx?i=…` now 404s; the `Upload/PDF/HDR-15/` path is the live one | 2026-08-25 |
| `SRD-05VDC-SL-C_Songle_5V-relay.pdf` | SRD-05VDC-SL-C | Songle | (fitted to the ELEGOO board) | SRD (T73) series subminiature relay — coil parameters, contact ratings, approvals | **"Version Number: V1"**, issued 2025-11-28 — ⬆ **replaced** a 2015/2018 copy of unknown provenance. ⚠ Two caveats: it is a CorelDRAW print-to-PDF, so it is **image-based and will not grep** — read it on render; and the file here has been **recompressed with Ghostscript** from Songle's 13 MB original to 0.8 MB (no visible loss; re-download the URL if you need the byte-exact original). | [srd-t73-relay-290486.pdf](https://www.songlerelay.com/upload/8670/srd-t73-relay-290486.pdf), linked from [songlerelay.com/srd-t73-relay.html](https://www.songlerelay.com/srd-t73-relay.html) | 2026-08-25 |
| `GR17016_CE-TEK_IP65-enclosure.pdf` | GR17016 | CE-TEK | CPC EN84548 | IP65 ABS enclosure, 310 × 240 × 100 mm — CE-GR range brochure | 2017-09-04 — ✅ **current, proven.** The file here is **byte-identical** (md5 `a6d6f08a…`) to CE-TEK's live brochure, so this is a hash match rather than a date guess. CE-TEK publishes only three CE-GR PDFs, all 2017, all still current. | [CE-GR-ABS-Enclosure-brochure.pdf](https://www.ce-tek.co.uk/wp-content/uploads/2017/09/CE-GR-ABS-Enclosure-brochure.pdf) — note the domain is **ce-tek.co.uk**; `ce-tek.com` does not resolve | 2026-08-25 |
| `221-413_Wago_lever-connector.pdf` | 221-413 | Wago | CPC CN20136 | 3-way lever splicing connector, 450 V / 32 A, 0.14–4 mm² | Wago `221-413_EN` **Version 19.09.2023** (5 pp) — ⛔ **stale, not replaced.** A newer Wago revision exists (6 pp, 2024–2025 version stamps). See *Could not obtain*. | [wago.com — 221-413](https://www.wago.com/gb/installation-terminal-blocks-and-connectors/splicing-connector-with-levers/p/221-413) | file dates from 2023 |
| `TM15-24_ABB_transformer.pdf` | TM15/24 (2CSM228745R0802) | ABB | Farnell 3293957 | 230 V → 24 V AC fail-safe bell transformer, 15 VA, SELV secondary, Class II, centre-tapped | 2019-11-29 browser capture — ⛔ **not replaced, and this is as good as it gets.** ABB issues **no datasheet PDF** for this part; the "Data Sheet" on ABB's product page is an on-page HTML table, and this file is a print of exactly that. So it is not a lost document — it is the document. See *Could not obtain*. | [new.abb.com — TM15/24](https://new.abb.com/products/2CSM228745R0802/tm15-24-fail-safe-bell-transformer) | file dates from 2019 |
| `ELEGOO_DC_5v_Relay_Module/` | — | ELEGOO | Amazon | Vendor support bundle as shipped: 8-channel module sheet, optocoupler schematic, board size chart, a partial copy of the Songle SRD sheet, and an example `.ino`. **Vendor bundle, not a manufacturer datasheet** — kept because it is the only source for the board's terminal layout and optocoupler wiring. | as shipped, 2017–2022 files | — | 2026-07-30 |

---

## ⚠ Contradictions with what the repo currently documents

Read this section before trusting a figure already written into
`docs/wiring-and-cable-grades.md`, `docs/plumbing-rebuild.md` or `specs/build-guide.md`.

### 1. Valve solenoid current — the 50 Hz figures are published, not derived

`docs/wiring-and-cable-grades.md` § *Getting 24 V out of the transformer* says the datasheet's
0.30 A / 0.19 A are 60 Hz figures and **derives** ~0.34 A inrush / 0.22 A holding for 50 Hz, with
coil resistance 42–55 Ω.

Rain Bird's **international** catalogue states the 50 Hz figures outright and they are higher:

| | Repo (derived) | US tech spec (60 Hz) | **Rain Bird international (50/60 Hz)** |
|---|---|---|---|
| Inrush | 0.34 A / ~8 VA | 0.30 A / 7.2 VA | **0.450 A / 10.8 VA** |
| Holding | 0.22 A / ~5 VA | 0.19 A / 4.6 VA | **0.250 A / 6.0 VA** |
| Coil resistance | 42–55 Ω | 42–55 Ω | **38 Ω** |

The conclusion (*one zone at a time is fine on 15 VA; don't gang zones*) still holds — 6.0 VA
holding is 40 % of the TM15/24 — but the margin is thinner than documented, and the field-cable
note's *"~0.3 A per valve"* should read **0.25 A holding / 0.45 A inrush**.

### 2. MP3500 has no 360° model — the "flow @ 360°" figure is the 210° figure

`docs/plumbing-rebuild.md` § *Hunter performance data* tabulates
`MP3500 … Flow @ 360° = 12.45 L/min`. Hunter's design guide model matrix lists the MP3500 in **one
model only — `MP350090`, adjustable 90°–210°**. There is no MP3500-210 or MP3500-360. **12.45 l/min
is the 210° flow at 2.8 bar**, not a full-circle flow. (MP1000/2000/3000 *do* have 360° models and
those repo figures check out: 3.18 / 5.61 / 13.80 l/min.)

### 3. `20 mm × 1"` Plasson fittings **do exist** — the "rejected option" was rejected on a wrong premise

`docs/plumbing-rebuild.md` § *Rejected options* says *"Plasson Silverline male connectors do not
exist in 20 mm × 1" BSPM. The range jumps from 20 mm × ¾" to 25 mm × 1"."* The § *inline filter*
note likewise says *"There is no 20 mm × 1" BSPF in the Plasson range."*

Plasson's own 2026 technical catalogue lists both:

| Product code | Description |
|---|---|
| **`140200020010`** | Silver Line **Male** Adaptor, **20 mm × 1"** (R 1", ISO 7-1 taper) |
| **`140300020010`** | Silver Line **Female** Adaptor, **20 mm × 1"** (Rp 1", ISO 7-1 parallel) |

Consequence worth weighing: `140200020010` would take 20 mm MDPE **straight into the 100-DV's 1"
BSP female port**, deleting the Hansen reducing bush entirely — and with it the plastic-taper-into-
plastic-port joint that cross-threaded and killed the first valve. Not a recommendation yet:
catalogue listing ≠ EGI stock, and availability needs checking before anything is re-planned.

### 4. Thread standard — now manufacturer-encoded on both sides of the joint

Good news, and stronger evidence than the repo currently cites:

- **Rain Bird:** the international catalogue's model line is **`I100-DV: 1" BSP female × female`**,
  with the footnote inverted from the US sheet — *"\* Available with **NPT** threads"*. The `I`
  prefix **is** the BSP variant; the number does encode the standard after all. (The repo says
  *"That number does not encode the thread standard"* — true of the US `100-DV`, not of `I100-DV`.)
- **Plasson:** *"Threads marked "R", "Rp" and "Rc" are according to **ISO 7-1**. Threads marked "G"
  are according to **ISO 228**."* The Silver Line male-adaptor table's size column is headed
  **`Size d x R`** ⇒ `140200020007` is **R ¾" = tapered male BSP**. No NPT anywhere in the range.
- **Hansen:** `HRB2520`, **BSPT × BSPT** — manufacturer product page. Note **both** threads are
  tapered, not just the male; the repo only flags the male.

### 5. Hunter never states the PRS40 inlet thread standard — in *any* edition

`docs/plumbing-rebuild.md` says *"Hunter **US** catalogue: ½" **NPT** female"*. That could not be
reproduced. Checked and found silent on the standard: the metric cutsheet, the **US** cutsheet
(`CA-Cutsheet-PRS40-US.pdf`), the metric Pro-Spray specifier brochure
(`rc-070-br-pro-sprayspecifier-em-web.pdf`) and the metric product page — every one says only
*"Inlet size: ½""*. So there is no Hunter NPT claim to weigh against EGI's BSP spec field; there is
simply **no manufacturer statement either way**. The dry-fit test before burying anything is still
the only thing that will settle it.

Supporting the repo's suspicion about that EGI listing: Hunter's metric cutsheet says
**"Grey cap for easy field identification"** for the PRS40, confirming EGI's "Brown Cap" copy is
pasted from the PRS30.

### 6. Valve-box comparison is not like-for-like — and Rain Bird disagrees with itself on height

- The box table in `docs/plumbing-rebuild.md` puts the **HydroSure lid aperture (500 × 365 mm)** in
  the same table as **Rain Bird base dimensions**. Rain Bird's *top* openings are much smaller:
  **VB-STD 36.8 × 23.9 cm**, **VB-JMB 47.4 × 30.9 cm** (max top 56.7 × 40.2 cm). If the lid aperture
  is the working constraint — and it is — the Rain Bird row needs its top-opening figures, not its
  base figures, before the two can be compared.
- Rain Bird's **metric catalogue** gives VB-STD/VB-JMB height as **31.8 / 31.6 cm** (which is where
  the repo's numbers came from — they are correctly transcribed); its **US tech spec sheets** give
  **30.7 cm for both**. ~11 mm, manufacturer-vs-manufacturer. Not decision-changing, but don't
  treat either as precise.

### 7. Manifold pitch — a manufacturer number now exists

The box fit-check assumes *"~130 mm spacing"* between valves. Rain Bird's own **MTT-100** manifold
tee, the part designed for exactly this job (*"1 MTT-100 per electric valve"*, *"properly spaces
valves"*), is published as **120 mm long**. The repo's assumption is slightly conservative, which is
the right direction. Valve body itself: **11.1 cm long × 8.4 cm wide × 11.4 cm high** (DV;
DVF is 14.2 cm high) — from the metric catalogue, replacing any estimate.

### 8. Valve pressure loss — `specs/build-guide.md` quotes the wrong configuration's figure

Build guide § 7D step 7: *"The 1" valve is oversized for ~5 gpm (**loss ~0.17 bar**)"*.
Rain Bird's metric pressure-loss tables give **two** charts, and 0.17 bar is off the wrong one:

| Flow | 100-DV/DVF **in-line** (the valve bought) | 100-DV **Angle / Male×Barb** |
|---|---|---|
| 4 l/min | 0.23 bar | **0.17 bar** ← the quoted figure |
| 10 l/min | 0.24 bar | 0.19 bar |
| **20 l/min** (≈ the measured 19 L/min supply) | **0.26 bar** | 0.21 bar |

Real loss at this system's flow is **~0.26 bar**, ~50 % more than documented. Against a 3.8 bar
supply it changes nothing — but two valves in series would be ~0.5 bar, worth knowing before the
permanent manifold is designed.

### 9. MP3000 maximum radius is 9.1 m, not 9.0 m

`specs/build-guide.md` § 8A twice quotes the MP3000 as **6.7–9.0 m**; `docs/plumbing-rebuild.md`
uses the correct **6.7–9.1 m**. Hunter metric: **6.7 to 9.1 m**. 100 mm, and normally not worth
mentioning — except the whole MP3000-vs-MP3500 argument turns on whether 8.9 m fits inside the
top of that range, so the two documents should not disagree about where the top is.

### 10. Plasson assembly method — two steps missing from the build note

`docs/plumbing-rebuild.md` § *Assembly method* step 1 is *"Fit a liner into every MDPE pipe end"*.
Per §*The pipe-liner question* above that step should go. Plasson's own method adds two the repo
does not have: **chamfer the cut pipe end**, and **lubricate with silicone** before insertion. Also
Plasson's: *"If fittings are reused, ensure split ring is sharp and bites into pipe to avoid pull
outs. Alternatively replace split ring"* — relevant to the connectors that have been cycled.

### 11. Songle relay — two figures in the verification log can now be corrected

Both from the current Songle SRD (T73) sheet. Neither changes a decision; both are flagged
"⚠ not re-checked" in `docs/wiring-and-cable-grades.md`, so they can now be marked verified.

- **Coil current: 72.0 mA, not 71.4 mA.** Coil Parameters, 0.36 W (L) row: 5 VDC nominal →
  **coil resistance 69.4 Ω ±10 %** ⇒ 5 / 69.4 = **72.0 mA**. The repo's 71.4 mA implies exactly
  70 Ω. 0.6 mA — the 5 V budget line (ESP32 ~250 mA + one coil) is unaffected.
  *(The `-SL-` in `SRD-05VDC-SL-C` is what selects the 0.36 W coil; the 0.45 W "D" variant would be
  55 Ω / 91 mA. Worth knowing if a board is ever replaced with a different suffix.)*
- **DC contact rating: 28 VDC, not 30 VDC.** Rated resistive load is
  **7 A / 10 A / 15 A at 250 VAC or 28 VDC**; **30 VDC is the *maximum switching voltage*** —
  a ceiling, not a rated load point. The repo states 30 VDC as the rating. Irrelevant at 24 VAC,
  but the log should say which of the two numbers it means.

### 12. ESP32 strapping pins — repo confirmed correct against v3.7

Not a contradiction; recorded because it was an open ⚠ in the verification log. Datasheet v3.7
Table 3 *Default Configuration of Strapping Pins* lists exactly five — **GPIO0, GPIO2,
MTDI (GPIO12), MTDO (GPIO15), GPIO5** — matching the repo's "avoid GPIO 0/2/5/12/15" exactly.
GPIO 6–11 confirmed as the flash/SPI pins, and GPIO 34–39 confirmed **input-only** (typed `I`,
not `I/O`, in the pin table).

---

## Could not obtain

| Wanted | Why not |
|---|---|
| **Rain Bird `1301-410` dimensions** — overall length, outlet pitch, height | Rain Bird publishes **no** dimensional data for the 1300/1200 series manifolds. Checked: the international catalogue page (models list + 10.5 bar only), the [PVC Manifold System product page](https://www.rainbird.com/products/pvc-manifold-system), its [support/documents tab](https://www.rainbird.com/products/pvc-manifold-system/support) (zero documents), and the professional document library (`manifold` returns only Xeri-Bug and DWG/DXF CAD blocks for the US **MS**/**MAN-T** manifolds, not the 1300 series). The **MTT-100 tee's 120 mm** is the only published spacing figure and is in the saved extract. Retailer listings carry no dimensions either. **To size the box properly this needs a tape on the part when it arrives, or a call to Rain Bird.** |
| A standalone metric **DV/DVF tech-spec sheet** | Rain Bird issues the DV/DVF Tech Spec only in the US edition. The metric/BSP presentation exists solely inside the international catalogue, hence the page extract. |
| **Wago 221-413 — current revision** | The held copy is `Version 19.09.2023`; a newer 6-page revision exists (2024–2025 version stamps, visible on distributor mirrors). Wago no longer serves a static PDF: the product page's *Generate Datasheet* button calls `https://www.wago.com/wagoapi/v2/gb-wago/datasheet/configuration/221-413`, which hands back `priintGridUrl: https://wago.priintcloud.com/datasheets/221-413/` — **Wago's own priint/comet publishing service, the same system that produced the file already held** (`comet_pdf … WERK II`), so it is an acceptable source. It simply never responded: `…/datasheets/221-413/en` timed out at 480 s and a browser tab on it stayed blank for ~12 min. **Retryable — that URL is the entry point.** Every other copy found (Farnell, RS, Mouser, LCSC, NetXL) is a distributor domain and was therefore not saved. The 450 V / 32 A / 0.14–4 mm² figures the build relies on stay ⚠ unverified against a current sheet. |
| **ABB TM15/24 — a real datasheet PDF** | There isn't one. ABB's public library holds exactly five documents for `2CSM228745R0802`, and none is a datasheet: a Conflict Minerals template (xlsx), the wiring diagram (**png**), an EU Declaration of Conformity (pdf, German) and two 2D drawings (dwg). Everything else is behind an ABB login. The "Data Sheet" heading on ABB's product page labels an **on-page HTML spec table** — which is precisely what the 2019 browser capture in this folder is. So the held file is not a degraded substitute for a lost ABB document; it *is* ABB's published data, in the only form ABB publishes it. ABB-generated datasheets do circulate on distributor sites (RS), excluded by the sourcing rules. |
| A standalone Plasson **Silver Line brochure** | plasson.co.uk's Downloads → Product Literature carries only a tooling catalogue, a barrier information sheet and conditions of sale. The Silver Line data lives only in the full technical catalogue, hence the chapter extract. |
