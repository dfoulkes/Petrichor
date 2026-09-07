# Work plan — water side, 2026

> No dates. Pick it up when the window and the weather line up.
> Parts inventory and reasoning: [`outstanding-to-complete-build.md`](outstanding-to-complete-build.md)
> and [`plumbing-rebuild.md`](plumbing-rebuild.md).

**Goal: sprinklers in, working, not leaking, before winter 2026.** Electrical
completion is deliberately deferred to winter. Commissioning this year is on the
**manual bleed levers** — no controller, no field cable connected, no sparky.

## Risk structure — where the real commitment sits

Dan's framing, refined: the **valve box does not commit you to the electrics**.
Set it, plumb it, wet-test, backfill and drain down and you have a **complete,
hand-operable system** — every valve opens on its bleed lever. The control cable
sits coiled in the box, splices unmade, and the whole thing overwinters safely.
The sparky arrives in February to a finished water system.

**What commits you is siting the relay box**, because the buried cable must aim
at a decided destination, and that partly depends on where an electrician can
reasonably bring mains. **That is the dependency to clear early.**

| Tier | Phase | Commitment |
|---|---|---|
| **None** | A — prove it | Fully reversible. Returns still open. No ground touched. |
| **Low** | B — set out, box pit | A hole in a lawn. Fill it back in an hour. |
| **⛔ TIME-BOXED** | **C — turf-up → backfill** | **The only phase where stopping halfway does real damage** |
| Low | D — drain down | A checklist |
| Deferred | E — electrics | Slips to spring at zero cost |

**The irreversible window is turf-up to backfill, not the valve box.** Before it,
everything can be abandoned. After it, everything can be paused indefinitely.

### Siting — CLOSED 2026-08-25

Outlet position and ESP32/relay box location are **decided**. Dan: *"There closed
in my mind."* **Do not re-raise.** The 15 m of control cable against a ~6 m run
leaves ~9 m of slack anyway.

### The remaining risk is schedule, not commitment

~8 weekends from late August to end of October; **one dry one is needed** after
the box arrives. Not tight — it only feels tight because nothing has started.

**Highest-value action: run Phase A immediately.** It is the only remaining work
that can *discover a problem*. A failed thread dry-fit means returns and a
re-order — a fortnight. Absorbed in early September that is nothing; discovered
in late October it kills the year. **The cost of that check rises every day it
is deferred.**

## Governing rule — REVISED 2026-08-25: no turf is being relaid

**The heads and runs are in the edging, not the lawn.** The border is being
**widened by 10 cm+ all round** to take the pipework, so that turf is removed
**permanently** and becomes border. Nothing gets lifted and relaid.

**This removes the uninterruptible window entirely.** The original rule
("concentrate the dig") existed because lifted turf dies within days. That no
longer applies:

- An open trench in a border harms nothing and can sit for a fortnight.
- Cultivated border soil digs far easier than compacted lawn.
- **The work can be spread across evenings and half-days.** No dry weekend needed.

⏸️ ~~**The only remaining date in the project is draining down before the first
hard frost.**~~ ✅ **Superseded 2026-09-07 — Dan's ruling:** *"it wont sit in
water (v1) We'll be fine."* **V1 carries no frost date.** The drain method is
wanted ahead of **V2's dripline**, Spring/Summer 2027.

At the valve box position: one sacrificial plant, plus annuals that are going
over anyway. Dan's call, no loss.

### Two things that follow

**Widen more than 10 cm if you can — 150–200 mm is more comfortable.** The strip
has to take the head body (~80 mm across), the elbow behind it, the lateral
running past, *and* spade room.

**The head-height question resolves itself, but becomes a planting constraint.**
The heads sit in the *newly created* strip, which is currently turf and therefore
empty — so nothing blocks a `PROS-04`'s 10 cm pop-up and the four bodies already
bought are correct. **But whatever is eventually planted in front of those heads
must stay under ~10 cm**, or the spray is blocked. Record this before something
gets established there.

---

## Phase A — Prove it (indoors / rain-irrelevant, no box needed)

- [ ] **Thread dry-fit** — owned PRS40 body against owned `20 mm × 1/2" BSPM`
      connector, **dry**. Threads smoothly and keeps going = BSP, all good.
      **Binds hard after ~2 turns = NPT variant** → the 2 tees and 3 elbows are
      the wrong standard and go back inside the 30-day window.
      **Do this first. It can cancel everything else.**
- [ ] **Bench-energise both solenoids** off the proven controller. The bleed
      lever proves the valve *body*, not the *coil*.
- [ ] **Splitter joint diagnosis** — which end drips? *Brass end* = worn female
      thread, replacement already bought. *Grey nut end* = a compression fault.
- [ ] **Measure the control cable OD** with calipers. Under 8 mm → the owned
      WEMNO M16 IP68 glands work. Over → M20, ~£3.
      ⚠️ **Separate question from the *mains* gland — added 2026-09-06.** The
      M20 below is **not conditional** if the external mains lead is ever
      swapped for **H07RN-F `3G1.0`**: that cable is **8.3–10.7 mm** OD (Lapp
      catalogue, verified) against the M16's **3–8 mm**, so the whole range is
      out. See `wiring-and-cable-grades.md` → *The external lead*.
      ✅ **Resolved for the mains side later the same day** — the lead bought was
      **`3183P` 1.5 mm² (~9.75 mm ⚠)**, not H07RN-F, and **an M20 came with it**
      (`651VT`, 2 in the pack). **The control-cable measurement is still to do**,
      and there is now a **spare M20** if it needs one — but a second M20 entry
      would be a **second hole to drill**, so measure before assuming.
- [ ] **Rebuild the valve assembly on a bench** — dry, unhurried, indoors.
      **Chamfer and silicone-lubricate every pipe end** (Plasson's own
      instruction; missing from the original build).
      **Hand-tight plus a gentle nip only** on the Hansen bushes — they are
      tapered and wedge; forcing splits plastic ports.
- [ ] **Above-ground wet test** on a temporary surface rig (build guide 8C —
      *"needs no trenching and no second valve"*). Rain is irrelevant; you are
      spraying water anyway. **Prove it holds before anything goes in a hole.**
- [ ] ⛔ **THROW TEST — ON THE CRITICAL PATH AGAIN (2026-09-07). It gates V1, and
      it is free.** A head off the splitter, measure where it lands. Pick a still
      day; wind skews it. *(It had been filed "opportunistic, never a blocker" on
      2026-09-06, because it tested lawn coverage while the MVP was drip.
      **V1 is the rotaries.**)*
      ⚠️ **Do NOT test against the inherited 8.9 m / ~7.4 m figure.** Both are
      **corner-to-LAWN-CENTRE**; V1 aims these heads at the **beds and borders**,
      and no arithmetic exists anywhere for that case. **Measure real throw, then
      decide the nozzle and the arcs against the real targets.**
      ✅ **Useful datasheet input:** Hunter allow **"radius reduction up to
      approximately 25% on all models"**, so an owned MP3500 (9.4–10.7 m) trims to
      **≈7.05 m** *(`MP3500_Hunter_MP-rotator-nozzle-metric.pdf`, verified)* — the
      owned nozzles probably cover it with the `HI/MPTOOL`, and no nozzle purchase
      is implied. ⛔ **Probably is not proven. Throw-test it.**
- [x] **Tape the manifold** — ✅ done 2026-08-27. **500 × 260 mm** with both
      valves fitted and pipe allowance. Supersedes the 480 mm calculation. The
      "500 × 365 lid aperture" it was to be checked against was the lid's *outer*
      size, not an aperture — see `plumbing-rebuild.md`, valve-box section.
- [x] **Order the valve box** — ✅ **DONE 2026-08-27: EGI144461, £42.75.**
      Irritec Jumbo 12" `IG/POZ-JMBREC` ×1, Easy Garden Irrigation
      (£45.99 − £9.19 End of Season 20% + £5.95 postage). Chosen over the
      HydroSure Jumbo on vendor history, not price. ⛔ The Irritec *Standard* 12"
      was rejected: ~468 mm internal at fitting height, shorter than the 470 mm
      assembly. **Fit confirmed against the measured manifold** — ~612 mm
      internal against 500 mm needed, 56 mm clear per end; 140 mm stack in a
      300 mm box. The manifold will not lift out through the lid, so servicing
      means lifting the box off. **Dry-fit before digging.**
- [ ] Screwfix: **MDPE pipe cutter**, black **cable clips**. ~~**M20 gland**~~
      — ✅ **BOUGHT 2026-09-06**, order `A27859275166` (Vimark `651VT`, 2 pack).
      Still *"if needed"* for the **control** cable (measure it); it was
      **required** for the mains lead and that is why it was bought.
      ⚠️ **Its clamping range is unverified** — check the packet against the
      calipered cable.
      > ⛔ **Cable clips are NOT bought and are still misspecced.** Screwfix's
      > suggested *Vimark Black Round Coaxial Clips 5–7 mm* are **too small** for
      > the 3183P mains lead at **~9.75 mm** ⚠. **Needs 9–11 mm round clips.**
      > Not priced, not ordered — stays on the outstanding list.

## Phase B — Set out (outdoors, wet-tolerant, no box needed)

- [ ] **Mark both trench routes** — **Line 1** = box → S11 → along the bottom
      edge → S12; **Line 2** = box → up the left edge → S21 → across the top →
      S22. ✅ **Both routes survive the drip re-scope unchanged** — the mainline
      still has to travel out along the borders to reach the beds. Dan,
      2026-09-06: *"we're going into the garden so to spray the borders, thus
      the trench."* **This is the live task; the head positions below are not.**
- [ ] ⏳ **WALK BOTH ROUTES WITH A TAPE — free, never done, and it gates the
      dig.** ⚠️ **Trench length is not recorded anywhere in this repo or the
      vault.** The only figure is **~33 m**, and `plumbing-rebuild.md` states
      plainly that it is *scaled off the diagram*, not walked:
      *"Line 1 + Line 2 come to roughly 33 m before risers, slack and trench
      dips… Walk it with a tape."* ⚠ **Treat ~33 m as unverified.**
      It settles three things at once:
      - the **dig itself** — hours, and whether a trencher is worth pricing;
      - the **MDPE budget** — ~34 m of the 50 m coil is left after the 8C rig
        takes ~16 m. **Marginal.** Running out mid-trench costs £74.95 plus a
        delivery and a stalled week;
      - ⚠️ the **15 m field cable** `RB/IRRICAB5-15M`, which has *also* never
        been walked against the SW-patio-corner → valve-box run. **Same walk,
        same tape** — a short cable is the one mistake that order cannot absorb.
- [ ] ✅ **PEG OUT THE FOUR HEAD POSITIONS — S11, S12, S21, S22. Back in scope
      2026-09-07 (V1).** ⏸️ *(Superseded: "DEFERRED TO STAGE 9, 2026-09-06 — they
      are rotary head positions and the rotaries are deferred; under the drip MVP
      each route terminates in a dripline feed onto a bed, not a pop-up body.")*
      **V1 is the rotaries**, so these are live head positions again:
      **zone 1 = S11 + S12 (Line 1) · zone 2 = S21 + S22 (Line 2).**
      ⛔ **This gates the swing-joint purchase** — the riser length depends on
      where the lateral actually lands, and **swing joints are not bought.**
      ⚠️ **Do not inherit the aiming from the lawn design.** The 90° arcs and the
      8.9 m / ~7.4 m corner-to-centre figures were chosen to throw across the
      **lawn**; V1 waters the **beds and borders**. **Peg positions, then throw-test
      — do not settle arcs on paper.**
- [x] **Dig the valve box pit** — ✅ **DONE 2026-08-29** by Dan and Alysha:
      **700 × 500 × 410 mm deep**, membrane laid, 1 of 3 gravel bags in.
      *(An initial "roughly 610" on the long axis was Dan's mis-measure,
      corrected same day to 700. No re-cut needed — 700 is bang on target.)*
      **Depth:** 410 mm − 300 mm box = **110 mm bed**, lid flush. More drainage
      than the 75 mm originally specced, and the number that is painful to fix
      once membrane is down — so this is the good half.
      **Long axis:** 700 vs the Irritec Jumbo 12" **640 mm** base = **30 mm
      clearance per end.** ✅
      ✅ **Short axis: 500 vs a 500 mm base — SETTLED BY DAN 2026-08-29,
      do not re-raise.** *"I can slightly edge any space needed when it arrives.
      To me that is a non issue."* The taper backs him: the box goes
      **500 → 370 over 300 mm (43 mm per 100 mm)**, so only the bottom ~50 mm is
      ever tight — 21 mm a side at 100 mm up, 65 mm at the lid — and it
      backfills freely above the rim. Any tolerance shortfall (the same-mould
      HydroSure is quoted at 507) gets edged out with a spade on the day.
      **Dan's stated acceptance criterion is not clearance, it is access:**
      *"so long as we can get into the box as needed."* See the access rule below.
      ❌ **The old target line here was defective and is retired:** it read
      *"to the HydroSure footprint 640 × 507 mm"* — the bare footprint of the
      *wrong variant*, with **no working clearance at all**. A pit dug exactly
      to it could never have been levelled or backfilled.
      ✅ **Settled pit spec: 700 mm long × 400–410 mm deep**, short axis ≥ the
      box's *measured* base. Measure **at gravel-bed level, not the top rim** —
      hand-dug sides taper inward.
- [ ] **⚠️ CUT THE PIPE ENTRIES AS BOTTOM-OPEN NOTCHES, NOT CLOSED HOLES.**
      **This is a one-way decision and it is what "can we get into the box"
      actually turns on.** Two tiers of access:
      **(a) Through the lid — routine, fine.** Clear aperture **≈475 × 345 mm**
      (*inferred* from the 520 × 370 body top, not vendor-stated). Solenoid
      coils, flow-control stems, bleed levers and all **3 DBR/Y splices** sit
      inboard and stay reachable. This covers everything done in normal life.
      **(b) Full manifold removal — only by lifting the box off.** The taped
      assembly is **500 × 260 mm** and will not pass up through a ~475 mm
      throat. Already recorded in `plumbing-rebuild.md`.
      **Whether (b) is ever possible is decided at cut time.** The MDPE crosses
      the wall horizontally. With a **closed hole**, lifting the box drives the
      hole's *lower* edge into the pipe and jams after ~15 mm — **the box is
      trapped for the life of the install** and the manifold only comes out by
      cutting pipe. With a **U-notch open to the bottom rim**, the box lifts
      vertically clean off over the pipework, pipes undisturbed.
      **The notch costs nothing: the box has no floor.** It is an open-bottomed
      tapered tub on gravel — a slot up from the bottom edge opens nothing that
      is not already open to the ground. Size it ~**120 mm tall × 30 mm wide**
      (lateral centreline lands ~100 mm up the wall). Deburr; the wall is
      corrugated PP ~4–5 mm and a jigsaw goes through it.
      ⚠️ **Evidence class: the geometry is derived here, not vendor-stated** —
      trivially provable on a scrap of the box. Whether it is standard *trade*
      practice is **unverified**; worth a sanity-check against r/Irrigation,
      who outrank the manufacturer on practice.
- [ ] **Dry-fit the box before the bed is finished** — still never done, and it
      is now the **only** thing standing between the pit and the box going in.
      Tape the **real base** on the short axis: **≤500 mm → set it as dug**;
      **>500 mm → scrape ~15 mm off each side while the hole is still open**
      (two minutes now, versus lifting membrane and gravel a second time).
      Then cut the pipe entries **oversize** so the 42 mm Plasson adaptor hex
      sits *in* the wall aperture rather than fighting it.
- [x] **Lay membrane, then the gravel bed** — membrane down 2026-08-29, 1 of 3
      bags tipped (≈50 mm). ✅ **Three bags is enough — no second Wickes trip.**
      Wickes `133795` is **22.5 kg** at **£4.10** (verified on the Wickes
      product page 2026-08-29; reconciles with £12.30 × 3 on order 702854640),
      so 3 bags = **67.5 kg**. The bed at 700 × 500 × 110 mm needs
      **0.0385 m³ ≈ 58–62 kg** (bag weight verified; density 1.5–1.6 t/m³
      *inferred*) — covered, with ~a third of a bag spare. Haunch the sides
      with the spoil. *(A "buy 2 more bags" flag raised earlier was priced off
      a 570 mm width that the corrected measurement removed.)*

## Phase C — The dig

> ## ⛔ RESTATED AGAIN 2026-09-07 — V1 is the ROTARIES. This phase is a sprinkler dig again.
>
> **Dan, 2026-09-07:** *"V1 = sprinklers installed, working, trenched and piped. (beds) both zone 1
> and zone 2."* · *"V2 = drip feed (Spring / Summer 2027)."* → vault decision **#25**.
>
> | | Verdict for V1 |
> |---|---|
> | **The two trench ROUTES** | ✅ **Unchanged — they have now survived two re-scopes.** Line 1 = **zone 1**, Line 2 = **zone 2** |
> | **What the routes TERMINATE in** | ✅ **Flush pop-up rotary bodies again** — two per line, on swing joints. *(Superseded 2026-09-06: "a dripline feed onto a bed, not a flush pop-up rotary body.")* |
> | **Four-head lateral runs, tees/elbows at S11/S21/S12/S22** | ✅ **BACK IN THIS PHASE.** Tees through S11/S21, elbows terminating S12/S22 — **all already owned** (`PL/14840C1C` ×2, `PL/14850C10` ×3) |
> | **Swing joints** | ⚠️ **Back in scope and ⛔ NOT BOUGHT, NOT PRICED.** The *"Do not buy them for the MVP"* instruction below is **wrong now** |
> | **Head peg-out** | ⏳ **Back in Phase B** |
> | **Trench DEPTH** | ✅ **NO LONGER OPEN — 200 mm to the top of the pipe, dig 250.** Its source is restored; see below |
> | **Trench LENGTH** | ⚠️ **Still unmeasured — do not invent one.** ~33 m is scaled off a drawing. See the Phase B tape-walk |
> | **Winterisation** | ✅ **Ruled NOT critical for V1 by Dan** — *"it wont sit in water (v1) We'll be fine."* **It does not gate this dig** |
>
> ✅ **TRENCH DEPTH — the blocker dissolves.** The 200–250 mm below derives from the
> `PROS-04-PRS40`'s retracted height, and **that body is V1 hardware again**, so the derivation is
> live. ✅ **And the 155 mm is now CONFIRMED rather than asserted:**
> *"PROS-04-PRS40-CV · Retracted height: 15.5 cm"* —
> `datasheets/PROS-04-PRS40-CV_Hunter_spray-body-metric.pdf`, **manufacturer datasheet, verified.**
> Flush cap → inlet at 155 mm → lateral centreline ~200 mm → **dig 250 mm**, the extra 50 mm taking
> the control cable *under* the pipe.
> ⚠️ **Restored BY CONSEQUENCE, awaiting Dan's confirmation — he ruled on scope, not on depth.**
>
> ⚠️ **The ⛔ *anything going under ground must go in during the groundwork* rule still binds**, and
> is now easier to satisfy: the laterals that were going to want a second dig **are V1 and go in on
> this one.** The duct goes in regardless.

> ## ⏸️ RESTATED 2026-09-06 — Dan's trench ruling. *Superseded in part by the block above; the ROUTES half still governs.*
>
> This phase was written as a **lawn-sprinkler** plan and both `CLAUDE.md` and the outstanding
> register flagged it as an open contradiction needing Dan's call. **He ruled on 2026-09-06.**
>
> A session reading had proposed that the drip re-scope shrank the MVP to a single short mainline
> run to the valve box. ⛔ **Wrong.** Dan corrected it against the pipe map
> (`Projects/golden-shower/garden-layout-2026-08-25.png` in the vault), in his words:
> **"we're going into the garden so to spray the borders, thus the trench."**
>
> | | Verdict |
> |---|---|
> | **The two trench ROUTES** | ✅ **Survive unchanged.** Line 1 = box → S11 → bottom edge → S12; Line 2 = box → left edge → S21 → top edge → S22. The mainline still has to travel out along the borders to reach the beds |
> | **The zone-split dig strategy** | ✅ **Survives** — two independent runs off a shared manifold, so the dig is still two pushes rather than one block |
> | **What the routes TERMINATE in** | ⚠️ **Changed.** A **dripline feed onto a bed**, not a flush pop-up rotary body |
> | **Four-head lateral runs, tees/elbows at S11/S21/S12/S22, swing joints** | ⏸️ **Deferred to Stage 9** with the rotaries |
> | **Trench LENGTH** | ⚠️ **Unmeasured — do not invent one.** ~33 m is scaled off a drawing (`plumbing-rebuild.md`), never walked. See the Phase B tape-walk |
> | **Trench DEPTH** | ⛔ **OPEN — NOT RULED. Dan's call.** See below |
>
> ⛔ **The depth question is genuinely open and is not settled by this ruling.** The 200–250 mm
> below is derived *entirely* from the `PROS-04-PRS40`'s **155 mm retracted height** — a pop-up
> that is now deferred. A mainline feeding **surface-laid** dripline has no such hardware driver,
> so the depth is set by whatever else is wanted: frost, spade/fork strikes, and whether the lawn
> ring's laterals should share this trench next year rather than being dug a second time.
> ⚠️ **Whichever depth is chosen, the ⛔ *anything going under ground must go in during the
> groundwork* rule still binds** — the trench cannot be reopened in March without undoing the
> autumn's work, so the duct goes in on this dig regardless.
>
> ⛔ **And `winterise-system` does not relax either.** The old depth argument was *"the laterals sit
> above frost depth, so drain-down is what makes it safe."* The MVP's emitters are **surface-laid
> dripline plus a filter and a reducer** — shallower still, and the small-bore devices are the
> classic first casualties of a frost. **No procedure exists in this repo yet.**

### ✅ Split it by zone — halves the uninterruptible window

Line 1 (S11, S12) and Line 2 (S21, S22) are independent runs off a shared
manifold, so the dig does **not** have to be one block:

- **First push:** box, manifold, both valves, **Line 1 only** — Line 2's manifold
  outlet stays **capped** (3 caps bought). Trench, lay, test, backfill, turf.
  Complete and safe on its own.
- **Second push, whenever:** trench Line 2, lift the box lid, uncap the outlet,
  connect, test, backfill.

**Two shots at the weather instead of one**, and if winter wins before Line 2 you
overwinter with one working zone rather than nothing. The box being
lid-accessible is what makes connecting zone 2 later a five-minute job.

### ⛔ Decide AND BUY before this phase — swing joints. **RESTORED 2026-09-07.**

**Phase C installs the heads, so the rigid-elbow vs articulated-riser question must be settled and
bought before the weekend.** ⛔ **They are NOT bought, NOT priced and NOT sourced.**

> ⏸️ *Superseded 2026-09-06, and it was explicit: "**Swing joints are rotary-head kit.** The rotaries
> are deferred, so this gate goes with them — it no longer blocks the dig… **Do not buy them for the
> MVP.**" ⛔ **That instruction is wrong under V1** — the rotaries are the MVP.*

- **Why they matter:** running rigid MDPE straight into a pop-up body gives no height adjustment for
  levelling the head to grade, and a boot or a mower cracks the fitting or the body.
- **Manufacturer-backed, not just trade lore:** Hunter's own CAD installation details are titled
  *"…with Hunter Swing Joint"*, *"with Flex Swing Arm"*, *"with Field-Built Swing Arm"*.
- **Only lead in either system:** EGI list *Rain Bird Swing Pipe, 1 m*. ⚠️ **Unpriced, and no
  quantity worked out.**
- ⏳ **Size it once the Phase B head positions are pegged out** — four heads, but riser length depends
  on where the lateral lands.
- ⚠️ **Lead time is the risk, not the money.** It is the one item that can stall an otherwise
  fully-stocked dig, so price it **on the same trip as the tape-walk**, not on the dig weekend.

### The dig itself (box in hand; no longer weather-critical — see revised rule)

- [ ] **Strip the turf from the widened edging strip** — it is being removed
      permanently, not relaid. 150–200 mm wider than the current edge.
- [ ] **⚠️ EXPECT BURIED ROOT AT TRENCH DEPTH — it is already proven present.**
      Digging the valve box pit on **2026-08-29** turned up a substantial root
      from a long-gone tree at **~200 mm down, right at the topsoil/clay
      boundary**. Still solid — **it took a jigsaw to cut out**, in parts, not
      a spade. **200 mm is exactly the lateral trench depth**, so this is on the
      critical path, not a curiosity.
      **Implications for Phase C:**
      - Roots radiate, so budget for **more of the same along both trench
        routes**, not a one-off. **Probe the pegged routes before committing a
        weekend** — a jigsaw job discovered mid-trench blows the schedule.
      - **The jigsaw is trenching kit now**, alongside the spade. Add a spare
        blade; buried grit blunts them fast.
      - It does **not** threaten the install once cut — sound dead wood beside
        a pipe is inert. The cost is time, not risk.
      **Species — not identified, and it does not need to be.** Best call from
      a photo is **Prunus, plum/damson ahead of cherry**, on the streaky
      two-tone heartwood (plum runs multi-coloured; cherry is uniform and
      darkens evenly). *Moderate confidence, from photograph only — a wetted
      end-grain macro would settle it.* ⚠️ Ruled out on sight but worth stating:
      **not yew** (bark is wrong) — yew is toxic and must not be burnt.
      **If Prunus is confirmed, the arisings are prime BBQ smoking wood** —
      cherry and plum both. Don't skip it into the green bin.
- [ ] ✅ **Trench depth — 200–250 mm. NOT open any more (2026-09-07).**
      **Trench the laterals to 200–250 mm; depth is set by the spray body —
      `PROS-04-PRS40` retracted height is 155 mm, so the inlet sits 155 mm below
      grade and the lateral centreline lands ~200 mm.** ✅ **That derivation is
      live again**, because the pop-up is **V1 hardware**. ✅ **And the 155 mm is
      now confirmed from the Hunter datasheet** (*"Retracted height: 15.5 cm"*) —
      the repo had only ever asserted it.
      ⚠️ **Restored by consequence, awaiting Dan's confirmation.**
      ⏸️ *(Superseded 2026-09-06: "DECIDE BEFORE DIGGING. It is open, not
      specified… that derivation is void for the MVP… a mainline feeding
      surface-laid dripline has no hardware driver setting its depth." **That
      described the drip MVP, which is now V2.**)*
- [ ] **Clear sharp stones** from the trench bottom; bed the pipe on fine soil.
- [ ] **Cable in the bottom of the trench, pipe on top** — the pipe then shields
      the cable from a fork. Leave deliberate **slack loops** at both ends; soil
      creeps and a taut cable parts at a termination.
- [ ] **No joints in the buried cable run.** Every splice lives in the box.
- [ ] Set the box, plumb the manifold, 2 valves, 3 caps on the unused ports.
- [ ] ✅ **Laterals to all four heads — tees** through S11/S21, **elbows**
      terminating S12/S22. **RESTORED 2026-09-07 (V1).** ✅ **All four fittings are
      already owned** — `PL/14840C1C` ×2 and `PL/14850C10` ×3, which were
      reclassified *"Stage 9 stock"* on 2026-09-06 and are **V1 stock again.**
      **Each head sits on a swing joint** ⚠ *(unbought — see the gate above)*.
      ⛔ **No filter and no pressure reducer in this chain** — the `PROS-04-PRS40`
      regulates to **2.8 bar** itself *(Hunter datasheet, verified)*, and a
      1.5 bar drip reducer would **starve the heads.**
      ⏸️ *(Superseded 2026-09-06: "DEFERRED TO STAGE 9 with the rotaries. For the
      MVP each route terminates in a dripline feed onto a bed: mainline → filter
      → reducer → valve → 16 mm start connector → two PC laterals per bed,
      surface-laid and pegged." **That is now the V2 build.**)*
- [ ] **Splices — 3 joints** (zone 1, zone 2, and the 3-wire daisy-chained
      common). Do them **under cover if wet**; the DBR/Y gel is built for water
      but not for grit.
- [ ] **WET TEST WITH THE TRENCH STILL OPEN.** Bleed levers, full pressure,
      walk every joint. **Do not backfill until it holds.**
- [ ] Backfill, relay turf, water it in.

## Phase D — Before frost

> ## ✅ RULED BY DAN, 2026-09-07 — this phase does NOT gate V1
>
> > **"it wont sit in water (v1) We'll be fine."**
>
> **Settled. His call.** The V1 rotary system will not hold standing water and will not be run before
> next spring. ⛔ **Do not treat drain-down as a blocker on the dig or on backfill.**
>
> ✅ **The drain *method* stays a TODO for V2's dripline**, which is the frost-exposed build and the
> one with no verified method. ⏸️ *(Superseded 2026-09-06: "the MVP's emitters are surface-laid
> dripline (0 mm, not 200 mm) plus a filter and a pressure reducer — small-bore devices that hold
> water and are the classic first casualties of a frost." **That is the V2 case.**)*
>
> 📌 **One neutral sequencing fact, for the dig checklist rather than as a warning:** *if* automatic
> drain valves are ever wanted, they fit at the lateral **low points, during the dig**.

- [ ] **Drain down when convenient.** Isolate at the tap, open every valve bleed
      lever, drain the low points, leave it empty. **Good practice, not a gate.**
- [ ] Record the procedure in the repo — it does not exist yet. **Wanted ahead of
      the V2 dripline**, and settled against the dripline actually ordered.

## Phase E — Winter (electrician)

- [ ] IP66 cable changes to the new outlet.
- [ ] New IP66 outlet + run back to the house breaker box. **Sparky's job.**
- [ ] Buy the four remaining `SOURCE` items: 230 V flex, ferrules, earth bond,
      breather plug. *(Still four — see the note under the lead below.)*
- [x] **External mains lead** — ✅ **BOUGHT 2026-09-06**, Screwfix
      `A27859275166`, **£23.03 inc**: `994JY` **Time `3183P` 3-core 1.5 mm²,
      10 m coil** £19.99 · `651VT` **M20 gland** 2-pack £1.35 · `68744`
      **13 A fused plug** £1.69. Click & Collect **Horsforth**, held 21 days —
      **wait for the SMS before travelling.**
      > ⛔ **It is `3183P`, NOT H07RN-F.** Screwfix state **"rated 300/500 V"**,
      > which is the H05RN-F class; the `07` in H07RN-F *means* 450/750 V.
      > **Correct description: "3183P rubber flex (PCP sheath), 300/500 V
      > class."** ✅ **Functionally right regardless** — the requirement was a
      > **rubber sheath**, not a voltage class, and on 230 V behind the **3 A
      > fuse now fitted** (2026-09-07 — see below), 450/750 V buys even less
      > than it did against the 5 A this line originally cited. PCP sheath,
      > **−35 to +60 °C**, sold by Screwfix for *"pond pumps and other outdoor
      > cabling applications"*.
      > *(Superseded, kept as history: this line previously said to buy
      > **H07RN-F `3G1.0`**, ⛔ not 0.75 mm² — that size is only made as
      > H05RN-F. True about H07RN-F, and moot: Screwfix's 3183P range starts at
      > 1.5 mm², so no thin rubber option existed.)*
- [ ] ⛔ **Drill the enclosure entry out from M16 to M20 — NEW WORK, added
      2026-09-06.** The fitted **WEMNO M16 seals 3–8 mm** and the bought lead is
      **~9.75 mm** ⚠, so the gland's seal **never compresses on the sheath at
      all** — this is not a tight fit, it is no seal. Opening the entry from
      **~16.5 mm to ~20.5 mm** ⚠ *(hole sizes **inferred from the metric thread
      designation, not a datasheet** — **caliper the existing hole first**)* is a
      **step-drill / cone-cutter job on an already-built and wired box**.
      ⛔ **Remove or shroud the board and both PSUs first, and clear every chip
      before re-sealing** — swarf near electronics is the risk, not the hole.
      Full procedure: `specs/build-guide.md` **Stage 6 step 3**.
      > 📌 **Dan chose this route knowingly, 2026-09-06.** Build guide 7A step 3
      > offers *"or sleeve in conduit"*, which needs no drilling; it was put to
      > him and he took the cable-and-gland swap. **Recorded, not re-argued.**
- [x] ✅ **Fuse fitted 2026-09-07 — 3 A, not 5 A.** `68744` shipped with
      **13 A**; Dan has fitted a **3 A BS 1362 fuse**, tighter than the 5 A
      this line previously called for. HDR-15-5 typical AC input current is
      **0.25 A at 230 VAC** *(datasheet, verified)* — 3 A leaves ~690 W of
      headroom over the actual load. Every cable-protection argument built on
      "5 A" elsewhere in this repo holds *a fortiori* at 3 A. ⚠️ **Only open
      risk: nuisance-blowing on cold start** — inrush is **45 A at 230 VAC,
      cold start** *(datasheet, verified)*, sub-ms and within a BS 1362 fuse's
      normal pre-arcing I²t, but that margin is **inferred, not verified
      against a fuse datasheet**. If it ever blows on power-up, step up to
      **5 A — never back to the 13 A it shipped with**, now a spare.
- [ ] ⚠️ **Free checks on the old lead, before it is cut up for cores** — its
      plug is reportedly **rewireable, not moulded**, so **open it**: read the
      **sheath printing** (settles whether it was ever H05VV-F — the cut destroys
      the evidence) and check **whether 1.5 mm² seats in its cord grip and
      terminals**. Neither is done.
- [ ] Pull the control cable, terminate both ends, commission.

---

## Notes

**Best month is probably September, not late August.** Ground still warm so
relaid turf knits fast, air cooler, and months before frost. Wait for a dry-ish
spell with a couple of dry days either side so the ground is not saturated.

**Hiring a turf cutter or trencher** turns the biggest unknown (~33 m of hand
digging, 4–7 hours) into a couple of hours. Worth pricing.

**Leave the pipe ends long at the box.** The box's side knock-outs set the entry
height and that cannot be known until it is in front of you. Cutting short is
unrecoverable; leaving long costs nothing.

## On not cutting corners under time pressure

The defence is structural, not willpower: **do the precision work while there is
no time pressure, and let the pressure fall on the shovel.**

Digging fast costs a sore back. **Assembling fast costs the system** — an
unchamfered pipe end, an overtightened taper, a joint buried untested. Phase A is
where quality gets banked: indoors, dry, unhurried. Get it done and the worst a
rushed dig can produce is an untidy lawn.
