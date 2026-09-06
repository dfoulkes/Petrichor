# Petrichor — project notes for Claude Code

ESP32 + ESPHome irrigation controller. Electrical/firmware side is built and
proven **on the bench**; **four enclosure-side items** are still unbought, none of
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
  ✅ **One exception, priced 2026-09-06: the pegs.** ⛔ **EGI stock no 16 mm
  hold-down at all** — checked — so **Access Irrigation `ESS16-H`, 100-pack,
  £34.00 ex / £40.80 inc** *(vendor page, verified)*, fits 16 **and** 20 mm. The
  100 beats 4 × the 25-pack (`ESS16-Q`, £9.80 ex = £39.20). 📌 Access give free
  delivery only **over £150 ex**, so **the pegs travel with the Stage 8D drip
  order, not alone.** ❌ **Not bought.**
- **Water side already bought is sound, and nothing is wasted.** EGI144331
  (£218.96), EGI144332 (£43.27), EGI144337 (£40.23), EGI144461 (£42.75) and
  earlier. The PRS40 bodies and MP3500/MP3000 nozzles **carry forward to the
  deferred lawn zone**, where the beds shrink the lawn to ~8 × 12.5 m and
  corner-to-centre falls **8.9 m → ~7.4 m**.
- 💷 **Spend — read the label, this file used to get it wrong.** ⛔ **£572.63 is
  the WATER SIDE + GROUNDWORK ONLY**, not the project total: it is the seven
  orders in the register's table
  (`163.00+44.12+218.96+43.27+40.23+20.30+42.75`) and **excludes ~£272.69 of
  control-plane, electronics and tooling spend**. Adding the 2026-09-06 Screwfix
  order gives **~£595.66 for the orders that table lists** — and that line is
  *electrical*, so it is not a water-side figure either.
  **Project-wide as at 2026-09-06: ~£868.74** *(£845.71 + £23.03)*, or
  **~£835.26** net of the still-outstanding **£33.48 Amazon refund** on the NPT
  valve. 📌 **Reconciled in the Obsidian vault**
  (`Projects/golden-shower/tasks/prototype-shopping-list.md`), 2026-09-06 —
  **Obsidian is the source of truth for spend; this repo is downstream.** Don't
  duplicate its order register here. ⚠️ The project-wide figure is **light by an
  unknown amount**: the **ESP32 DIN rail mount (AliExpress, 2026-08-06)** and the
  generic DIN mounts have **no price recorded anywhere**.
- **The throw test is off the MVP critical path** — it tested lawn coverage. It
  still gates Stage 9. Do it opportunistically, never as a blocker. The **thread
  dry-fit and liner test are still live and still free** — do them first.
- **Electrical side: four wiring-BOM items remain `SOURCE`** — mains flex cores,
  ferrules, earth bond, breather plug. The field cable (`RB/IRRICAB5-15M`) and
  gel splices (`RB/DBRY.P2` ×2) were bought in EGI144337 and delivered
  2026-08-27. ⚠️ Still unverified: the 15 m has not been walked with a tape
  against the SW-patio-corner-to-valve-box run.
- ✅ **The external mains lead is BOUGHT — Screwfix `A27859275166`, 2026-09-06,
  £23.03 inc**, Click & Collect **Horsforth** (held 21 days, **await the SMS**).
  `994JY` **Time `3183P` 3-core 1.5 mm², 10 m coil** £19.99 · `651VT` **M20
  gland** 2-pack £1.35 · `68744` **13 A fused plug** £1.69. *Evidence class:
  Screwfix order confirmation, verified.* **That clears three enclosure-side
  items in one order**, taking `SOURCE` from six back to **four**: mains flex
  cores, ferrules, earth bond, breather plug.
- ⛔ **The lead is `3183P`, NOT H07RN-F — this repo claimed H07RN-F earlier on
  2026-09-06 and was wrong.** Screwfix state the conductors are **"rated
  300/500 V"**, which is the **H05RN-F class**; the `07` in H07RN-F **means
  450/750 V by definition**. **Always describe it as "3183P rubber flex (PCP
  sheath), 300/500 V class" — never as H07RN-F.** ✅ **It is functionally correct
  regardless:** the requirement was **a rubber sheath**, not a voltage class, and
  on 230 V behind a 5 A fuse 450/750 V buys nothing. PCP sheath, **−35 to
  +60 °C**, sold for *"pond pumps and other outdoor cabling applications"*.
  **UK code reference (verified):** `3183Y` = **H05VV-F**, PVC/PVC, **BS EN
  50525-2-11**; `3183P` = **rubber sheath**, **BS EN 50525-2-21** — **the
  trailing letter is the sheath material and the BS EN number is the clean
  discriminator.** ⚠️ **Retailer listings contradict themselves on 3183P** (MP
  Moran claim "H07RN-F" *and* "300V/500V" at once) — **trust the sheath material
  and the BS EN number, never the har-code.**
- ⛔ **NEW WORK: the enclosure entry must be drilled out M16 → M20.** The fitted
  **WEMNO M16 seals 3–8 mm**; the bought cable is **~9.75 mm** ⚠, so the seal
  **never compresses on the sheath at all** — this is *no seal*, not a tight fit.
  Opening **~16.5 → ~20.5 mm** ⚠ *(**inferred from the thread designation, not a
  datasheet** — **caliper the existing hole first**)* is a **step-drill job on an
  already-built and wired box**: ⛔ **remove or shroud the board and both PSUs,
  and clear all swarf before re-sealing.** 📌 **Dan chose this route knowingly**
  on 2026-09-06, having been shown build guide 7A's *"or sleeve in conduit"*
  alternative, which needs no drilling. **Recorded, not to be re-argued.**
- ⚠️ **Still open on the lead swap:** the **`651VT` M20's own clamping range is
  unverified**; **fit a 5 A fuse** (the `68744` ships with 13 A); **read the old
  lead's sheath printing before cutting it** (free, settles whether it was ever
  H05VV-F, destroyed by the cut); check **whether 1.5 mm² seats in the old
  rewireable plug's cord grip**; and **9–11 mm round cable clips are not bought
  and still unspecced** (Screwfix's suggested 5–7 mm coaxial clips are too
  small).
- ⚠️ **The `PL17788` / PELB2340 lead identity is IN DOUBT — downgraded from ✅ to
  ⚠ on 2026-09-06.** PR #14's verification log had it confirmed as a **moulded**
  plug from the CPC order confirmation; **Dan reports the plug in hand is screwed
  on / rewireable** (his observation, hedged *"I think"*). An order confirmation
  is **the seller's own title echoed back — one source** — and the physical part
  disagrees with it, so it cannot re-confirm itself. Consequently the
  **0.75 mm² CSA is back to *assumed*, not confirmed**; the transformer/load
  arithmetic is unchanged but one of its stated inputs is no longer evidenced.
  *(Repo-only over-confidence — the vault never carried this claim.)*
- **Superseded but still true as reference** *(manufacturer catalogue, Lapp,
  verified)*: ⛔ **H07RN-F is not made in 3-core 0.75 mm²** (smallest is
  **1.0 mm² / `3G1.0`**; 0.75 mm² rubber flex is **H05RN-F**), and `3G1.0` at
  **8.3–10.7 mm** OD would not fit the M16 either. ⚠️ **Moot as a buying rule** —
  **Screwfix's 3183P range starts at 1.5 mm²**, so no thin rubber option existed.
  The **gland half of that reasoning held and is why the M20 got bought.**
- ⚠️ **The RESTMO plug enclosure is IP54, not the IP66 assumed** *(vendor title
  only — weakest evidence class in the build)*. No parts consequence; it is a
  mounting constraint: wall-mounted, entries down, out of run-off, **never
  ground-sited**. The external mains lead **as fitted** is ⚠ *assumed*
  indoor-grade H05VV-F; ✅ **its rubber replacement is now bought** — see the
  3183P bullets above.
- **Winterisation still has no procedure in the repo** — and the re-scope does
  not relax it. Surface-laid dripline plus a filter and reducer are the
  *shallowest*, most frost-exposed parts yet.
- ⚠️ **`docs/build-work-plan.md` has NOT been restated against the drip MVP.**
  Its Phase B still pegs out four rotary head positions and Phase C still
  trenches laterals to four heads at 200 mm. **That is an open contradiction
  needing Dan's call** — see *Unresolved by the re-scope* in the register.
