# Petrichor — project notes for Claude Code

ESP32 + ESPHome irrigation controller. Electrical/firmware side is built and
proven **on the bench**; **four enclosure-side items** are still unbought, none of
which blocks groundwork. `specs/build-guide.md` and
`docs/wiring-and-cable-grades.md`.

> 📌 **Two homes, two jobs — know which one wins before you edit.**
> **Obsidian** (`Projects/golden-shower/` in the Homelab vault) is the source of
> truth for **decisions, project state, ticket status and spend** — read its
> `README.md` **Decisions table** before designing, specifying or buying
> anything. **This repo** is the source of truth for **build detail** — wiring,
> stage runbooks, datasheets, part evidence. Where they disagree on a
> *decision*, **the vault wins**; on a *build spec*, the repo usually does.
> ⛔ **One edit, one place** — cross-reference, never mirror. The vault's order
> register and the repo's stage runbooks are each maintained in exactly one
> place. Last reconciled **2026-09-06** →
> `Projects/golden-shower/reconciliation-2026-09-06.md`.

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
  on 230 V behind the **3 A fuse now fitted** (2026-09-07 — see below), 450/750 V
  buys even less than it did against the 5 A this line originally cited. PCP
  sheath, **−35 to +60 °C**, sold for *"pond pumps and other outdoor cabling
  applications"*.
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
- ✅ **Fuse fitted 2026-09-07 — 3 A, not 5 A.** The `68744` plug shipped with a
  13 A fuse; Dan has fitted a **3 A BS 1362 fuse**, tighter than the 5 A the
  earlier docs called for. **Why 3 A is correct:** the HDR-15-5's typical AC
  input current is **0.25 A at 230 VAC** *(HDR-15-5 datasheet,
  `datasheets/HDR-15-5_MeanWell_5V-PSU.pdf` — verified)* — with the TM15/24
  transformer alongside, total draw is still a few tens of watts, and 3 A at
  230 V is ~690 W of headroom. A 3 A fuse protects the 1.5 mm² 3183P flex (and
  the 0.75 mm² old lead) more tightly than 5 A did — every cable-grade
  argument in `docs/wiring-and-cable-grades.md` built on "5 A" holds *a
  fortiori* at 3 A. ⚠️ **The only open risk is nuisance-blowing on cold
  start:** the datasheet gives **inrush 45 A at 230 VAC, cold start**
  *(datasheet, verified)*, sub-millisecond and within a BS 1362 fuse's normal
  pre-arcing I²t — but that specific margin is **inferred, not verified
  against a fuse datasheet.** If it ever blows on power-up (and only then),
  step up to **5 A — never to the 13 A it shipped with**, which is now a
  spare.
- ⚠️ **Still open on the lead swap:** the **`651VT` M20's own clamping range is
  unverified**; **read the old lead's sheath printing before cutting it**
  (free, settles whether it was ever H05VV-F, destroyed by the cut); check
  **whether 1.5 mm² seats in the old rewireable plug's cord grip**; and
  **9–11 mm round cable clips are not bought and still unspecced** (Screwfix's
  suggested 5–7 mm coaxial clips are too small).
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
- ✅ **`docs/build-work-plan.md` HAS now been restated — Dan ruled on the trench,
  2026-09-06.** This file previously called it an open contradiction. It is not.
  A session reading had proposed the re-scope shrank the MVP to a single short
  mainline run to the valve box; ⛔ **that was wrong**, and Dan corrected it
  against the pipe map (`Projects/golden-shower/garden-layout-2026-08-25.png`),
  in his words: **"we're going into the garden so to spray the borders, thus the
  trench."**
  - ✅ **The two trench ROUTES survive unchanged.** Line 1 = box → S11 → bottom
    edge → S12; Line 2 = box → left edge → S21 → top edge → S22. The mainline
    still travels **out along the borders** to reach the beds, so **the MVP is
    NOT trench-free and Phase C is still a real dig.**
  - ⚠️ **Only the TERMINATIONS changed** — a dripline feed onto a bed, not a
    flush pop-up rotary body. The pegged head positions and the swing-joint gate
    follow the rotaries into **Stage 9**.
  - ⛔ **Trench DEPTH is open and was NOT guessed at.** The 200 mm everywhere in
    this repo derives entirely from the `PROS-04-PRS40`'s 155 mm retracted
    height — a pop-up that is now deferred. **Dan's call.**
  - ⚠️ **Trench LENGTH is not recorded anywhere and must not be invented.** The
    only figure is **~33 m**, and `plumbing-rebuild.md` says itself that it is
    *scaled off the diagram*, not walked. ⏳ **Walk both routes with a tape** —
    added to Phase B and the physical-checks table. It also settles the **15 m
    field cable**, which has never been walked either. Both on one walk.
- ⛔ **Valve-box pipe entries must be U-NOTCHES OPEN TO THE BOTTOM RIM, never
  closed holes.** A one-way decision taken at cut time (vault decision #18): a
  closed hole traps the box for the life of the install, because lifting drives
  its lower edge into the horizontal MDPE and the manifold cannot leave through
  the lid either. Now stated in `build-work-plan.md` Phase B,
  `specs/build-guide.md` **7C** and `plumbing-rebuild.md` *Pipe entry* — the
  last of which described a **closed knock-out** and has been corrected.
- ✅ **Lawn-ring hardware is fully stocked — "needs three more of each" is
  stale.** EGI144331 bought **3 × PRS40 bodies and 4 × MP3500 nozzles**; with the
  8C rig's body and MP3000 that is **4 bodies, 5 nozzles in hand.** ⚠️ Open for
  Stage 9 only: **which** nozzle goes on — ~7.4 m is *below* the MP3500's 9.4 m
  minimum radius, so the owned MP3500s want adjusting down with the `HI/MPTOOL`,
  or the MP3000 becomes the pattern. **Not a paper decision — throw-test it.**
- ✅ **Basket count is FIVE, not four.** The repo README's *Must Haves* said 4;
  the vault settled 5 with positions on 2026-07-20 (*"corrected up from earlier
  count"*). **Obsidian wins on decisions**; the README is corrected.
