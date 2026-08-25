# Outstanding to complete the build

> **Consolidated register as of 2026-08-25.** Everything still needed to get
> Petrichor from "proven on the bench" to "installed and running". Compiled from
> a completeness sweep of the repo plus tonight's sourcing work.
>
> Water-side reasoning and part evidence lives in
> [`plumbing-rebuild.md`](plumbing-rebuild.md). This file is the *what's left*
> list, not the *why*.

## Plan — settled 2026-08-25

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

## Field cable — deferred, but the DUCT is not

**Field cable to the manifold has never been bought.** It blocks *automation*,
not this year's goal — see the plan above. The **duct must still go in during the
groundwork**, and spare 20 mm MDPE serves.

`docs/wiring-and-cable-grades.md:353` —
> Field cable to manifold | outdoor/UV-rated multicore, 0.5–0.75 mm², **zones + 1**
> cores (<10 m; direct-burial or duct if buried) | `SOURCE`

2 zones → **3 cores**. Not owned.

⚠️ **"Electrical: built and proven" means the bench.** Six line items in the
wiring BOM are still marked `SOURCE`. Do not read "electrical: done" as
"electrical: installable" — but note this is a **known, accepted deferral**, not
an oversight. Dan: *"Im aware of the spicy side."*

## Marked `SOURCE` in the wiring BOM — never purchased

| Line | Item | Qty |
|---|---|---|
| 353 | **Field cable to manifold** — outdoor/UV multicore, 0.5–0.75 mm² | 3 core |
| 356 | **Gel-filled / IP68 valve-box connectors** — one per solenoid joint | 3 (5 at four valves) |
| 345 | 230 V mains — 0.75 mm² flex cores, tri-rated outdoors | 5 |
| 351 | Ferrules — 0.75 mm² · 6 mm bootlace | 6 |
| 352 | Earth bond — DIN earth block, or M4 + ring crimp | 1 |
| 355 | Vented drain / breather — IP-rated M12–M16 breather plug | 1 |

On the gel connectors, the build guide is blunter than about anything else in it:
*"Never a dry Wago in the ground. This is the single most failure-prone spot in
the whole build."* The Wago 221s on hand are **enclosure** parts, not chamber
parts.

**Sourcing:** this is a Screwfix / CEF order, not an irrigation vendor. Not yet
priced.

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
| **Throw test** — MP3500 off the splitter vs 8.9 m | Confirms the nozzle choice before trenching |
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
| | | | **PROJECT TOTAL** | **~£529.88** |

**Spent on 2026-08-25 alone: £322.76.**

**EGI144337 detail** — `RB/IRRICAB5-15M` ×1 £27.75 · `RB/DBRY.P2` ×2 £15.10 ·
gross £42.85 − £8.57 sale + £5.95 postage = **£40.23** (PayPal). Matched the
verified basket exactly.

**Wickes 702854640 detail** — `133795` Suburban Build 20 mm Gravel ×3 £12.30 ·
`346755` 50 gsm weed membrane ×1 £8.00 · Click & Collect **free** = **£20.30**.

### What the sale and sourcing decisions saved

| | |
|---|---|
| 20% End of Season across three EGI orders | £72.64 |
| Free shipping earned by clearing £200 on EGI144331 | £5.95 |
| Gravel + membrane from Wickes rather than Amazon | ~£14 |
| | **~£92.59** |

Cost of the split-order approach: **£11.90 postage** across EGI144332 and
EGI144337 where one order would have been £5.95. Deliberate, on stock risk —
justified given the tees were down to the last 2 and every rectangular valve box
at EGI had already sold out.

### ⚠️ EGI's cart is unreliable — verify before every checkout

Quantity clicks repeatedly appeared not to register and then applied late. This
bit twice:

- **EGI144331 shipped `PL/14020C10` ×4** when it had been reduced to ×1 (£4.56 over).
- Before EGI144337, the basket was found showing **cable ×2 / connectors ×1**
  instead of ×1 / ×2 — caught only because the cart was re-read immediately
  before checkout.

**Always reload the cart page and re-read it immediately before paying.**

### Not yet basketed — valve box (Water Irrigation)
`32120014` HydroSure Jumbo Rectangular, **£47.74**, 17 in stock. Hold until the
manifold's real pitch and height are known — **depth is the binding dimension**
and the box cannot be upsized without re-excavating.

### Not yet basketed — builders' merchant
- 2–3 × 20 kg **washed 20 mm shingle** (❌ not MOT Type 1 — it binds and holds water)
- **Geotextile membrane** (~£10) — without it soil blinds the gravel in a season
- **MDPE pipe cutter** (£10–15)

### Not yet basketed — Screwfix / CEF
The six `SOURCE` electrical items above. Not priced.

## Backlog — deliberately deferred

| Item | Why deferred |
|---|---|
| **Basket / drip watering** | Dan putting the brakes on until next year. ⚠️ **Open question: does it belong in this valve box at all?** Drip is a different regime — a few L/min, emitters clogging below ~120 micron, lower pressure. Sharing the manifold makes the filter mandatory system-wide. A separate box near the baskets is often the better build. **Decide before sizing the box for four.** |
| **Inline filter** | Overkill for v1. The 1"-male-port trap is recorded in `plumbing-rebuild.md` — it needs two extra fittings the Hansen bushes cannot provide. |
| **Swing joints** | Stage 8D. Backed by Hunter's own CAD details (*"with Hunter Swing Joint"*, *"with Flex Swing Arm"*). Size once head positions are pegged out. |
| **3rd valve for low pressure** | **Arithmetic says not needed.** Zones run one at a time, so only 2 heads are ever live: 2 × MP3500 @ 90° = 9.7 L/min against 19 L/min — 51%, roughly 2× headroom. A 3rd valve is for a genuinely new zone, not for splitting these two. |
