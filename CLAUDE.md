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

Status as of 2026-09-07:

- ⛔ **RE-SCOPED AGAIN on 2026-09-07 — V1 / V2. Read this before designing,
  specifying or buying anything.** Dan ruled, verbatim: **"V1 = sprinklers
  installed, working, trenched and piped. (beds) both zone 1 and zone 2."** and
  **"V2 = drip feed (Spring / Summer 2027)."**
  - **V1 = the POP-UP ROTARY SPRINKLER SYSTEM**, trenched, piped and working,
    watering the **beds / borders**, across **TWO zones** that map onto the two
    existing trench routes: **zone 1 = Line 1** (box → S11 → bottom edge → S12),
    **zone 2 = Line 2** (box → left edge → S21 → top edge → S22). Two of the
    **three valves already owned** — ✅ **no valve purchase arises.**
  - **V2 = the bed drip feed, Spring/Summer 2027.** Dripline, filter, reducer,
    16 mm fittings and the `ESS16-H` pegs all move there. ✅ **None of it was ever
    ordered, so nothing is stranded.**
  - 📌 **The Line 1 / Line 2 mapping is a *reading* of Dan's ruling** — he gave
    scope, not a design. Recorded as a reading, not as his words.
  - ⛔ **This SUPERSEDES the 2026-08-31 drip re-scope (PR #14 / vault decision
    #23), which is marked superseded, not deleted.** Vault decision **#25**,
    2026-09-07, is the live one. ⚠️ **Anything in this repo still saying "the MVP
    is the beds on dripline" or "the rotaries are deferred to Stage 9" is stale.**
- ⛔ **V1's critical path is NOT a shopping list — that framing died with the drip
  re-scope.** Every rotary part is in hand. **V1 is gated on three FREE physical
  checks and then a dig:** the **thread dry-fit**, the **throw test** and the
  **tape-walk of both trench routes**.
- ⚠️ **ONE new purchase gap, and it is the only outstanding V1 water-side buy:
  SWING JOINTS.** Articulated risers between lateral and pop-up body — Hunter's
  own CAD details assume them. **Deferred to Stage 9 on 2026-09-06 with "Do not
  buy them for the MVP"; V1 reverses that.** ⛔ **Not bought, not priced, not
  sourced.** The only lead in either system is EGI's *Rain Bird Swing Pipe, 1 m*,
  **unpriced**. ⏳ Size them once the heads are pegged out.
- ⚠️ **The filter and the ~1.5 bar reducer were DRIP-specific and do NOT carry
  into V1** — settled on manufacturer evidence, not assumed:
  - ⛔ **Do not fit a 1.5 bar reducer for V1.** The `PROS-04-PRS40` bodies are
    themselves **pressure-regulated to 2.8 bar** *(Hunter datasheet, verified:
    "To optimise MP Rotator Nozzle performance, the Pro-Spray PRS40 is
    pressure-regulated to 2.8 bar; 280 kPa")*. 1.5 bar **starves the V1 heads**.
  - ⚠️ **No filter is established as required for V1.** Hunter's design guide
    conditions primary filtration on **dirty water** (*"You should use primary
    filtration when operating with dirty water"*); every MP Rotator carries a
    **removable inlet filter screen**; the `100-DV` has a built-in **90-mesh
    (200 micron)** solenoid filter. That restores this project's own 2026-08-25
    ruling (*"seems overkill for v1"*). ⚠️ **A manufacturer-backed inference, not
    a Dan ruling.** The *"mandatory"* promotion of 2026-08-31 was reasoning about
    **emitters** and travels with the dripline to V2.
- **Water side already bought is sound, and nothing is wasted.** EGI144331
  (£218.96), EGI144332 (£43.27), EGI144337 (£40.23), EGI144461 (£42.75) and
  earlier. ✅ **The PRS40 bodies and MP3500/MP3000 nozzles are V1 hardware again**
  — not "carried forward to a deferred lawn zone". Same for the tees
  `PL/14840C1C` ×2 and elbows `PL/14850C10` ×3, reclassified as Stage 9 stock on
  2026-09-06 and **now V1 stock**.
- ✅ **The EGI144331 return question is CLOSED — the decision is KEEP** (2026-09-07).
  The 3 × PRS40 bodies and 4 × MP3500 nozzles are retained and are **V1 hardware**.
  ⛔ **The ~2026-09-24/25 return-window countdown is retired — it is not a live
  clock and not an open item.** Do not re-raise it.
- ⚠️ **Nozzle selection is LIVE and load-bearing for V1** — not the Stage 9
  curiosity it was filed as. ✅ **New datasheet evidence, 2026-09-07:** Hunter
  state **"Radius reduction up to approximately 25% on all models"**, so an owned
  **MP3500 trims down to ≈ 9.4 × 0.75 = 7.05 m** *(`MP3500_Hunter_MP-rotator-
  nozzle-metric.pdf`, verified)* — the owned MP3500s can reach ~7.4 m with the
  `HI/MPTOOL`, implying no nozzle purchase. ⛔ **But do not close it on that:
  ~7.4 m is corner-to-LAWN-CENTRE, and V1 aims at the beds and borders — a
  different coverage problem with no arithmetic anywhere in either system.** The
  inherited **90° arcs** are equally unverified for a border-aimed layout.
  **Throw-test it.**
- ⚠️ **The V1 acceptance test is NOT the drip one.** The 2026-08-31 gate —
  *"wetted cones joined into a wet band, not isolated damp spots"* — is a
  **dripline** test and moves to V2. **V1 is accepted when: each valve actuates
  wet, both zones run end to end on their own valve, every head throws a real
  pattern onto its target with no dry gap between adjacent heads and no overspray
  onto patio/fence/house, and the trench holds pressure with every joint visible
  before backfill.** ⚠️ **The catch-can / precipitation-rate refinement is not
  specified anywhere and is not being invented.**
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
  generic DIN mounts have **no price recorded anywhere**. ✅ **The mount has since
  arrived and is fitted, and the box is mounted (2026-09-07)** — which unblocked
  `assemble-enclosure` but ⚠️ **does nothing for the price gap, which is
  unchanged.**
- ⏳ **The throw test is BACK ON THE CRITICAL PATH (2026-09-07).** *(Superseded:
  "off the MVP critical path — it tested lawn coverage… do it opportunistically,
  never as a blocker." True while the MVP was drip.)* **V1 is the rotaries, so it
  gates V1 — and it is free.** ⏳ **So is the dynamic-pressure / sag reading**,
  which stops being a Stage 9 nicety and gates V1 again. The **thread dry-fit and
  liner test are still live and still free** — do them first.
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
- ❄️ **Winterisation — RULED NOT CRITICAL FOR V1 by Dan, 2026-09-07:** *"it wont
  sit in water (v1) We'll be fine."* **Settled. Do not re-raise it as a risk, and
  do not treat it as a gate on V1 or on the dig.** *(Superseded: "still has no
  procedure in the repo — and the re-scope does not relax it. Surface-laid
  dripline plus a filter and reducer are the shallowest, most frost-exposed parts
  yet." That is the **V2** case.)* The drain **method** stays a TODO for **V2's
  dripline**, which is the genuinely frost-exposed build. 📌 **One neutral
  sequencing fact for the dig checklist:** *if* automatic drain valves are ever
  wanted, they fit at the lateral **low points, during the dig**.
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
  - ✅ **The TERMINATIONS reverted 2026-09-07 (V1).** *(Superseded: "a dripline
    feed onto a bed, not a flush pop-up rotary body; the pegged head positions
    and the swing-joint gate follow the rotaries into Stage 9.")* Each run ends
    in **two flush pop-up rotary bodies on swing joints** — tees through
    S11/S21, elbows terminating S12/S22. ⏳ **Head peg-out returns to Phase B**
    and the **swing-joint gate returns with it** (and they are unbought).
  - ✅ **Trench DEPTH is no longer open — its source is restored.** The
    `PROS-04-PRS40` is V1 hardware again, so the derivation is live: retracted
    height **155 mm** → inlet at 155 mm → lateral centreline **~200 mm** → **dig
    250 mm** (vault #18). ✅ **The 155 mm is now CONFIRMED from the Hunter
    datasheet** — `datasheets/PROS-04-PRS40-CV_Hunter_spray-body-metric.pdf`,
    *"PROS-04-PRS40-CV · Retracted height: 15.5 cm"*. **This repo had only ever
    asserted it.** ⚠️ **Restored by consequence, awaiting Dan's confirmation** —
    he ruled on scope, not on depth.
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
- ✅ **Rotary hardware is fully stocked — "needs three more of each" is stale.**
  EGI144331 bought **3 × PRS40 bodies and 4 × MP3500 nozzles**; with the 8C rig's
  body and MP3000 that is **4 bodies, 5 nozzles in hand** — ✅ **exactly what V1
  needs, and it is all owned.** ⚠️ *(Restated 2026-09-07: this is **V1** hardware,
  not "lawn-ring / Stage 9" stock.)* ⛔ **Which nozzle goes on is a LIVE V1
  question** — see the nozzle bullet above. **Throw-test it.**
- ⚠️ **Zone numbering changed on 2026-09-07 — old references are stale.** *Zone 1
  = beds on drip · zone 2 = baskets · zone 3 = lawn ring* is **superseded**.
  **V1: zone 1 = Line 1 rotaries, zone 2 = Line 2 rotaries.** **Hanging baskets
  now sit with V2 (2027)**, on the third valve. ⚠️ Note that `switch.zone_1` /
  `switch.zone_2` in Home Assistant, and "Zone 1–8" in the wiring docs, are
  **relay channel numbers** — a different numbering from the irrigation zones.
  Do not conflate them.
- ✅ **Basket count is FIVE, not four.** The repo README's *Must Haves* said 4;
  the vault settled 5 with positions on 2026-07-20 (*"corrected up from earlier
  count"*). **Obsidian wins on decisions**; the README is corrected.
