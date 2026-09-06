# Petrichor — project notes for Claude Code

ESP32 + ESPHome irrigation controller. Electrical/firmware side is built and
proven **on the bench**; **six enclosure-side items** are still unbought, none of
which blocks groundwork. `specs/build-guide.md` and
`docs/wiring-and-cable-grades.md`.

## Active hand-off

**Read `docs/outstanding-to-complete-build.md` first** — the consolidated
register of everything still needed to get from "proven on the bench" to
"installed and running". `docs/plumbing-rebuild.md` carries the water-side
reasoning and part evidence behind it.

Status as of 2026-09-06:

- ⛔ **The MVP was RE-SCOPED on 2026-08-31 (PR #14). Read this before designing,
  specifying or buying anything.** The hydraulics were sized around **watering
  the lawn** with MP3500 rotaries. That was the wrong target — the **three flower
  beds (north, east, west) are the priority and always were**, and had **no zone
  at all**. The MVP is now **zone 1: the three beds on 16 mm
  pressure-compensating inline dripline**, ~9 L/min ⚠ against a ~15 L/min budget,
  running on the **one valve already owned**. Baskets (zone 2) and the lawn ring
  (zone 3) are **deferred to Stage 9**. Dated decision, README *revised
  2026-08-31*: ⚠️ **the lawn cannot be watered as a byproduct of the beds — drip
  has no throw.** Do not re-raise it as a saving.
- ⛔ **The drip parts are the critical path and NOTHING is ordered.** ~80 m of
  16 mm PC dripline, a ~1.5 bar 3/4" BSP pressure reducer, a ~120 mesh 3/4" BSP
  filter (**mandatory, no longer "cheap insurance"**), 16 mm fittings, dripline
  pegs. Not priced, no vendor chosen. ⚠️ **No dripline datasheet exists in
  `datasheets/`** — every drip figure in this repo is repo-internal and unverified.
- **Water side already bought is sound, and nothing is wasted.** EGI144331
  (£218.96), EGI144332 (£43.27), EGI144337 (£40.23), EGI144461 (£42.75) and
  earlier. The PRS40 bodies and MP3500/MP3000 nozzles **carry forward to the
  deferred lawn zone**, where the beds shrink the lawn to ~8 × 12.5 m and
  corner-to-centre falls **8.9 m → ~7.4 m**. Project total ~**£572.63**.
- **The throw test is off the MVP critical path** — it tested lawn coverage. It
  still gates Stage 9. Do it opportunistically, never as a blocker. The **thread
  dry-fit and liner test are still live and still free** — do them first.
- **Electrical side: four wiring-BOM items remain `SOURCE`** — mains flex cores,
  ferrules, earth bond, breather plug. The field cable (`RB/IRRICAB5-15M`) and
  gel splices (`RB/DBRY.P2` ×2) were bought in EGI144337 and delivered
  2026-08-27. ⚠️ Still unverified: the 15 m has not been walked with a tape
  against the SW-patio-corner-to-valve-box run.
- **Two enclosure-side corrections landed 2026-09-06** — *manufacturer catalogue
  (Lapp), verified*: ⛔ **H07RN-F is not made in 3-core 0.75 mm²** (smallest is
  **1.0 mm² / `3G1.0`**; 0.75 mm² rubber flex is **H05RN-F**), and `3G1.0` at
  **8.3–10.7 mm** OD **will not fit the owned WEMNO M16 gland (3–8 mm)** — the
  lead swap needs an **M20**. Both are now `SOURCE`, both Phase E, neither blocks
  groundwork. Six enclosure-side items outstanding in total.
- ⚠️ **The RESTMO plug enclosure is IP54, not the IP66 assumed** *(vendor title
  only — weakest evidence class in the build)*. No parts consequence; it is a
  mounting constraint: wall-mounted, entries down, out of run-off, **never
  ground-sited**. The external mains lead is indoor-grade **H05VV-F** and needs
  eventual replacement.
- **Winterisation still has no procedure in the repo** — and the re-scope does
  not relax it. Surface-laid dripline plus a filter and reducer are the
  *shallowest*, most frost-exposed parts yet.
- ⚠️ **`docs/build-work-plan.md` has NOT been restated against the drip MVP.**
  Its Phase B still pegs out four rotary head positions and Phase C still
  trenches laterals to four heads at 200 mm. **That is an open contradiction
  needing Dan's call** — see *Unresolved by the re-scope* in the register.
