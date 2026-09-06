# Outstanding to complete the build

> **Consolidated register as of 2026-09-06.** Everything still needed to get
> Petrichor from "proven on the bench" to "installed and running". Compiled from
> a completeness sweep of the repo plus the 2026-08-25 sourcing work, and
> **restated 2026-09-06** after the Stage 8 re-scope moved the MVP from the lawn
> to the flower beds.
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

## ⛔ RESTATED 2026-09-06 — the MVP is the beds, on drip

**Read this before anything below it.** Until 2026-08-31 this register framed the
outstanding work around **MP3500 rotaries watering the lawn**. That target was
wrong. The **three flower beds — north, east and west — are the priority and
always were**; as designed they had **no zone at all** and appeared only as the
place the sprinklers were mounted. Recorded as a dated decision in the README
(*revised 2026-08-31*) and rebuilt in `specs/build-guide.md` Stages 8A–8E and 9.

⚠️ **The lawn cannot be watered as a byproduct of the beds — drip has no throw.**
It is its own zone or it is nothing. That is *why* it is deferred rather than
folded in. Do not re-raise it as a saving.

### What the MVP now is

| | |
|---|---|
| **Zone 1 — the entire MVP** | The three beds on **16 mm pressure-compensating inline dripline**. ~**36–39 m** of bed, ~**80 m** of dripline at two laterals per bed, ~**9 L/min** ⚠ against the ~15 L/min working budget |
| **Valves needed for MVP** | **One — already owned.** Zone 1 runs on the valve in hand. Valves 2 and 3 belong to the deferred zones |
| **Zone 2 — baskets** | Deferred to Stage 9 |
| **Zone 3 — the lawn ring** | Deferred to Stage 9 |

### ⛔ Still to buy — the drip parts. This is the new critical path.

**None of this is ordered.** It is the only group standing between the beds and a
working zone 1, and it is *not* in any of the purchase groups below.

| Part | Spec | Why | Sourced? |
|---|---|---|---|
| **16 mm PC inline dripline** | ~**80 m**, pressure-compensating, ~2.3 L/hr emitters @ ~30–33 cm ⚠ | Two laterals per bed. **PC specifically** — it holds output constant across the run *and* absorbs the garden's ~0.1 bar/m decline | ❌ not priced, no vendor |
| **Pressure reducer** | ~**1.5 bar**, **3/4" BSP** | Supply is **3.8 bar static**. Unreduced it blows emitters off the line | ❌ not priced |
| **Filter** | ~**120 mesh / 130 micron**, **3/4" BSP** | ⛔ **MANDATORY, not optional** — see the backlog correction below. Emitter clogging is the primary failure mode of every drip system | ❌ not priced |
| **16 mm fittings** | start connector (3/4" BSP × 16 mm), tees, elbows, end caps or flush valves | Joins laterals to the 20 mm MDPE mainline | ❌ not priced |
| **Dripline pegs** | ~1 per 1–1.5 m | Stops the line lifting and wandering as it warms | ❌ not priced |

⚠️ **Evidence class: repo-internal only.** Every figure in that table is carried
from `specs/build-guide.md` 8D and is marked ⚠ *there* as well. **There is no
dripline datasheet in `datasheets/`** — unlike the electrical side, the drip
figures have no manufacturer provenance in this repo. **Confirm emitter flow,
emitter spacing and the PC pressure range against the product actually ordered
before the shopping basket is checked out**, and do not treat the ~9 L/min zone figure as
verified until then.

⚠️ **Vendor not chosen.** EGI has **seven** orders of history (EGI143157,
EGI143158, EGI144055, EGI144331, EGI144332, EGI144337, EGI144461) and is the
obvious first look, but nothing here has been priced anywhere. **Assume a further delivery
charge** — that is information, not a reason to hold.

### What moved OUT of "outstanding" and into DEFERRED

Nothing bought is wasted; the rotary hardware carries forward.

| Item | Was | Now |
|---|---|---|
| **MP3500 nozzles ×4, PRS40 bodies ×3** | the heart of the MVP | ✅ **Deferred to Stage 9** (lawn ring). Not wasted — the beds shrink the lawn to ~**8 × 12.5 m**, so corner-to-centre falls **8.9 m → ~7.4 m**, mid-range for an MP3000 instead of at its 9.0 m ceiling |
| **Throw test vs 8.9 m** | a *free physical check before burying anything* | ✅ **Off the MVP critical path.** It only ever tested lawn coverage. It still gates Stage 9 — **not deleted, re-filed.** See the physical-checks table |
| **Sag-under-flow / dynamic-pressure gate** | blocked the zone design | ✅ **Obsolete for the MVP** — zone 1 runs ~9 L/min behind a ~1.5 bar reducer on flat PC emitters. **Still gates Stage 9.** Worth taking during the 8C rig anyway, while it is on the surface |
| **Circular self-back-feeding loop** | a design constraint | ✅ **Obsolete for the MVP** — PC dripline equalises itself. Still applies if the lawn ring is built |
| **Head positions / four-corners-inward spacing** | an open design question | ✅ **Deferred with the lawn.** Gates nothing in the MVP |

⚠️ **The one thing the re-scope did *not* settle:** the **swing joints** backlog
and the pegged head positions are both rotary-only, so they follow the lawn into
Stage 9 — but `build-work-plan.md` **Phase B still asks you to peg out four head
positions and Phase C still trenches laterals to four heads**. That plan has not
been restated against the drip MVP. See *Unresolved* at the foot.

## Plan — settled 2026-08-25

> ⚠️ **Restated 2026-09-06.** The target below reads *"sprinklers in"* because it
> was written against the lawn-first design. **The 2026 acceptance target is now
> the bed drip zone**, on the valve already owned. The *sequencing* logic — a
> hand-operable water system this year, electrics deferred to winter — is
> untouched and still governs; only the thing being watered changed.

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

### ❄️ Winterisation is now part of THIS year's job

Previously filed as "document before October". The deferred-electrical plan
promotes it: if groundwork finishes in November and nothing is energised until
spring, **the system sits full of water, unpowered, all winter** — and the spray
bodies bought are the `-CV` variant that deliberately holds water in the head.

**Drain-down is the final step of the 2026 groundwork**, not a spring problem:
isolate at the tap, open every valve bleed lever, drain the low points, leave it
empty. No procedure for this exists in the repo yet.

> ⚠️ **Restated 2026-09-06 — the re-scope does not let this off.** The `-CV`
> argument above is about spray bodies, which are now **deferred to Stage 9**. It
> does **not** follow that winterisation relaxes: the MVP is **surface-laid
> dripline**, which is the *shallowest* thing in the build, plus a **filter and a
> pressure reducer** — small-bore devices that hold water and are the classic
> first casualties of a frost. **Drain-down still ends the 2026 groundwork, and
> the procedure still does not exist.** ⚠️ Whether the dripline itself should be
> drained, blown or simply left to the emitters is **unverified** — no dripline
> datasheet in the repo (see the drip parts table).

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

> ⚠️ **Amended 2026-09-06 — it is six enclosure-side items now, not four.** The
> external-lead work added **H07RN-F `3G1.0`** and an **M20 gland** to the
> `SOURCE` list (see *Not yet basketed — Screwfix / CEF*). The **"four" heading
> above is kept because it is the count against the original wiring BOM lines**;
> the two new ones are additions to that BOM, not items it ever listed.
> **The conclusion is unchanged: all six are enclosure-side and none blocks
> groundwork.**

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
| ~~**Throw test** — MP3500 off the splitter vs 8.9 m~~ | ✅ **NO LONGER ON THE MVP CRITICAL PATH — re-filed 2026-09-06, not deleted.** It tested *lawn* coverage, and the lawn is deferred to Stage 9. It still gates Stage 9, and the 8.9 m figure it was fighting is itself superseded (~7.4 m on the shrunken lawn). **Do it opportunistically while the 8C rig is on the surface — never as a blocker on the beds.** |
| **Dripline dry-run** *(new, 2026-09-06)* ⚠ | The MVP's equivalent free check, and it **cannot be done yet — nothing is bought.** Once the dripline arrives: flush every lateral before capping, then run 30 min and trowel three points per bed looking for wetted cones that have **joined into a band**. Build guide 8D steps 11–12 |
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
| | | | **PROJECT TOTAL** | **~£572.63** |

**Spent on 2026-08-27: £42.75.**

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

**Added 2026-09-06 — two more enclosure-side items, both Phase E, neither
blocking:**

| Item | Spec | Status |
|---|---|---|
| **External mains lead replacement** | **H07RN-F `3G1.0`**, ~2 m | `SOURCE` — the supplied lead is indoor-grade **H05VV-F**. Interim, works, degrades over seasons |
| **M20 cable gland** | for the above | `SOURCE` — ⛔ **the owned WEMNO M16 (3–8 mm) cannot be used.** `3G1.0` is **8.3–10.7 mm** OD, so the whole range is above the M16 ceiling |

⛔ **Do not order "H07RN-F 0.75 mm²" — it does not exist.** The smallest 3-core
H07RN-F made is **1.0 mm² (`3G1.0`)**; 0.75 mm² rubber flex is **H05RN-F**
(300/500 V), a lighter cable a voltage class down. Earlier revisions of
`wiring-and-cable-grades.md` and `specs/build-guide.md` 7A specified the
non-existent size; both are corrected as of 2026-09-06.
**Evidence class: manufacturer catalogue (Lapp), verified** — CSA availability
and the OD range both from Lapp's own catalogue, corroborated by Eland Cables and
FS Cables. **Not a seller listing.**

⚠️ **Buy the cable and the M20 gland together.** They are one job; a lead with no
gland that fits cannot be terminated.

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
| ~~**Basket / drip watering**~~ | ⛔ **SPLIT 2026-08-31 — this row conflated two different things.** *Basket* drip is still deferred (Stage 9, zone 2). ***Bed* drip is now the entire MVP** and is not deferred at all — see the restatement at the top of this file. The original entry read: *"Dan putting the brakes on until next year. ⚠️ Open question: does it belong in this valve box at all? Drip is a different regime — a few L/min, emitters clogging below ~120 micron, lower pressure. Sharing the manifold makes the filter mandatory system-wide. A separate box near the baskets is often the better build. Decide before sizing the box for four."* ✅ **That last sentence is now moot** — the box is bought and the pit is dug. ⚠️ **The separate-box question survives for the *baskets* only** and is a Stage 9 decision. |
| ~~**Inline filter**~~ | ⛔ **NO LONGER DEFERRED — MANDATORY, 2026-08-31.** The original entry read *"Overkill for v1"*. That was true when v1 was rotaries; **the MVP is now drip, and emitter clogging is the primary failure mode of every drip system.** The build guide upgraded 7D's filter note from *"cheap insurance"* to mandatory for the same reason. **It moves to the drip parts table at the top of this file as a buy-now item.** ⚠️ The 1"-male-port trap recorded in `plumbing-rebuild.md` still applies to a **mainline** 1" filter — but the MVP filter is specified **3/4" BSP on the zone leg after the splitter**, which is a different position and may sidestep it. **Unverified — settle the port geometry against the actual filter before ordering.** |
| **Swing joints** | ✅ **Deferred *with the lawn* to Stage 9, 2026-09-06.** Backed by Hunter's own CAD details (*"with Hunter Swing Joint"*, *"with Flex Swing Arm"*). They are rotary-head kit, so they follow the heads out of the MVP. **Note:** `build-work-plan.md` Phase C still carries a *"decide before this phase — swing joints"* gate; that gate is now a Stage 9 gate. Size once head positions are pegged out. |
| **3rd valve for low pressure** | **Arithmetic says not needed.** Zones run one at a time, so only 2 heads are ever live: 2 × MP3500 @ 90° = 9.7 L/min against 19 L/min — 51%, roughly 2× headroom. A 3rd valve is for a genuinely new zone, not for splitting these two. ✅ **Reinforced by the re-scope, from the other direction:** the MVP needs **one** valve and it is already owned. Three valves are in hand against three eventual zones, so **no valve purchase is outstanding at any stage.** |

## ⚠️ Unresolved by the re-scope — needs Dan

These are contradictions the Stage 8 re-scope opened and did not close. **They are
listed, not guessed at.**

| # | The contradiction | Why it can't be settled here |
|---|---|---|
| 1 | **`build-work-plan.md` is still a lawn-sprinkler plan.** Phase B pegs out *"the four head positions — S11, S12, S21, S22"*; Phase C trenches *"laterals to all four heads"* with tees and elbows, and sets trench depth from the **PROS-04-PRS40's 155 mm retracted height**. **None of that describes a bed drip zone**, whose laterals are surface-laid on the beds and pegged, not buried to 200 mm. | The plan hasn't been restated, and how much of the trenching the MVP still needs is a **design call**, not a documentation one. The **valve-box pit and the mainline trench are still needed either way** — only the four head runs are in question. |
| 2 | **Does the MVP still need the full trench at all?** If zone 1 is dripline on the beds, the buried run is box → bed edge, not box → four corners. **That could shrink Phase C substantially** — or not, if the lawn ring is wanted next year and the ducting should go in now while the ground is open (the register's own ⛔ *"anything going under ground must go in during the groundwork"* rule argues it should). | A genuine trade-off between scope and re-digging. Dan's call. |
| 3 | **Basket count: README *Must Haves* says 4, build guide 8B said 5.** Carried over unresolved from the re-scope; 8B now says only *"hanging baskets"*. | Zone 2 is deferred, so it blocks nothing — but it should be pinned before zone 2 is sized. |
| 4 | **The `-CV` spray bodies were bought for a zone that is now deferred.** Three PRS40 `-CV` bodies and four MP3500 nozzles sit in stock for a year. ⚠️ **The 30-day return window on EGI144331 has NOT yet closed** — ordered 2026-08-25, delivered 2026-08-26, so it runs to roughly **2026-09-24/25** ⚠ *(inferred from a 30-day window; EGI's actual returns terms are not recorded in this repo)*. **So this IS still an open decision, and it expires in about a fortnight.** | Keep-or-return is Dan's call and it is **time-boxed**. The repo's own position is *keep* — the hardware carries forward to Stage 9 and the throw maths got *better*, not worse. But it should be a decision, not a lapse. |
