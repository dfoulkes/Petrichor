# Outstanding to complete the build

> **Consolidated register as of 2026-09-07.** Everything still needed to get
> Petrichor from "proven on the bench" to "installed and running". Compiled from
> a completeness sweep of the repo plus the 2026-08-25 sourcing work, restated
> **2026-09-06** for the bed-drip re-scope, and **restated again 2026-09-07** for
> Dan's **V1 / V2** ruling — which **reverses** the drip re-scope: **V1 is the
> rotary sprinklers on two zones; the drip feed is V2, Spring/Summer 2027.**
>
> Water-side reasoning and part evidence lives in
> [`plumbing-rebuild.md`](plumbing-rebuild.md). This file is the *what's left*
> list, not the *why*.
>
> ⚠️ **Dated content below is preserved, not rewritten.** Everything stamped
> 2026-08-25 / 2026-08-27 was written against the *lawn-first* design. Where the
> re-scope changed an item's status it is **annotated in place**, not deleted —
> the superseded reasoning is what explains the inventory that was actually
> bought, and deleting it would make the spend unreadable.

## ⛔ RESTATED 2026-09-07 — V1 is the ROTARIES on two zones; drip is V2 (2027)

**Read this before anything below it.** Dan re-scoped the project on **2026-09-07**
— vault decision **#25** — and this supersedes the 2026-08-31 drip re-scope that
the rest of this file was rebuilt around on 2026-09-06.

> **"V1 = sprinklers installed, working, trenched and piped. (beds) both zone 1
> and zone 2."**
> **"V2 = drip feed (Spring / Summer 2027)."**

📌 **The reading, recorded AS a reading** — Dan gave scope, not a design. V1 is
the **pop-up rotary system**, actually working, covering the **beds / borders**,
split across **two zones** mapped onto the two existing trench routes.

### What V1 is

| | |
|---|---|
| **Zone 1** | Rotaries on **Line 1** — valve box → **S11** → along the bottom edge → **S12** |
| **Zone 2** | Rotaries on **Line 2** — valve box → up the left edge → **S21** → across the top → **S22** |
| **Heads** | **4 × `PROS-04-PRS40-CV` flush pop-up bodies**, nozzles TBC — ✅ **all owned** |
| **Valves needed** | **Two, both already owned.** Three are in hand; the third goes to V2 |
| **V2 — Spring/Summer 2027** | The **bed drip feed** (dripline, filter, reducer, 16 mm fittings, pegs) **and the hanging baskets**, on the third valve |

### ⛔ V1's critical path is NOT a shopping list

**"The drip parts are unordered" is no longer the blocker** — it went to V2 with
the drip, and **not one drip part was ever ordered, so nothing is stranded.**

✅ **Every rotary part is already in hand:** 4 × `PROS-04-PRS40-CV` bodies,
4 × `HI/MP3500-90` + 1 × `HI/MP3000-90`, the `HI/MPTOOL`, tees `PL/14840C1C` ×2,
elbows `PL/14850C10` ×3, the 4-way manifold, the valve box, 50 m MDPE, the 15 m
field cable and 4 × DBR/Y splices.

**V1 is gated on three FREE physical checks, and then a dig:**

| ⏳ | Check | Why it gates V1 |
|---|---|---|
| **1** | **Thread dry-fit** — owned PRS40 body vs owned `20 mm × 1/2" BSPM` connector, dry | Binds at ~2 turns = NPT variant, and £12.80 of tees/elbows go back. **Do this first — it can cancel everything.** |
| **2** | **Throw test** | ⛔ **BACK ON THE CRITICAL PATH.** Filed *"never as a blocker"* on 2026-09-06 because it tested *lawn* coverage. **V1 is the rotaries.** |
| **3** | **Walk both trench routes with a tape** | Trench length is unmeasured; sets the dig, the MDPE budget (**marginal**) and whether a second coil is needed *before* the trench is open |

### ⚠️ NEW PURCHASE GAP — SWING JOINTS. The only outstanding V1 water-side buy.

⛔ **Not bought, not priced, not sourced.** Articulated risers between the lateral
and the pop-up body: height adjustment to level the head to grade, and they save
the fitting or the body when a boot or a mower hits the head. **Hunter's own CAD
installation details assume one** (*"with Hunter Swing Joint"*, *"with Flex Swing
Arm"*).

- ⛔ **In scope BECAUSE of the re-scope.** They were deferred to Stage 9 on
  2026-09-06 with the explicit instruction ***"Do not buy them for the MVP"***.
  **That instruction is now wrong** — V1 puts four pop-up bodies in the ground.
- **The only lead in either system:** EGI list *Rain Bird Swing Pipe, 1 m*.
  ⚠️ **Unpriced in the repo and the vault, and no quantity worked out.**
- ⏳ **Size after the heads are pegged out** (Phase B) — four heads, but the riser
  length depends on where the lateral actually lands.

### ⚠️ The filter and the ~1.5 bar reducer are NOT V1 parts

**Stated on manufacturer evidence rather than carried forward unexamined.**

| | |
|---|---|
| ⛔ **Do NOT fit a 1.5 bar reducer for V1** | The `PROS-04-PRS40` bodies are themselves **pressure-regulated to 2.8 bar** — *"To optimise MP Rotator Nozzle performance, the Pro-Spray PRS40 is pressure-regulated to 2.8 bar; 280 kPa"* *(`datasheets/PROS-04-PRS40-CV_Hunter_spray-body-metric.pdf`, **manufacturer datasheet, verified**)*. **Reducing the supply to 1.5 bar starves the very heads V1 is built on.** The reducer is a **drip-leg** part — in V2 it belongs downstream of the split |
| ⚠️ **No filter is ESTABLISHED as required for V1** | Hunter's design guide conditions primary filtration on **dirty water**: *"You should use primary filtration when operating with dirty water"*, and *"a general rule is to use primary filtration that is five times the mesh rating of the nozzle filter"* *(`datasheets/LIT-461_Hunter_MP-rotator-design-guide-metric.pdf`, verified)*. Every MP Rotator carries a **removable inlet filter screen** *(MP3500 datasheet, verified)*, and the `100-DV` has a built-in **90-mesh (200 micron)** solenoid filter. On a clean mains supply that restores this repo's own 2026-08-25 ruling — Dan: *"seems overkill for v1."* |
| ⚠️ **Evidence class** | **A manufacturer-backed inference, not a Dan ruling.** It is stated as such. The *"mandatory"* promotion of 2026-08-31 was reasoning about **emitter clogging** and travels with the dripline to V2 |

### What moved between V1, V2 and deferred on 2026-09-07

| Item | Was (2026-09-06) | Now |
|---|---|---|
| **MP3500 ×4, MP3000 ×1, PRS40 bodies ×4** | Stage 9 stock, deferred | ✅ **V1 hardware, in hand** |
| **Tees `PL/14840C1C` ×2, elbows `PL/14850C10` ×3** | *"Stage 9 stock, not waste"* | ✅ **V1 stock** |
| **Throw test** | *"off the MVP critical path… never as a blocker"* | ⛔ **V1 gate, and free** |
| **Sag-under-flow / dynamic pressure** | obsolete for the MVP, gates Stage 9 | ⛔ **V1 gate again** — PC dripline self-regulating was a statement about V2 |
| **Head peg-out — S11/S12/S21/S22** | deferred to Stage 9 | ⏳ **Back in Phase B** |
| **Swing joints** | Stage 9, *"do not buy for the MVP"* | ⚠️ **V1, and UNBOUGHT** |
| **Trench depth 200 mm / dig 250** | ⛔ open — its source was a deferred pop-up | ✅ **Source restored** (see below) |
| **16 mm PC dripline, reducer, filter, 16 mm fittings, `ESS16-H` pegs** | the MVP critical path | ⏸️ **V2, Spring/Summer 2027.** ✅ Never ordered — nothing stranded |
| **Hanging baskets** | Stage 9, zone 2 | ⏸️ **V2**, with the drip, on the third valve |
| **Circular self-back-feeding loop** | obsolete for the MVP | ⛔ **Still obsolete** — replaced by two independent branch runs on 2026-08-25. **The one thing the reversal does NOT bring back** |
| **Acceptance test** | *"wetted cones joined into a wet band"* | ⏸️ **V2** — it is a dripline test. **V1's is below** |

### ✅ Trench depth — the blocker DISSOLVES

The 200 mm derives entirely from the `PROS-04-PRS40`'s retracted height. **That
body is V1 hardware again**, so the derivation is live: retracted **155 mm** →
inlet at 155 mm → lateral centreline **~200 mm** → **dig 250 mm** (the extra
50 mm takes the control cable, laid *under* the pipe).

✅ **And the 155 mm is now CONFIRMED, not asserted** — *"PROS-04-PRS40-CV ·
Retracted height: 15.5 cm"*, `datasheets/PROS-04-PRS40-CV_Hunter_spray-body-
metric.pdf` *(manufacturer datasheet, verified)*. **This repo had carried the
figure for weeks without ever citing its source.**

⚠️ **Restored BY CONSEQUENCE, awaiting Dan's confirmation.** He ruled on scope,
not on depth — this is an inference from his ruling, not a fresh ruling from him.

### ⛔ V1's acceptance test — the drip one does not transfer

The 2026-08-31 gate was *"the wetted cones have joined up… a wet band, not
isolated damp spots"*. **That is a dripline test and it moves to V2.**

**V1 is accepted when:**

1. **Each valve actuates wet** — closes decision #11's deferred half. *(Unchanged
   across every re-scope.)*
2. **Both zones run end to end on their own valve**, one live at a time on the
   firmware interlock. ⚠️ **No filter and no reducer in that chain.**
3. **Every head throws a real pattern onto its intended target** — arcs set, **no
   dry gap between adjacent heads**, no overspray onto patio, fence or house.
   Radius trimmed **down** with the `HI/MPTOOL` where it overthrows.
4. **The trench holds pressure with every joint visible.** ⛔ **Wet-test before
   backfilling.**

⚠️ **A catch-can / precipitation-rate method is NOT specified anywhere in this
repo and is not being invented here.** If uniformity has to be proved
numerically, that method needs choosing first.

### ⏸️ Superseded — the 2026-09-06 lead section, kept as dated history

> **The MVP is the beds, on drip.** *"Until 2026-08-31 this register framed the
> outstanding work around MP3500 rotaries watering the lawn. That target was
> wrong. The three flower beds — north, east and west — are the priority and
> always were."* ✅ **The PRIORITY survives #25 intact — the beds are still the
> target. Only the METHOD changed: V1 waters them with rotaries, not dripline.**
>
> ⚠️ *"The lawn cannot be watered as a byproduct of the beds — drip has no
> throw."* **True of drip. V1's emitters throw**, so the question changes shape
> entirely — **do not read that line as governing V1.** It still governs V2.
>
> The drip BOM and its evidence gaps are preserved in full and carried into the
> vault ticket **`plan-v2-bed-drip-zone`**, so none of the work is lost:
>
> | Part | Spec | Status |
> |---|---|---|
> | **16 mm PC inline dripline** | ~**80 m** ⚠, PC, ~2.3 L/hr emitters @ ~30–33 cm ⚠ | ❌ not priced, no vendor |
> | **Pressure reducer** | ~**1.5 bar**, 3/4" BSP | ❌ not priced |
> | **Filter** | ~**120 mesh / 130 micron**, 3/4" BSP | ❌ not priced |
> | **16 mm fittings** | start connector (3/4" BSP × 16 mm), tees, elbows, end caps / flush valves | ❌ not priced |
> | **Dripline pegs** | **Access Irrigation `ESS16-H`, 100-pack** — fits 16 **and** 20 mm. ⛔ **EGI stock no 16 mm hold-down at all** — checked. The 100 beats 4 × the 25-pack (`ESS16-Q` £9.80 ex = £39.20) | ✅ **£34.00 ex / £40.80 inc** *(vendor page, verified)* · ❌ **not bought** |
>
> ⚠️ **Evidence gap carried forward to V2 unresolved: there is no dripline
> datasheet in `datasheets/`.** Every drip figure above is **repo-internal and
> unverified** — confirm emitter flow, spacing and PC pressure range against the
> product actually ordered. 📌 Access give free delivery only **over £150 ex VAT**,
> so the pegs must travel with the rest of the drip order.
>
> ⏸️ *Also superseded here: the "What moved OUT of outstanding and into DEFERRED"
> table (MP3500s/PRS40 bodies to Stage 9, throw test off the critical path, sag
> gate obsolete, head positions deferred). **Every row of it reversed on
> 2026-09-07** — see the V1/V2 movement table above.*

✅ **`build-work-plan.md` has been restated twice — 2026-09-06 for Dan's trench
ruling, and 2026-09-07 for V1.** The two trench **ROUTES** have survived both
re-scopes unchanged — *"we're going into the garden so to spray the borders, thus
the trench."* **What the routes terminate in has now reverted to flush pop-up
rotary bodies**, and the pegged head positions and the swing-joint gate come back
with them. ⚠️ **Trench LENGTH remains the one genuinely open item — unmeasured;
~33 m is scaled off a drawing.** See *Unresolved* row 6.

## Plan — settled 2026-08-25

> ✅ **RESTATED AGAIN 2026-09-07 — the target below is CORRECT AS WRITTEN.**
> *"Sprinklers in, working and not leaking, before winter 2026"* is exactly Dan's
> V1: *"sprinklers installed, working, trenched and piped."*
> *(Superseded 2026-09-06: "the target below reads 'sprinklers in' because it was
> written against the lawn-first design. The 2026 acceptance target is now the bed
> drip zone, on the valve already owned." **That is now V2, 2027.**)*
> The *sequencing* logic — a hand-operable water system this year, electrics
> deferred to winter — has survived every re-scope untouched.

**Target: sprinklers in, working and not leaking, before winter 2026.**
Electrical completion is deliberately deferred to winter, when electricians are
short of work. Dan: *"if we can end the year with the groundwork done then we can
get the last of it done through the winter when sparkies are short of work."*

Enclosure ("the spicy side box") is **built**. Outstanding on that side: minor
cable changes for IP66 to a new outlet, and a new IP66 outlet run back to the
breaker box in the house — **that run needs an electrician**, and is a winter job.

### What this sequencing means

| | |
|---|---|
| **Acceptance criterion this year** | Leak-free, wet-tested, backfilled. **Not** automated. |
| **Commissioning method** | Manual **bleed levers** — the build guide already notes they *"prove the valve body independently of the electrics"*. No controller, no field cable, no sparky needed to wet-test. |
| **Before burying** | Bench-energise each solenoid off the proven controller. The bleed lever proves the **body**, not the **coil**. (Low risk — the box is lid-accessible, so a spring swap is easy.) |

### ⛔ The thing that must not slip — duct in the trench

**Anything going under ground must go in during the groundwork.** The trench
cannot be reopened in March without undoing the autumn's work.

**Lay duct, not cable.** The electrician then specs and pulls the right cable in
winter, and no cable decision has to be made now.

**Use spare 20 mm MDPE as the duct for the 24 V run.** ~100 m owned against a
~33 m pipe run, so there is plenty spare. 20 mm MDPE has ~16 mm bore; a 3-core
0.75 mm² outdoor cable is 8–9 mm OD and pulls through easily. MDPE is rated for
burial. For an **ELV** run enclosure→manifold this is entirely legitimate and
already paid for.

- Leave a **draw string** in it.
- **Marker tape** above it.
- ⚠️ The **mains** run to the breaker box is a different matter — proper duct,
  marker tape, and it is the **electrician's spec, not ours**. Do not pre-empt
  it; just avoid trenching the same route twice if they share it.

### ❄️ Winterisation — RULED NOT CRITICAL FOR V1 BY DAN, 2026-09-07

> **"it wont sit in water (v1) We'll be fine."**

**Settled — his call, recorded as such. Not a gate on V1, and not a gate on the
dig.** The V1 rotary system will not hold standing water, and the system will not
be run before next spring.

✅ **The drain *method* stays a live TODO — for V2.** The **Spring/Summer 2027 bed
dripline** is the genuinely frost-exposed case, and it is also the one with no
verified method: ⚠️ **whether dripline is drained, blown through or simply left to
its emitters is unverified** — no dripline datasheet exists and no product is
chosen, so it is an **input to the V2 purchase**, not a job afterwards.

📌 **One neutral sequencing fact, for the dig checklist:** *if* automatic drain
valves are ever wanted, they fit at the lateral **low points, during the dig**
(EGI stock them, £15.25–£17.95). Stated once, as information.

> ⏸️ **Superseded, kept as dated history — the 2026-08-25 / 2026-09-06 framing:**
> *"Winterisation is now part of THIS year's job… if groundwork finishes in
> November and nothing is energised until spring, the system sits full of water,
> unpowered, all winter… Drain-down is the final step of the 2026 groundwork, not
> a spring problem."* And the 2026-09-06 amendment: *"the re-scope does not let
> this off — the MVP is surface-laid dripline plus a filter and a pressure
> reducer."* ⛔ **Both are superseded for V1 by Dan's ruling above.** The second
> describes **V2** and is still the reasoning for it.

## ✅ Field cable — BOUGHT. This section is superseded.

**Corrected 2026-08-27.** Earlier revisions of this file (and `CLAUDE.md`) said
the field cable "has never been bought" and that it was the item without which
"the controller cannot reach the valves". **Both were wrong from the moment
EGI144337 was placed on 2026-08-25.** It was delivered 2026-08-27.

| Bought | Part | Covers |
|---|---|---|
| `RB/IRRICAB5-15M` ×1, £27.75 | Rain Bird 5-core irrigation control cable, 15 m | Spec asked for **zones + 1 cores, <10 m**. 5 cores = **4 zones + common**, matching the 4-way manifold of decision #19; 15 m against a <10 m estimate. |
| `RB/DBRY.P2` ×2, £15.10 | 4 × DBR/Y gel-filled direct-burial splices | 2 zones + common = **3 joints** needed. 4 owned. |

The **duct still goes in during the groundwork** regardless, and spare 20 mm MDPE
serves — that has not changed.

⚠️ **Verify the run before trenching.** The controller sits at the **SW patio
corner** ([[install-power-socket]]); the valve box is bottom-left of the garden.
15 m has not been walked with a tape. Do it when the routes are marked — a short
cable is the one mistake this order cannot absorb.

## Still marked `SOURCE` — four items, not six

| Line | Item | Qty |
|---|---|---|
| 345 | 230 V mains — 0.75 mm² flex cores, tri-rated outdoors | 5 |
| 351 | Ferrules — 0.75 mm² · 6 mm bootlace | 6 |
| 352 | Earth bond — DIN earth block, or M4 + ring crimp | 1 |
| 355 | Vented drain / breather — IP-rated M12–M16 breather plug | 1 |

**None of these four is a field part.** They are all enclosure-side, so none of
them blocks groundwork.

> ⚠️ **Amended 2026-09-06 (morning) — it is six enclosure-side items now, not
> four.** The external-lead work added **H07RN-F `3G1.0`** and an **M20 gland**
> to the `SOURCE` list. The **"four" heading above is kept because it is the
> count against the original wiring BOM lines**; the two new ones are additions
> to that BOM, not items it ever listed. **The conclusion is unchanged: all six
> are enclosure-side and none blocks groundwork.**

> ✅ **Amended again 2026-09-06 (afternoon) — back to FOUR, and it is the same
> four the heading always meant.** Screwfix `A27859275166` bought **the cable,
> the M20 gland and a plug**, so both items the morning amendment added are
> **`IN HAND`**. Recounted line by line, not carried over:
>
> | | Item | Status |
> |---|---|---|
> | 1 | 230 V mains — 0.75 mm² flex cores, tri-rated outdoors ×5 | `SOURCE` |
> | 2 | Ferrules — 0.75 mm² · 6 mm bootlace ×6 | `SOURCE` |
> | 3 | Earth bond — DIN earth block, or M4 + ring crimp ×1 | `SOURCE` |
> | 4 | Vented drain / breather — IP-rated M12–M16 breather plug ×1 | `SOURCE` |
> | ~~5~~ | ~~External mains lead~~ | ✅ **`IN HAND`** — 3183P 1.5 mm² 10 m, `994JY` |
> | ~~6~~ | ~~M20 gland~~ | ✅ **`IN HAND`** — Vimark `651VT`, 2 pack |
> | *(new)* | *Fused plug for the bare-ended coil* | ✅ **`IN HAND`** — `68744`. **Never on the SOURCE list**: the old lead came with its plug moulded on, so buying a bare coil created this requirement. It is bought, so it costs nothing — but it is the kind of item a swap silently invents |
>
> ⚠️ **The 10 m of 3183P does NOT clear line 1.** Line 1 wants **0.75 mm²
> cores, tri-rated (105 °C)** for the inside of a box that reaches 50–60 °C.
> 3183P is **1.5 mm²** and its **core temperature class is not sourced** —
> so the offcut is not a substitute. ⚠️ **And line 2 may now be wrong:** the
> ferrules are specced **0.75 mm² / 6 mm bootlace**; if any 1.5 mm² 3183P core
> is terminated with a ferrule, that needs a **1.5 mm² ferrule**. **Unverified —
> settle it when the internal re-wire is specced, not now.**
>
> **The conclusion is unchanged and now stronger: four items, all
> enclosure-side, none blocks groundwork.**

On the gel connectors, the build guide is blunter than about anything else in it:
*"Never a dry Wago in the ground. This is the single most failure-prone spot in
the whole build."* **That risk is now closed** — 4 × DBR/Y are in hand. The Wago
221s remain **enclosure** parts, not chamber parts.

**Sourcing the remaining four:** a Screwfix / CEF order, not an irrigation
vendor. Not yet priced. **No rush** — see the postage note below: the electrical
side is still design-mobile (trench route and depth unpegged), and these four are
the cheapest items in the build to buy late.

## Undocumented gaps found 2026-08-25

### ❄️ Winterisation — nothing in this repo mentions it

> ✅ **CLOSED FOR V1 2026-09-07 — Dan's ruling:** *"it wont sit in water (v1)
> We'll be fine."* **Not a V1 concern and not a gate on the dig.** The section
> below is kept because its reasoning is the standing case for **V2's dripline**,
> where the method genuinely does need settling.

Grepped for *winter, frost, freeze, drain-down, blow-out* across all docs:
**zero hits**.

It is not a neutral omission. The spray bodies bought are the **`-CV`
check-valve** variant, whose entire purpose is to **stop low-head drainage** —
i.e. it deliberately **holds water in the body**. Correct on a slope; it also
means every head sits full of water at turf level through a Leeds winter.

- Buried 20 mm MDPE at depth: generally fine.
- **The valve box is an air void and gets far colder than surrounding soil.**
- The heads are the shallowest part of the system.

Mostly a **procedure** gap, not a parts gap: isolate at the tap, open the valve
bleed levers, let it drain. If automation is wanted, EGI stock *MDPE/HDPE
Professional Automatic Drainage Valve*, £15.25–£17.95, for the low points.

**Decide and write the procedure down before October.**

### ✂️ MDPE pipe cutter — not owned, not mentioned

Plasson compression fittings seal on an **O-ring against the pipe's outside
diameter**. A hacksaw leaves a ragged, out-of-square end with burrs that can
score the O-ring on insertion. There are roughly **14 pipe ends** in this build.
No document says how the pipe gets cut. A plastic pipe cutter is £10–15.

### Ducting — decision not made

Line 353 says the field cable is *"direct-burial **or duct** if buried"*. If the
cable bought is not direct-burial rated, duct is required. Undecided.

### Tap-end pressure gauge — assumed, never confirmed

Stage 8C requires **both** ends instrumented. The guide assumes an *"existing
dead-end gauge on the splitter's spare threaded outlet"* for gauge #1. The BOM
lists only the **head-end** gauge assembly. Lay eyes on the tap-end gauge before
test day — a two-gauge method with one gauge produces a reading, not a model.

## Physical checks pending (free, do before burying anything)

| Check | Settles |
|---|---|
| **Liner test** — push the white part into a 20 mm offcut | Whether Plasson ship a liner or one must be bought (Screwfix `33270`, £6.38) |
| **Thread dry-fit** — owned PRS40 vs owned 1/2" BSPM connector | Whether the head fittings are BSP as EGI's spec field claims. Binds at ~2 turns = NPT, £12.80 of tees/elbows go back inside 30 days |
| **Which end drips** on the splitter joint | Brass end = worn thread (replacement bought). Nut end = missing liner |
| ⛔ **THROW TEST** — a head off the splitter, measure where it lands | ⛔ **BACK ON THE CRITICAL PATH 2026-09-07 — it gates V1.** *(Superseded 2026-09-06: "no longer on the MVP critical path… do it opportunistically… never as a blocker on the beds." True while the MVP was drip.)* **V1 is the rotaries, so coverage is the whole point, and this check is FREE.** ⚠️ **Do NOT inherit the target figure.** 8.9 m and ~7.4 m are both **corner-to-LAWN-CENTRE**; V1 aims at **the beds and borders**, a different problem with no arithmetic anywhere in either system. The inherited **90° arcs** are unverified for it too. ✅ **New datasheet input:** Hunter allow **"radius reduction up to approximately 25% on all models"**, so an owned MP3500 trims to **≈7.05 m** *(MP3500 datasheet, verified)* — useful, but **not a substitute for the test** |
| ⛔ **Dynamic pressure at the head, under flow** *(restored 2026-09-07)* | ⛔ **V1 gate again.** *"PC dripline regulates itself"* was a statement about the drip MVP, which is now V2. **Take it while the 8C rig is on the surface** — after backfill the same reading costs a trench |
| **Read the old lead's sheath printing** *(new, 2026-09-06)* ⛔ | Whether the supplied lead was **ever `3183Y` / H05VV-F** — a grade this repo has only ever **inferred**, never read. ⛔ **Do it BEFORE the lead is cut up for cores — the cut destroys the evidence.** ⚠️ **Still not done.** Newly *possible*: its plug is reportedly **rewireable, not moulded**, so it opens |
| **Does 1.5 mm² seat in the old plug?** *(new, 2026-09-06)* ⚠ | Whether the new 3183P can reuse the **existing rewireable plug's cord grip and terminals**, or whether the bought `68744` is doing that job. ⚠️ **Unverified.** Free — check it **with the plug open**, which is happening anyway for the sheath printing above |
| **Caliper the existing M16 box hole** *(new, 2026-09-06)* ⛔ | The actual diameter to drill from. The ~16.5 → ~20.5 mm figures are **inferred from the thread designation, not a datasheet**. ⛔ **Measure before the cutter touches the box** |
| **Read the `651VT` M20's clamping range off the packet** *(new, 2026-09-06)* ⚠ | Whether the M20 actually seals **~9.75 mm**. Not recorded anywhere in this repo. The M16 failed by being picked on **thread size** without checking **seal range** — do not repeat it one size up |
| ⏸️ ~~**Dripline dry-run**~~ *(new 2026-09-06)* | ⏸️ **MOVED TO V2 2026-09-07.** It is a **dripline** check and the dripline is Spring/Summer 2027 — *"flush every lateral before capping, then run 30 min and trowel three points per bed looking for wetted cones that have joined into a band."* Still the right V2 test; **not V1's.** ✅ Nothing was bought, so nothing is idle |
| **Walk both trench routes with a tape** *(new, 2026-09-06)* ⛔ | **Trench length — unmeasured, and the only figure anywhere (~33 m) is scaled off a drawing, not walked.** Sets the dig, the MDPE budget (~34 m of coil left after the rig — **marginal**) and whether a second coil must be ordered *before* the dig rather than mid-trench. ⚠️ **Same walk settles the 15 m field cable** against the SW-patio-corner → valve-box run, which has never been measured either. **Free. Not done.** |
| ~~Tap's double-check valve~~ | **CLOSED — non-issue.** DCVs mandatory on outside taps since the Water Supply (Water Fittings) Regulations 1999. Do not re-raise. |

## Purchase groups

### Placed
- **EGI144331** — 2026-08-25, **£218.96**, free shipping. Valves, bodies,
  nozzles, bushes, connectors, tees, elbows, MDPE, adjustment tool.

### All orders placed — reconciled from confirmation emails

| Order | Date | Vendor | Contents | Total |
|---|---|---|---|---|
| BOM as bought | 2026-08-10 | mixed (incl. Screwfix A27347852422) | pipe, splitter, first body + nozzle, brass bushes, Plasson set, gauge, PTFE | ~£163.00 |
| **EGI144055** | 2026-08-22 | Easy Garden Irrigation | 1st valve, 2 elbows | £44.12 |
| **EGI144331** | 2026-08-25 | Easy Garden Irrigation | 2 valves, 3 PRS40 bodies, 4 MP3500, 4 bushes, connectors, 2 tees, 3 elbows, 50 m MDPE, MP tool | £218.96 |
| **EGI144332** | 2026-08-25 | Easy Garden Irrigation | 4-way manifold, 3 caps, 1 bush | £43.27 |
| **EGI144337** | 2026-08-25 | Easy Garden Irrigation | 15 m 5-core control cable, 4 DBR/Y splices | £40.23 |
| **Wickes 702854640** | 2026-08-25 | Wickes (Click & Collect, Leeds Moor Allerton) | 3 × 20 mm washed gravel, 1 × weed membrane | £20.30 |
| **EGI144461** | 2026-08-27 | Easy Garden Irrigation | Irritec Jumbo 12" valve box `IG/POZ-JMBREC` ×1 | £42.75 |
| | | | **Subtotal — water side + groundwork** | **£572.63** |
| **Screwfix `A27859275166`** | 2026-09-06 | Screwfix (Click & Collect, **Horsforth**) | 10 m 3183P 1.5 mm² rubber flex, M20 gland 2-pack, 13 A fused plug *(first **electrical** line in this table)* | £23.03 |
| | | | **Total of the orders in THIS table** | **~£595.66** |

> ⛔ **RELABELLED 2026-09-06 — £572.63 is NOT the project total, and this file
> used to call it one.** It is the **water side and groundwork only** — the seven
> orders above it, and nothing else. It reconciles exactly:
>
> `163.00 + 44.12 + 218.96 + 43.27 + 40.23 + 20.30 + 42.75 = 572.63`
>
> **It excludes ~£272.69 of control-plane, electronics and tooling spend** made
> since July — the ESP32, relay, PSU, transformer, enclosure, meter, Wagos and so
> on, none of which appears in this table. Anyone reading £572.63 as *"what
> Petrichor has cost"* is reading it ~£273 light. The £23.03 Screwfix line is
> **electrical**, so **£595.66 is not a water-side figure either** — it is simply
> the sum of what this table happens to list.
>
> **Project-wide, as at 2026-09-06:**
>
> | | |
> |---|---|
> | Project-wide spend | **~£868.74** *(£845.71 before this order + £23.03)* |
> | Net of the outstanding **£33.48 Amazon refund** on the NPT valve | **~£835.26** |
>
> 📌 **Provenance: reconciled in the Obsidian vault**
> (`Projects/golden-shower/tasks/prototype-shopping-list.md`), **2026-09-06.**
> **Obsidian is the source of truth for spend; this repo is downstream.** The
> vault's order-by-order register is deliberately **not** duplicated here —
> go there for the breakdown, and do not maintain a second copy of it.
>
> ⚠️ **Known gap in the project-wide figure — it is light by an unknown amount.**
> The **ESP32 DIN rail mount (AliExpress, 2026-08-06)** and the generic DIN
> mounts have **no price recorded anywhere**, vault or repo. ⚠ **Unverified.**

**Spent on 2026-09-06: £23.03.**

**Spent on 2026-08-27: £42.75.**

### ✅ Ordered 2026-09-06 — the external mains lead (Screwfix `A27859275166`)

**Placed 11:18 GMT, 2026-09-06. Click & Collect, Horsforth — Unit 9 Lister Hill,
LS18 5AZ. Held 21 days. ⚠️ Await the SMS before travelling.**

| Code | Item | Qty | £ inc VAT |
|---|---|---|---|
| `68744` | Essentials 13 A Fused Heavy Duty Plug, black | 1 | £1.69 |
| `994JY` | Time **`3183P`** black 3-core **1.5 mm²** flexible cable, **10 m coil** | 1 | £19.99 |
| `651VT` | Vimark nylon male comp glands **20 mm (M20)** black, 2 pack | 1 | £1.35 |
| | | **Total** | **£23.03 inc / £19.19 ex VAT** |

*Evidence class: **Screwfix order confirmation email — verified**.*

**This clears three enclosure-side items in one £23 order** — the external mains
lead, the M20 gland and (a requirement the coil itself created) the plug. See the
`SOURCE` recount below.

> ⛔ **The cable is `3183P`, NOT H07RN-F — this repo said H07RN-F earlier today
> and was wrong.** Screwfix's own product description states the conductors are
> **"rated 300/500 V"**. That is the **H05RN-F voltage class**; the `07` in
> H07RN-F **means 450/750 V by definition**. A cable cannot be both.
> **The correct description everywhere is: "3183P rubber flex (PCP sheath),
> 300/500 V class."**
>
> ✅ **And it is the correct cable for this build.** The requirement was always
> **a rubber sheath instead of PVC** — the failure mode is UV chalking and frost
> embrittlement over seasons, not insulation breakdown. **On 230 V behind the
> 3 A fuse now fitted (2026-09-07, was 5 A), 450/750 V buys even less than it
> did.** What was bought is polychloroprene-sheathed,
> **−35 °C to +60 °C**, sold by Screwfix for *"pond pumps and other outdoor
> cabling applications"*, and described verbatim as: *"The durable rubber sheath
> resists weather, UV exposure and moisture degradation."* Full detail and the
> cable-code reference table: `wiring-and-cable-grades.md` →
> *3183P rubber flex*.

⚠️ **What this order did NOT settle — three of four still open, one now closed:**

| | |
|---|---|
| **⛔ The box entry must be drilled out, M16 → M20** | New physical work — see the section below. The M20 does not fit the existing hole |
| **⚠️ The M20's own clamping range is unverified** | `651VT`'s seal range is recorded nowhere in this repo. The M16 failed by being chosen on **thread size** without checking **seal range** — do not repeat it one size up. **Read the packet against the calipered cable** |
| **✅ Fuse — CLOSED 2026-09-07, 3 A fitted, not 5 A** | `68744` shipped with **13 A**; Dan has fitted a **3 A BS 1362 fuse**, tighter than the 5 A this row previously called for. HDR-15-5 typical AC input current is **0.25 A at 230 VAC** *(datasheet, verified)* — ample headroom over the actual load. ⚠️ **Only open risk: nuisance-blow on cold start** — datasheet inrush is 45 A cold-start, and the rig has bench-tested clean through a 5 A fuse before *(bench evidence, verified)*, which reduces but does not close the risk at 3 A. If it ever blows on power-up, step to **5 A — never back to the 13 A it shipped with**, now a spare |
| **⛔ Cable clips are still not bought and still misspecced** | Screwfix's suggested *Vimark Black Round Coaxial Clips 5–7 mm* are **too small** for a ~9.75 mm cable. **Needs 9–11 mm round clips.** Not priced, not ordered |

### ⛔ NEW WORK, 2026-09-06 — enlarge the enclosure entry M16 → M20

**This is load-bearing and it is not a purchase, it is a job.** The gland already
fitted to the enclosure is the **WEMNO M16, 3–8 mm range**. The lead bought is
**~9.75 mm** ⚠. That is **outside the range, so it will not seal** — the gland's
seal **never compresses on the sheath at all**. This is **not** a "tight fit"
that can be got away with.

Fitting the M20 therefore means **opening the cable entry from roughly
**16.5 mm** to roughly **20.5 mm**.

> ⚠️ **Those two hole figures are INFERRED from the metric gland thread
> designation — NOT from a datasheet.** M16/M20 are thread sizes, not hole sizes.
> ⛔ **Caliper the actual existing hole before drilling.**

- **Step drill / cone cutter**, not a twist bit — a twist bit snatches in thin
  ABS and triangulates the hole, and a triangulated hole does not seal.
- ⛔ **This is a drilling job on an already-built and wired enclosure. Swarf near
  electronics is the risk, not the hole.** **Remove or fully shroud the board and
  both PSUs first**, and **clear every chip before re-sealing.**
- Full procedure: `specs/build-guide.md` **Stage 6 step 3**. Tracked in
  `build-work-plan.md` **Phase E**.

> 📌 **Decision, 2026-09-06 — Dan chose this route knowingly.** Build guide 7A
> step 3 offers the alternative *"or sleeve in conduit"*, which requires **no
> drilling at all**. It was put to him and he took the cable-and-gland swap.
> **Recorded as a decision, not to be re-argued.**

**EGI144461 detail** — `IG/POZ-JMBREC` ×1 £45.99 − £9.19 (End of Season 20%) =
£36.80 subtotal · Standard UK 1–2 days £5.95 · **total £42.75** (Mastercard
••9915, VAT £7.12 included). Reconciled from the confirmation email 2026-08-27.
The 20% **did** stack on the listed price, which was already showing an 18% cut
from £55.99. Single line item, correct SKU, correct quantity — **no repeat of the
cart quantity bug.**

**Spent on 2026-08-25 alone: £322.76.**

**EGI144337 detail** — `RB/IRRICAB5-15M` ×1 £27.75 · `RB/DBRY.P2` ×2 £15.10 ·
gross £42.85 − £8.57 sale + £5.95 postage = **£40.23** (PayPal). Matched the
verified basket exactly.

**Wickes 702854640 detail** — `133795` Suburban Build 20 mm Gravel ×3 £12.30 ·
`346755` 50 gsm weed membrane ×1 £8.00 · Click & Collect **free** = **£20.30**.

### What the sale and sourcing decisions saved

| | |
|---|---|
| 20% End of Season across four EGI orders | £81.83 |
| Free shipping earned by clearing £200 on EGI144331 | £5.95 |
| Gravel + membrane from Wickes rather than Amazon | ~£14 |
| | **~£101.78** |

### Postage: £17.85 is the price of iterating, and it bought something

**£17.85 across EGI144332, EGI144337 and EGI144461** where a single order would
have been £5.95. Dan's framing, and it is the right one: *"the price of iterating
on the design, costly yes but minimised exposure."* Not waste — **£11.90 spent to
avoid committing to parts before the design was known.** Two different bets,
though, and they should not be conflated:

| Split | £ | What it bought |
|---|---|---|
| EGI144332 (25th) | £5.95 | **Stock risk.** The tees were down to the last 2. Same-day as EGI144337, so this £5.95 bought availability, not information. |
| EGI144337 (25th) | £5.95 | *(the same-day pair — one of these two is genuinely avoidable in hindsight)* |
| **EGI144461 (27th)** | **£5.95** | **Information, and it paid for itself.** On the 25th the design said the manifold spanned **480 mm** and the box had a **"500 × 365 mm aperture"**. Both were wrong. Buying the box that night meant buying against a calculation instead of a tape — and the box was out of stock anyway. |

**The exposure it minimised is real:** the whole box decision changed between the
25th and the 27th — span 480 → 500 mm, "aperture" revealed as a lid, depth
retracted as the binding constraint, and the vendor moved from Water Irrigation
to EGI. £5.95 to make that correction *before* the money, not after it.

### ⚠️ EGI's cart is unreliable — verify before every checkout

Quantity clicks repeatedly appeared not to register and then applied late. This
bit twice:

- **EGI144331 shipped `PL/14020C10` ×4** when it had been reduced to ×1 (£4.56 over).
- Before EGI144337, the basket was found showing **cable ×2 / connectors ×1**
  instead of ×1 / ×2 — caught only because the cart was re-read immediately
  before checkout.

**Always reload the cart page and re-read it immediately before paying.**

### ✅ Ordered 2026-08-27 — valve box (Easy Garden Irrigation)
✅ **ORDERED 2026-08-27 — EGI144461, £42.75.** **Irritec Jumbo 12"
`IG/POZ-JMBREC` from EGI** — same box class, £1.75 less, and EGI is the vendor with
four orders of history. (Superseded: HydroSure `32120014`, £47.74, Water
Irrigation — no prior history there.) ⛔ **Not** the Irritec *Standard* 12"
(£29.99): its ~468 mm internal at fitting height is shorter than the 470 mm bare
manifold. ✅ **Hold released
2026-08-27** — the manifold has been taped at **500 × 260 mm** (two valves, pipe
with every fitting attached, plus pipe allowance). It fits comfortably: ~612 mm
internal length at fitting height against 500 mm — **56 mm clear per end**. The trade-off is
that it will not lift out through the lid (~475 × 345 mm inferred clear opening);
servicing means lifting the box off. The only bigger UK option is a Rain Bird
VB-SPR Super Jumbo — £282–£322 and 381 mm deep, forcing a ~455 mm pit. **✅ CLEARED TO
ORDER — no outstanding measurements.** (An earlier revision asked for the Hansen
bush to be taped; that length was already inside Dan's 470 mm.) EGI's own KwikCut
cutters are **sold out**, so the pipe cutter stays a
separate Screwfix line as originally planned — no bundling gain from EGI.

### Not yet basketed — builders' merchant
- 2–3 × 20 kg **washed 20 mm shingle** (❌ not MOT Type 1 — it binds and holds water)
- **Geotextile membrane** (~£10) — without it soil blinds the gravel in a season
- **MDPE pipe cutter** (£10–15) — stays a Screwfix line. EGI's KwikCut cutters
  are sold out; Water Irrigation have the KwikCut MDPE/HDPE 25 mm at £13.99 if a
  Screwfix trip is unwelcome.

### Not yet basketed — Screwfix / CEF
The **four** remaining `SOURCE` electrical items above (was six; the field cable
and the gel splices arrived in EGI144337). Not priced. All enclosure-side —
**none blocks groundwork.**

**Added 2026-09-06 (morning) — two more enclosure-side items, both Phase E,
neither blocking. ✅ BOTH BOUGHT the same afternoon on `A27859275166`:**

| Item | Spec as written that morning | Outcome |
|---|---|---|
| ~~**External mains lead replacement**~~ | ~~**H07RN-F `3G1.0`**, ~2 m~~ | ✅ **BOUGHT — but as `3183P` 1.5 mm², 10 m coil (`994JY`).** ⛔ **Not H07RN-F.** 300/500 V PCP rubber. See the order section above |
| ~~**M20 cable gland**~~ | ~~for the above~~ | ✅ **BOUGHT — Vimark `651VT`, 2 pack.** The reasoning held: the bought cable is ~9.75 mm ⚠, still above the M16's 8 mm ceiling |

⚠️ **Still to buy at Screwfix / CEF:** the **four** remaining `SOURCE` items
(flex cores, ferrules, earth bond, breather plug) — **plus 9–11 mm round cable
clips**, which are *not* on the wiring BOM and are not bought. The 5–7 mm coaxial
clips Screwfix suggested alongside the cable are **too small** for a ~9.75 mm
lead.

> ⛔ **Preserved as history — the morning's H07RN-F reasoning.** It is *true about
> H07RN-F* and it is *not what was bought*, so it is kept and demoted rather than
> deleted:
>
> *"Do not order H07RN-F 0.75 mm² — it does not exist. The smallest 3-core
> H07RN-F made is 1.0 mm² (`3G1.0`); 0.75 mm² rubber flex is H05RN-F (300/500 V),
> a lighter cable a voltage class down. **Evidence class: manufacturer catalogue
> (Lapp), verified** — corroborated by Eland Cables and FS Cables. Not a seller
> listing."*
>
> ✅ **That statement still stands** — Lapp's catalogue is unaffected by what Dan
> bought. ⚠️ **But it turned out to be moot as a buying rule:** **Screwfix's own
> 3183P range starts at 1.5 mm²** — a 0.75 mm² filter returns **zero products**.
> **There was no thin rubber option to get wrong in the first place.**

> ⚠️ **TRAP worth carrying forward — retailer listings on 3183P contradict
> themselves.** MP Moran's 3183P listing claims **"H07RN-F"** *and*
> **"300V/500V"** in the same description. **Both cannot be true.** On a 3183P
> listing, the **sheath material is the reliable part; the harmonised designation
> is not.** The clean discriminator is the **BS EN number**: **`-2-11` = PVC
> (`3183Y` / H05VV-F), `-2-21` = rubber (`3183P`)**. Full reference table in
> `wiring-and-cable-grades.md`. *(Evidence: Farnell datasheet* **"3183Y (Har.
> code HO5VV-F3) Three-Core Round 300/500 V"** *— manufacturer datasheet — plus
> 3183P products consistently citing BS EN 50525-2-21.)*

✅ **The "buy the cable and the M20 gland together" rule was followed** — they
were on the same order, which is why the lead can actually be terminated.

### ⚠️ The plug enclosure is IP54, not IP66 — found 2026-09-06

The **RESTMO weatherproof box** that houses the plug and socket is **IP54
(splashing water only)**, not the **IP66** that `specs/build-guide.md` Stage 7A
assumed. ⚠️ **Evidence class: vendor title on Amazon order 206-6337738-2459509 —
not a datasheet, not a moulding.** It is the weaker of the two claims in this
build and has not been checked against a second source.

**No parts consequence — it is a mounting constraint, and it is free to satisfy:**

- **Wall-mount it vertically. ⛔ Never ground-sited** — that is exactly where IP54
  runs out (bouncing rain, puddles, leaf litter).
- **Cable entries pointing down**, with a **drip loop** before each entry.
- **Out of direct run-off** — not under a gutter join or a dripping sill.

The CE-TEK GR17016 that holds the electronics remains **IP65** and is unaffected.

## Backlog — deliberately deferred

> ⚠️ **Two of the four rows below were overturned by the 2026-08-31 re-scope.**
> Both are annotated in place. The original reasoning is left standing because it
> is *correct for the design it was written against* — it just isn't this design.

| Item | Why deferred |
|---|---|
| ~~**Basket / drip watering**~~ | ✅ **RE-MERGED 2026-09-07 — both halves are now V2 (Spring/Summer 2027), on the third valve.** The 2026-08-31 split below is spent: bed drip stopped being the MVP, so the two halves are once again the same wave of work and should share one filter and one reducer, specified once. → vault ticket `plan-v2-bed-drip-zone`. ⏸️ *Superseded, kept as history:* ⛔ **SPLIT 2026-08-31 — this row conflated two different things.** *Basket* drip is still deferred (Stage 9, zone 2). ***Bed* drip is now the entire MVP** and is not deferred at all — see the restatement at the top of this file. The original entry read: *"Dan putting the brakes on until next year. ⚠️ Open question: does it belong in this valve box at all? Drip is a different regime — a few L/min, emitters clogging below ~120 micron, lower pressure. Sharing the manifold makes the filter mandatory system-wide. A separate box near the baskets is often the better build. Decide before sizing the box for four."* ✅ **That last sentence is now moot** — the box is bought and the pit is dug. ⚠️ **The separate-box question survives for the *baskets* only** and is a Stage 9 decision. |
| **Inline filter** | ✅ **DEFERRED AGAIN 2026-09-07 — back where it started, and now with evidence.** *(Superseded 2026-08-31: "NO LONGER DEFERRED — MANDATORY… the MVP is now drip, and emitter clogging is the primary failure mode of every drip system." **Correct about drip — and drip is now V2.**)* The original entry read *"Overkill for v1"* (Dan, 2026-08-25) and **v1 is rotaries again.** ✅ **Manufacturer-backed this time, not just a judgement:** Hunter condition primary filtration on **dirty water**; every MP Rotator has a **removable inlet filter screen**; the `100-DV` carries a built-in **90-mesh (200 micron)** element. ⚠️ **"Not established as required" is not the same as "proven unnecessary"** — it is a manufacturer-backed inference, and if the supply is ever suspect it becomes a live question again. ⚠️ The 1"-male-port trap in `plumbing-rebuild.md` still applies to any mainline 1" filter. **It moves to the V2 drip BOM.** |
| ⚠️ **Swing joints** | ⛔ **UN-DEFERRED 2026-09-07 — V1, and NOT BOUGHT.** *(Superseded 2026-09-06: "deferred with the lawn to Stage 9… they are rotary-head kit, so they follow the heads out of the MVP", and `build-work-plan.md` Phase C's ***"Do not buy them for the MVP."***)* **V1 puts four pop-up bodies in the ground, so they are back in scope** — backed by Hunter's own CAD details (*"with Hunter Swing Joint"*, *"with Flex Swing Arm"*). ⛔ **Not bought, not priced, not sourced.** Only lead: EGI's *Rain Bird Swing Pipe, 1 m*, **unpriced**. ⏳ **Size once the head positions are pegged out.** **This is the single outstanding V1 water-side purchase.** |
| **3rd valve for low pressure** | **Arithmetic says not needed.** Zones run one at a time, so only 2 heads are ever live: 2 × MP3500 @ 90° = 9.7 L/min against 19 L/min — 51%, roughly 2× headroom. A 3rd valve is for a genuinely new zone, not for splitting these two. ✅ **Reinforced by the re-scope, from the other direction:** the MVP needs **one** valve and it is already owned. Three valves are in hand against three eventual zones, so **no valve purchase is outstanding at any stage.** |

## ⚠️ Unresolved — needs Dan

**Restated 2026-09-07: only ONE row here is still open — row 6, the trench
length, and it is a measurement rather than a ruling.** Rows 1–5 are all closed;
they are struck through in place rather than deleted, because what closed each one
is part of the record. **Nothing here is guessed at.**

⚠️ **What the V1 re-scope opened in their place is listed at the top of this file,
not here, because none of it needs Dan:** the **swing-joint purchase gap**, and
the **nozzle / arc choice**, which is a **throw test**, not a decision.

| # | The contradiction | Why it can't be settled here |
|---|---|---|
| ~~1~~ | ~~**`build-work-plan.md` is still a lawn-sprinkler plan.**~~ ✅ **RESTATED 2026-09-06** against Dan's ruling below. Phase B's route-marking is kept and promoted; its head-pegging is struck and deferred to Stage 9. Phase C carries the ruling as a header table, the four-head laterals are struck, the swing-joint gate is moved to Stage 9. ⚠️ **One piece stayed open and was NOT guessed at — trench depth.** See row 5 | — |
| ~~2~~ | ~~**Does the MVP still need the full trench at all?**~~ ⛔ **RULED BY DAN, 2026-09-06 — YES.** The suggestion that the buried run shrank to *box → bed edge* was **wrong**, and he corrected it against the pipe map, in his words: **"we're going into the garden so to spray the borders, thus the trench."** ✅ **The two trench ROUTES survive unchanged** — Line 1 = box → S11 → bottom edge → S12; Line 2 = box → left edge → S21 → top edge → S22. The mainline still has to travel out along the borders to reach the beds. ⚠️ **What changed is the terminations** — a dripline feed onto a bed, not a pop-up rotary body. **Phase C is still a real dig; the MVP is not trench-free.** → row 6 for the length | — |
| ~~3~~ | ~~**Basket count: README *Must Haves* says 4, build guide 8B said 5.**~~ ✅ **RESOLVED 2026-09-06 — it is FIVE, and it was never actually open.** The vault settled it on **2026-07-20** with positions and an explicit note that it was *"corrected up from earlier count"*: **HB1–3 on the top border (FB2), HB4–5 on the right border (FB3)** — `Projects/golden-shower/tasks/decide-zone-valve-count.md`. The repo README's *"4 hanging baskets"* predates that and is the stale side. **Obsidian is the source of truth for decisions; the repo README has been corrected to match.** Hydraulically it changes nothing — 5 baskets ≈ 0.17–0.33 L/min, under 2% of the tap | — |
| ~~**5**~~ | ~~⛔ **what depth does the mainline trench go to?** The 200 mm is derived entirely from the `PROS-04-PRS40`'s 155 mm retracted height — a pop-up now deferred.~~ ✅ **DISSOLVED 2026-09-07 by the V1 re-scope.** The pop-up is **V1 hardware again**, so the derivation is live: **155 mm retracted → inlet at 155 mm → lateral centreline ~200 mm → dig 250 mm.** ✅ **The 155 mm is now CONFIRMED from the Hunter datasheet** (`PROS-04-PRS40-CV_Hunter_spray-body-metric.pdf` — *"Retracted height: 15.5 cm"*); this repo had only ever asserted it. ✅ **The "should the lawn laterals share this trench" sub-question dissolves too** — those laterals *are* V1 and go in on this dig. | ⚠️ **Restored BY CONSEQUENCE, awaiting Dan's confirmation.** He ruled on scope, not on depth. **Not presented as a fresh ruling from him.** |
| **6** | ⚠️ **NEW — trench length is not recorded anywhere, and the one figure that exists is not a measurement.** `plumbing-rebuild.md` gives **~33 m** for Line 1 + Line 2 and says so itself: *"Scaling the diagram against a ~12.6 m plot (inferred…) — rough… Walk it with a tape."* **Treat ~33 m as ⚠ unverified.** It matters because ~34 m of the 50 m MDPE coil is left after the 8C rig takes ~16 m — **marginal**, and running out mid-trench costs £74.95 plus a delivery and a stalled week. ⚠️ The **15 m field cable** `RB/IRRICAB5-15M` has *also* never been walked against the SW-patio-corner → valve-box run. | **Not a ruling — a measurement.** ⏳ **Walk both routes with a tape**, once, with the cable question in mind at the same time. Added to Phase B and to the physical-checks table. Free, and it gates the dig. |
| ~~4~~ | ~~**The `-CV` spray bodies were bought for a zone that is now deferred… the 30-day return window on EGI144331 runs to roughly 2026-09-24/25… it expires in about a fortnight.**~~ ✅ **CLOSED 2026-09-07 — THE DECISION IS KEEP.** The 3 × PRS40 `-CV` bodies and 4 × MP3500 nozzles are **retained, and they are V1 hardware, not Stage 9 stock**. ⛔ **The return-window countdown is retired: it is not a live clock and not an open item. Do not re-raise it.** | ✅ **Doubly settled** — Dan ruled *keep*, and the V1 re-scope means the hardware is needed **this year**, not in a year. Nothing sits in stock. |
