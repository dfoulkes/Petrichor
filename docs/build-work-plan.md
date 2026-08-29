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

**The only remaining date in the project is draining down before the first hard
frost.**

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
- [ ] **Rebuild the valve assembly on a bench** — dry, unhurried, indoors.
      **Chamfer and silicone-lubricate every pipe end** (Plasson's own
      instruction; missing from the original build).
      **Hand-tight plus a gentle nip only** on the Hansen bushes — they are
      tapered and wedge; forcing splits plastic ports.
- [ ] **Above-ground wet test** on a temporary surface rig (build guide 8C —
      *"needs no trenching and no second valve"*). Rain is irrelevant; you are
      spraying water anyway. **Prove it holds before anything goes in a hole.**
- [ ] **Throw test** — MP3500 at 90° against the 8.9 m corner-to-centre. Pick a
      still day; wind skews it.
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
- [ ] Screwfix: **MDPE pipe cutter**, black **cable clips**. M20 gland if needed.

## Phase B — Set out (outdoors, wet-tolerant, no box needed)

- [ ] **Peg out the four head positions** — S11, S12 (Line 1) and S21, S22
      (Line 2), one per corner. Needed before swing joints can be sized.
- [ ] **Mark both trench routes.**
- [x] **Dig the valve box pit** — ✅ **DONE 2026-08-29** by Dan and Alysha:
      **700 × 500 × 410 mm deep**, membrane laid, 1 of 3 gravel bags in.
      *(An initial "roughly 610" on the long axis was Dan's mis-measure,
      corrected same day to 700. No re-cut needed — 700 is bang on target.)*
      **Depth:** 410 mm − 300 mm box = **110 mm bed**, lid flush. More drainage
      than the 75 mm originally specced, and the number that is painful to fix
      once membrane is down — so this is the good half.
      **Long axis:** 700 vs the Irritec Jumbo 12" **640 mm** base = **30 mm
      clearance per end.** ✅
      ⚠️ **Short axis: 500 vs a 500 mm base = zero nominal clearance.**
      Dan's call is that this is fine, and the taper supports him — the box
      goes **500 → 370 over 300 mm (43 mm per 100 mm)**, so only the bottom
      ~50 mm is tight; at 100 mm up there is 21 mm a side and at the lid 65 mm.
      It self-centres and backfills freely above the rim. **The residual risk is
      tolerance, not design:** 500 is a vendor spec-table figure for a large
      moulded PP tub (±5 mm is ordinary) and the same-mould HydroSure is quoted
      at **507**. **Settled by the tape, not by this doc** — see next item.
      ❌ **The old target line here was defective and is retired:** it read
      *"to the HydroSure footprint 640 × 507 mm"* — the bare footprint of the
      *wrong variant*, with **no working clearance at all**. A pit dug exactly
      to it could never have been levelled or backfilled.
      ✅ **Settled pit spec: 700 mm long × 400–410 mm deep**, short axis ≥ the
      box's *measured* base. Measure **at gravel-bed level, not the top rim** —
      hand-dug sides taper inward.
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

### ⚠️ Decide before this phase — swing joints

Phase C installs the heads, so the rigid-elbow vs articulated-riser question must
be **settled and bought** before the weekend, not during it. Hunter's own CAD
details assume swing joints. Currently backlogged — un-backlog it before digging.

### The dig itself (box in hand; no longer weather-critical — see revised rule)

- [ ] **Strip the turf from the widened edging strip** — it is being removed
      permanently, not relaid. 150–200 mm wider than the current edge.
- [ ] **Trench the laterals to 200–250 mm.** Depth is set by the spray body, not
      by frost: **PROS-04-PRS40 retracted height is 155 mm**, so the inlet sits
      155 mm below turf and the lateral centreline lands ~200 mm.
- [ ] **Clear sharp stones** from the trench bottom; bed the pipe on fine soil.
- [ ] **Cable in the bottom of the trench, pipe on top** — the pipe then shields
      the cable from a fork. Leave deliberate **slack loops** at both ends; soil
      creeps and a taut cable parts at a termination.
- [ ] **No joints in the buried cable run.** Every splice lives in the box.
- [ ] Set the box, plumb the manifold, 2 valves, 3 caps on the unused ports.
- [ ] Laterals to all four heads — **tees** through S11/S21, **elbows**
      terminating S12/S22.
- [ ] **Splices — 3 joints** (zone 1, zone 2, and the 3-wire daisy-chained
      common). Do them **under cover if wet**; the DBR/Y gel is built for water
      but not for grit.
- [ ] **WET TEST WITH THE TRENCH STILL OPEN.** Bleed levers, full pressure,
      walk every joint. **Do not backfill until it holds.**
- [ ] Backfill, relay turf, water it in.

## Phase D — Before frost

- [ ] **Drain down.** Isolate at the tap, open every valve bleed lever, drain the
      low points, leave it empty.
      **This is not housekeeping.** The laterals sit at ~200 mm, above UK frost
      depth, and the `-CV` spray bodies deliberately hold water in the head.
      **The shallow burial is only safe because the system is drained.**
- [ ] Record the procedure in the repo — it does not exist yet.

## Phase E — Winter (electrician)

- [ ] IP66 cable changes to the new outlet.
- [ ] New IP66 outlet + run back to the house breaker box. **Sparky's job.**
- [ ] Buy the four remaining `SOURCE` items: 230 V flex, ferrules, earth bond,
      breather plug.
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
