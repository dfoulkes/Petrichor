# Outstanding to complete the build

> **Consolidated register as of 2026-08-25.** Everything still needed to get
> Petrichor from "proven on the bench" to "installed and running". Compiled from
> a completeness sweep of the repo plus tonight's sourcing work.
>
> Water-side reasoning and part evidence lives in
> [`plumbing-rebuild.md`](plumbing-rebuild.md). This file is the *what's left*
> list, not the *why*.

## ⛔ The one that actually blocks installation

**Field cable to the manifold has never been bought.** Without it the controller
cannot physically reach the valves.

`docs/wiring-and-cable-grades.md:353` —
> Field cable to manifold | outdoor/UV-rated multicore, 0.5–0.75 mm², **zones + 1**
> cores (<10 m; direct-burial or duct if buried) | `SOURCE`

2 zones → **3 cores**. Not owned.

⚠️ **`CLAUDE.md` states the electrical side is "built and proven".** That is true
of the **bench**. It is **not** true of an installation — six line items in the
wiring BOM are still marked `SOURCE`. Do not read "electrical: done" as
"electrical: installable".

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
| **Tap's double-check valve** | Never verified in either direction. Water-regs requirement; may be inline behind the wall |

## Purchase groups

### Placed
- **EGI144331** — 2026-08-25, **£218.96**, free shipping. Valves, bodies,
  nozzles, bushes, connectors, tees, elbows, MDPE, adjustment tool.

### Placed — EGI144332, 2026-08-25 20:35, **£43.27**

| Part | SKU | Qty | Line |
|---|---|---|---|
| Rain Bird 4 Way Manifold | `RB/1301-410` | 1 | £39.95 |
| Threaded Cap 1" BSP | `A44515` | 3 | £4.35 |
| Hansen nylon reducing bush 1" M × 3/4" F | `HANSEN/RB2520` | 1 | £2.35 |
| | | Gross | £46.65 |
| | | 20% sale | −£9.33 |
| | | Postage | £5.95 |
| | | **Paid** | **£43.27** |

Matched the verified basket exactly — no variance. Postage accepted deliberately
rather than phoning to amend EGI144331 — Dan: *"For the sake of few pounds vs
having to call and risk out of stock (considering it's end of season). I don't
like to procrastinate."* Sound: every rectangular valve box at EGI was already
gone, the tees down to the last 2, the PRS40s to 5.

Cap count reasoning: 2 unused valve outlets + 1 unused manifold end. The manifold
has connections at **both** ends (*"1 × 1" male thread and 1 × 1" swivel nut with
female thread"*) — the feed lands on the swivel-female end via the Hansen bush,
leaving the male end to blank. *Inferred from the product description, not the
datasheet; confirm on arrival.*

### Running spend

| Order | Date | Total |
|---|---|---|
| BOM as bought | 2026-08-10 | ~£163.00 |
| EGI144055 | 2026-08-22 | £44.12 |
| EGI144331 | 2026-08-25 | £218.96 |
| EGI144332 | 2026-08-25 | £43.27 |
| | **Total** | **~£469.35** |

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
