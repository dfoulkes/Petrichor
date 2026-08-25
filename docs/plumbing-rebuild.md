# Plumbing rebuild — valve manifold (open task)

> **Status as of 2026-08-25 (evening):** parts selected and basket built at Easy
> Garden Irrigation; **not ordered** — one item blocks checkout (see below).
> Electrical/firmware side is **done and proven** — this is water-side only.

## ⛔ Blocks the EGI order — 1 item

**Check the splitter-side Plasson `20 mm × 3/4" BSPF` connector for wear.**
The valve-side `BSPM` one was destroyed by repeated assembly into brass; the
splitter-side one is the same plastic-on-brass pairing and has been cycled too.
If it is worn it must go in the *same* EGI order — postage is not free under
£200. Nothing else gates checkout.

## Open, but does NOT gate the order

**Pipe liners — unresolved, pending a physical check.** Plasson's own component
list for this range includes a Liner, so they may already be in the fittings.
See "The liner question" below. EGI is out of stock on 20 mm regardless, so this
can never gate an EGI order — but it *does* gate assembly.

## The basket (EGI, built 2026-08-25, NOT ordered)

20% off "End of Season Sale" applies, **ends 31 August 2026**.

| Part | SKU | Qty | Line |
|---|---|---|---|
| Rain Bird 1" DV solenoid valve, 24 V | `RB/100-DV` | 2 | £65.90 |
| Hansen nylon reducing bush 1" BSPM × 3/4" BSPF | `HANSEN/RB2520` | 4 | £9.40 |
| Plasson MDPE male thread connector 20 mm × 3/4" BSPM | `PL/14020C20` | 5 | £9.50 |

Gross £84.80 → **£67.84** after 20%. Shipping extra (free only over £200).

Second valve is bought now for the sale price and to satisfy the build guide's
"same model and thread standard, bushed identically" rule for a uniform
manifold — **not** because the zone-count gate has been passed. That gate is
still open (see "The 1.5 bar reading" below).

## The liner question (raised 2026-08-25 — NOT yet settled)

**Compression fittings on MDPE need a liner/insert in each pipe end.** The
insert stiffens the bore so the compression olive has something rigid to bite
against; without it the pipe wall deforms and the joint weeps or creeps out
under pressure.

**But it is not established that any are missing here.** Plasson's published
component breakdown for the Silverline/Agrifit range lists body, nut, *split
ring and grip ring (Acetal/POM)*, **a Liner (Acetal/POM)** and a nitrile seal —
i.e. a liner may ship inside each fitting. Trade guidance likewise says "most
quality fittings include inserts in the packaging, but always check".

Dan reports a white plastic part inside each connector "that grips the pipe".
That description matches the **grip ring**, not the liner — but both are white
acetal and both live in the same assembly, so it needs eyes on the part.

**Deciding test:** push the white part into the cut end of a 20 mm MDPE offcut.

| Result | Meaning |
|---|---|
| Slides **into** the bore | It is the liner. Nothing to buy. Not blocked. |
| Sits on the end like a collar / has teeth | It is the grip ring. Liners still needed. |

Distinguishing features — grip ring: ~20 mm bore (pipe passes through it),
toothed inner face, thin collar. Liner: ~14 mm OD (goes inside the pipe),
smooth tube ~25–30 mm with a small flange.

**If liners ARE needed:**
- **EGI:** 20 mm variant **out of stock** (£6.00/10).
- **Buy:** FloPlast Pipe Inserts 20 mm, 10 pack — **Screwfix `33270`, £6.38**.
  Spec field reads *"Pipe Fitting System: Compression"*. Click-and-collect.
- ⚠️ **Not** Flomasta MDPE Pipe Inserts (Screwfix `536cp`, £3.20) — those are
  specified for **push-fit**, not compression.

**Count regardless of source: one liner per pipe END, not per fitting.** The
20 mm × 1/2" BSPF tee takes two. Ends on the one-zone rig: ~6.

**Standing hypothesis for the 2026-08-25 leaks (1.5 bar):** if liners turn out
to be absent, every compression joint on the rig is a leak suspect, not just the
cross-threaded valve port. *Unverified until the test above is done.*

## The parts chain (verified correct)

```
20 mm MDPE pipe
  → LINER (inside the pipe end)            ← was missing
    → Plasson 20 mm × 3/4" BSP-male connector
      → 3/4" female side of Hansen bush
        → 1" male side of Hansen bush
          → valve 1" BSP-female port
```

### Valve — `RB/100-DV`

`RB/` is EGI's vendor prefix; Rain Bird's own number is `100-DV`. **That number
does not encode the thread standard** — the datasheet lists
`100-DV: 1" (26/34)*` with `* Available with BSP threads`, and an ordering note
that it is *"necessary to specify NPT or BSP thread type"*. The SKU alone is
**not** proof. What proves it:

1. Rain Bird datasheet — BSP variant exists, 1" (26/34) female both ports.
2. EGI's page for this SKU — *"1" BSP female threaded inlet and outlet"*.
3. **Physical test fit** — a BSP bush sealed perfectly on the good port of the
   valve from order EGI144055 (same SKU, same vendor). Strongest class.

Still: **hand-start the bush into both ports dry before PTFE or water.** Sweet
= confirmed. Binds at two turns = NPT variant, and EGI's 30-day returns cover it.

### Reducing bush — Hansen `HRB2520` / `SRB2520` / EGI `HANSEN/RB2520`

Triple-checked across three independent sources:

| Source | Class | Says |
|---|---|---|
| hansenproducts.com | manufacturer | `HRB2520`, 25×20 mm, **BSPT × BSPT**, glass-fibre reinforced nylon |
| Rigby Taylor (trade) | trade supplier | `SRB2520`, 1" × 3/4", **16 bar**, WRAS, glass reinforced nylon |
| EGI | vendor listing | 1" BSPM × 3/4" BSPF, £2.35, WRAS, above/below ground |

The `2520` in all three encodes 25 mm × 20 mm = 1" × 3/4" — the size is in the
part number, not a seller's title. 16 bar against a 3.8 bar supply is a 4×
margin.

⚠️ **The male thread is TAPERED (BSPT).** That is correct and standard for
irrigation into a BSP female port, but a taper *wedges* as it goes: hand-tight
plus a gentle nip only. Winding a tapered nylon male hard into a plastic valve
port is how valve bodies split.

## Rejected options (checked, not assumed)

- **Delete the bush — run MDPE straight into the valve's 1" port.** ❌ Dead.
  Plasson Silverline male connectors do not exist in `20 mm × 1" BSPM`. The
  range jumps from 20 mm × 3/4" to 25 mm × 1" — the compression body on a 20 mm
  fitting cannot carry a 1" thread. Going 25 mm × 1" plus a 25→20 reducer *adds*
  a joint rather than removing one.
- **Drop to a 3/4" valve so the connector goes straight in.** ❌ Dead. EGI's
  Rain Bird 3/4" DV is **£36.95 (dearer than the 1")**, **out of stock**, and
  listed as **"3/4" NPT female"** — the exact thread trap that has already cost
  £33.48 once.
- **Tap Adaptor Reducing Bush 1" BSPM × 3/4" BSPF, £2.70.** ❌ Rejected despite
  matching threads: it seals against a *tap's flat face* with an internal rubber
  O-ring, not against a fitting shoulder, and its material is only described as
  "UV stable" — unnamed polymer. Hansen is cheaper and fully specified.

## Why the valve is being replaced

- The **same 1"×3/4" bush sealed one port perfectly, no leak** → proves the
  parts and thread standard (BSP) are correct.
- The **other port cross-threaded**: a brass male bush started off-square in the
  soft plastic female port. Brass is much harder than the port, so it cut a
  false thread and chewed the plastic — "threads grinding, won't sit right,
  leaks." Not recoverable by tape or technique; that port is dead.

## Why plastic bushes now (decision)

Brass-into-plastic is a hardness mismatch: a slightly misaligned brass thread
**destroys** the plastic port. A **plastic bush into a plastic port is the same
hardness** — a bad start just fails to bite instead of cutting the port. Removes
the failure mode that killed this valve.

The same mismatch, in slow motion, is what wore out the `20 mm × 3/4" BSPM`
connector: a plastic male thread cycled repeatedly in and out of a brass bush
grinds the plastic away. With the bush now nylon, that pairing becomes
plastic-on-plastic and the wear mechanism largely goes away — but the fitting
stays the cheap sacrificial part, hence the spare.

## Assembly method (so it doesn't happen again)

1. **Fit a liner into every MDPE pipe end** before the compression nut goes on.
2. **Start every threaded fitting by hand.** Turn **anticlockwise first** until
   you feel a click (thread dropping into register), then forward.
3. It should go **2–3 turns finger-easy**. Any force needed to *start*, or a
   gritty first turn → it's cross-starting. **Stop, back out, realign.** Never
   power through the first turn.
4. **PTFE generously** on the male thread, wound clockwise.
5. **Don't overtighten plastic** — hand-tight then a *gentle* nip only. Doubly
   true for the Hansen's tapered male: it seals on wedge + tape, not on force,
   and a plastic port splits if driven home hard.
6. Seat square, test each joint from the valve outward, one at a time.

## Supply figures

- Static pressure **~3.8 bar / ~55 psi**, flow **~19 L/min** (14 L in 44.17 s),
  measured 2026-07-20 **through a garden hose**, not through the built rig.
- **The 1.5 bar reading (2026-08-25) is not usable.** It was taken on a leaking
  system, and leaks bleed flow — which is what creates pressure drop. It
  measures the leak, not the system. **The 2-vs-3-valve zone-count gate stays
  open** until both gauges are read under flow on a *sealed* rig (build guide
  Stage 8C step 8).

## Backlog — inline filter (deferred from v1 on 2026-08-25)

**Decision: not in v1.** Dan — *"seems overkill for v1."* Agreed and closed; do
not re-raise for the MVP. Revisit when building the permanent manifold, sized
against a zone count that is actually known by then.

Rationale for the deferral, so it does not get re-litigated from scratch:

- The only mainline filter EGI stock is the **Rain Bird 1" BSP Large Capacity
  Disc Filter, 130 micron, £21.95**. Their other in-line filters (13 mm, 19 mm)
  are barbed for micro/drip tubing, not a 20 mm MDPE main.
- It is rated **150 L/min against a 19 L/min supply** — ~8× oversized. Not
  harmful (more area = less cleaning, lower loss, which suits a flow-limited
  system) but it is bulk and cost for capacity that will never be used.
- ⚠️ **Its ports are 1" BSP MALE both ends** (confirmed from the product
  photograph). The Hansen `HRB2520` bushes are 1" M × 3/4" F — **wrong way
  round, they do not fit it.** Plumbing it to 20 mm MDPE needs, *per side*:
  a **1" BSPF × 3/4" BSPM** adaptor **plus** a **Plasson 20 mm × 3/4" BSPF**
  connector. There is no 20 mm × 1" BSPF in the Plasson range (the female range
  stops at 20 mm × 3/4", same ceiling as the male range).
- Useful property when it is eventually fitted: filter 1" male mates **directly**
  to the valve's 1" female inlet with nothing between them, saving one bush.
- The `100-DV` already carries a built-in **90-mesh (200 micron) solenoid
  filter** (Rain Bird datasheet), so the valve pilot is not unprotected without
  it. The 130 micron filter is finer, but it is added protection, not a rescue.

What it actually protects: the MP3000's nozzle orifices, and — the one that
matters — the valve diaphragm's pilot passage, where grit means the valve fails
to *close*.

## Nozzle experiment kit (SUPERSEDED — see the MP3500 lock-in below)

| Part | SKU | Qty |
|---|---|---|
| Hunter MP Rotator 3500, 90°–210° (9.4–10.5 m) | `HI/MP3500-90` | 1 |
| Hunter MP Rotator 2000, 90°–210° (4.0–6.5 m) | `HI/MP2000-90` | 1 |
| Hunter MP Rotator adjustment tool (arc **and** radius) | `HI/MPTOOL` | 1 |

Brackets the MP3000 already owned, in both directions. All MP nozzles are
interchangeable on the same Pro-Spray body, so all three can be tested on the
single `PROS-04-PRS40-CV` — one variable at a time.

⚠️ **EGI's own nozzle descriptions are wrong.** The MP2000, MP3000 and MP3500
pages all carry identical copy claiming "2.5 m to 4.5 m radius" (the MP1000's
figure). Do not size anything from those listings.

### Hunter performance data (manufacturer, at 40 psi = 2.76 bar)

The `PROS-04-PRS40` regulates to 2.8 bar, so this table transfers directly.

| Nozzle | Radius | Flow @ 90° | Flow @ 360° |
|---|---|---|---|
| MP1000 | 2.4–4.6 m | 0.79 L/min | 3.18 L/min |
| MP2000 | 4.0–6.4 m | 1.63 L/min | 5.60 L/min |
| **MP3000** | 6.7–9.1 m | **3.26 L/min** | 13.78 L/min |
| MP3500 | 9.4–10.7 m | 4.84 L/min | 12.45 L/min |

Converted from Hunter's GPM figures (× 3.785). Flow scales with arc — a 360°
nozzle drinks roughly 4× a 90° one, which is why a single MP3000 full-circle
would eat 72% of this system's entire supply.

### What this implies for the 2-vs-3-valve gate — *calculated, not measured*

- **4 × MP3000 at 90° ≈ 13 L/min** against a **19 L/min** supply → ~6 L/min
  headroom. First real evidence that **2 valves** is enough, not 3.
- **But the throw is marginal.** The requirement is 8.9 m corner-to-centre and
  the MP3000 tops out at **9.1 m** — working at the very edge of its range.
- **The MP3500 reaches easily but does not fit the water:** 4 × MP3500 at 90° =
  **19.4 L/min**, i.e. the entire supply, with nothing left.
- **So the experiment is:** does an MP3000 at 90° actually throw 8.9 m at real
  pressure? If yes → 2 valves. If it falls short → MP3500 forces the zone split
  and the answer becomes 3.

**None of this replaces the gate** (build guide Stage 8C step 8: both gauges
read under flow on a sealed rig). It is arithmetic from a datasheet, not a
measurement.

### Spray bodies — BOUGHT (3, correcting an earlier wrong call)

| Part | SKU | Qty |
|---|---|---|
| Hunter Pro-Spray PRS40 4" body, regulator + check valve | `HI/PROS-04-PRS40-CV` | 3 |
| Plasson connector 20 mm × 1/2" BSPM (body inlet) | `PL/14020C10` | 3 |

Takes the total to **4 bodies**, matching the four corners.

**Correction:** an earlier revision of this note held bodies back on the grounds
that "how many bodies are needed depends on the nozzle choice". That was wrong.
The nozzle choice drives the **zone count** (how many valves); the **body count
is fixed by geometry** — four corners need four bodies whatever nozzle sits in
them. They were never speculative. EGI had only 5 in stock.

⚠️ **They must be `PRS40`, not the plain Pro-Spray 4" body at £3.65.** The plain
body has no pressure regulation, so at a 3.8 bar supply it would flow more and
throw further than the existing regulated head — every nozzle comparison would
be measuring the *body*, not the nozzle. The PRS40 regulates to **2.8 bar
(280 kPa)**, which is exactly the 40 psi Hunter quote their flow table at, so
measurements transfer directly. (EGI's search also surfaces a **PRS30** at
£16.15 — regulates to 30 psi, wrong data point. Do not substitute.)

Body inlet is **1/2" BSP female** — established from the original BOM, which
already carries one `20 mm × 1/2" BSPM` feeding the head.

**Known state after this order:** 4 bodies but only 3 nozzles (MP3000 owned,
plus MP2000 and MP3500). A true 4-head simultaneous flow test needs **4 matching
nozzles**, which cannot be chosen until the throw test decides the series. One
body will therefore sit unpopulated at first — harmless, because the PRS40's
**FloGuard** automatically throttles flow when a nozzle is missing.

### Backlog — swing joints / flexible risers (trade practice, not yet bought)

Running rigid MDPE straight into a pop-up body is poor practice: no height
adjustment for levelling the head to the turf, and a boot or a mower cracks the
fitting or the body. The trade uses a **swing joint** or flexible "funny pipe"
riser between the lateral and the body. EGI stock *Rain Bird Swing Pipe, 1 m*.

Not needed for the above-ground test rig — this is a **Stage 8D permanent
install** item. Buy when the heads go in the ground, sized once the head
positions are pegged out.

## Layout — settled 2026-08-25 (supersedes earlier 5-head sketch)

Source: the layout drawing, filed in Obsidian at
`Projects/golden-shower/garden-layout-2026-08-25.png` (embedded in the project README and
in the `plan-water-distribution` ticket). Dan's underground
pipe plan, revised down from an earlier 5-head version.

```
S21 ---------- top ---------- S22      Line 2
 |                                     (valve box -> up left -> across top)
 |
 |
S11 --------- bottom -------- S12      Line 1
 |                                     (valve box -> across bottom)
[valve box]              [garden work area]
```

- **4 heads, one per corner.** All **90° arcs** — the diagram's arrows show each
  head throwing a quarter-circle diagonally into the plot.
- **Line 1:** S11, S12. **Line 2:** S21, S22. Two heads per zone.
- **2 zones = 2 valves.** Independently confirms the valve count already bought.

### ⚠️ Correction — the MP3500 was wrongly rejected

An earlier note computed `4 × MP3500 @ 90° = 19.4 L/min` and rejected it as the
entire supply. **That assumed all four heads running simultaneously, which never
happens** — the zones run one at a time (firmware interlock), so at most **two**
heads are live.

| Per zone (2 heads @ 90°) | Draw | vs 19 L/min |
|---|---|---|
| 2 × MP3000 | 6.5 L/min | 34% |
| 2 × MP3500 | 9.7 L/min | 51% |

**Flow is not the constraint. Reach is.**

- Corner-to-centre: **8.9 m**.
- **MP3000: 6.7–9.1 m** — clears 8.9 m only at its absolute maximum (0.2 m
  margin), and only if it achieves full radius at real pressure. Unproven.
- **MP3500: 9.4–10.7 m** — clears 8.9 m even at its **minimum**.

Radius adjusts *downward* with the `HI/MPTOOL`, so over-throw is correctable and
under-throw is not. **Working assumption: MP3500 on all four corners**, pending
the throw test.

**Do not re-derive this from the 4-heads-at-once figure.**

### DECIDED 2026-08-25 — MP3500 on all four corners

Dan: *"lets lock in on MP3500."* Locked. 4 × `HI/MP3500-90` on the order.
Rationale is the reach margin above, not flow. The MP3000 already owned becomes
a bench spare.

### Outstanding nozzle buy — time-boxed

If the throw test confirms MP3500, **3 more are needed** (`HI/MP3500-90`).
£24.60 net at the sale price vs £30.75 + a second delivery afterwards.
**The 20% ends 31 August 2026** — so the throw test wants running early in the
week, not the following weekend.

The test does **not** need the valve: PRS40 body straight off the splitter, MP3000
fitted, measure where it lands. The body self-regulates to 2.8 bar.

### Body count — settled

4 corners = 4 bodies. 1 owned + **3 on this order** = 4. (An earlier revision put
4 on the order for a 5-head layout; corrected down when the layout settled.)

### Still unmeasured — pipe length

Scaling the diagram against a ~12.6 m plot (inferred from 8.9 m corner-to-centre
— rough), Line 1 + Line 2 come to roughly **33 m** before risers, slack and
trench dips. The 50 m coil has ~16 m earmarked for the test rig, leaving ~34 m.
**Marginal.** Walk it with a tape before ordering more, or confirm the rig pipe
gets recovered — MDPE is £74.95 a coil plus a delivery to run out mid-trench.

## ORDER PLACED — EGI144331, 2026-08-25 20:09

Confirmed by email from `hello@easygardenirrigation.co.uk`, 25 August 2026.
Paid **£218.96** on Mastercard ••9915. **Shipping: Standard UK (1–2 days),
£0.00** (cleared the £200 threshold). VAT £36.50 included. Placed 20:09 Tue, so
dispatch Wednesday (they cut off at 12:00).

| Part | SKU | Qty | Line |
|---|---|---|---|
| 20 mm black MDPE pipe, 50 m | `MDPE/BLK20050` | 1 | £74.95 |
| Rain Bird 1" DV solenoid valve, 24 V | `RB/100-DV` | 2 | £65.90 |
| Hunter Pro-Spray PRS40 4" body | `HI/PROS-04-PRS40-CV` | 3 | £47.70 |
| Hunter MP Rotator 3500, 90°–210° | `HI/MP3500-90` | 4 | £41.00 |
| Hansen nylon reducing bush 1" M × 3/4" F | `HANSEN/RB2520` | 4 | £9.40 |
| Plasson connector 20 mm × 3/4" BSPM | `PL/14020C20` | 5 | £9.50 |
| Plasson connector 20 mm × 1/2" BSPM | `PL/14020C10` | 4 | £7.60 |
| Plasson tee 20 mm × 1/2" BSPM | `PL/14840C1C` | 2 | £6.80 |
| Plasson elbow 20 mm × 1/2" BSPM | `PL/14850C10` | 3 | £6.00 |
| Plasson connector 20 mm × 3/4" BSPF | `PL/14030C20` | 1 | £2.60 |
| Hunter MP Rotator adjustment tool | `HI/MPTOOL` | 1 | £2.25 |
| | | **Gross** | **£273.70** |
| End of Season Sale, 20% off | | | −£54.74 |
| | | **Paid** | **£218.96** |

⚠️ **Variance from the agreed basket:** `PL/14020C10` was reduced to **1** before
checkout but the order shipped **4** — the checkout used the pre-reduction cart.
Cost £4.56 more than planned (£218.96 vs £214.40) and leaves **3 surplus
straight 1/2" connectors**. Generic Plasson spares; no functional impact.

### Running spend on the water side

| Order | Date | Vendor | Total |
|---|---|---|---|
| BOM as bought (incl. Screwfix A27347852422) | 2026-08-10 | mixed | ~£163.00 |
| EGI144055 | 2026-08-22 | Easy Garden Irrigation | £44.12 |
| EGI144331 | 2026-08-25 | Easy Garden Irrigation | £218.96 |
| | | **Running total** | **~£426.08** |

**EGI144055 detail** (£38.17 + £5.95 postage; no sale discount — the 20% had not
started): `RB/100-DV` ×1 £32.95 · `PL/14050CC0` plain 20 mm elbow ×1 £3.22 ·
`PL/14850C20` 20 mm × 3/4" BSPM elbow ×1 £2.00.

📌 **Two elbows already owned that were never in the BOM:** a plain 20 mm elbow
(`PL/14050CC0`) and a 20 mm × **3/4"** BSPM elbow (`PL/14850C20`). Neither is a
1/2" head fitting, so they do not change the head plan — but they exist, and the
BOM in `specs/build-guide.md` does not list them.

Free shipping on EGI144331 saved the £5.95 charged on EGI144055.

## Head fittings — settled 2026-08-25

Topology follows from the layout: S11 and S21 are **pass-through** heads (pipe
in, head, pipe on to the next), S12 and S22 are **terminal**.

| Position | Fitting | SKU | Qty |
|---|---|---|---|
| S11, S21 (pass-through) | Plasson tee 20 mm × 20 mm × 1/2" BSPM | `PL/14840C1C` | 2 |
| S12, S22 (terminal) | Plasson elbow 20 mm × 1/2" BSPM | `PL/14850C10` | 3 (2 + spare) |

The lateral runs horizontal underground and the body stands vertical, so the
terminal heads need an **elbow**, not a straight connector — a straight only
works if the pipe is bent upright first, acceptable on an above-ground rig and
poor practice buried. The corners are made by **bending the MDPE**, not by elbow
fittings; 20 mm MDPE bends to ~200 mm radius, easily achieved in a trench.

⚠️ **`PL/14840C1C` had only 2 in stock — exactly the number needed. No spare
exists.** The elbows were taken 2 + 1 spare to partly compensate.

**Straight `PL/14020C10` reduced 4 → 1.** With tees and elbows serving every
head, nothing in the permanent build needs a straight 1/2" connector; one is
kept for the test rig (a second is already owned).

### Thread standard — ½" BSP, stated but worth a physical check

The body inlet is **½" female** — a **male** fitting screws into it.

| Source | Says |
|---|---|
| EGI product spec list | **"Inlet thread size: 1/2" BSPF"** |
| Hunter metric/European catalogue | `PROS-04-PRS40-CV … ½" inlet` — **standard not stated** |
| Hunter **US** catalogue | ½" **NPT** female |

Hunter never states BSP anywhere; the only explicit BSP claim is EGI's spec
field. That is a spec field rather than marketing copy, so it carries weight —
**but the same EGI page says "Brown Cap" twice, while Hunter's comparison chart
lists PRS40 as GREY cap and PRS30 as brown.** EGI have pasted PRS30 copy into
this listing (same sloppiness as their nozzle pages, which all quote the
MP1000's radius). So the page is not a source to bet the whole head-fitting
selection on unchecked.

⚠️ **½" is a worse trap than 1": BSP and NPT are both 14 TPI at that size**,
differing only in flank angle and taper. It will feel correct for two turns
either way.

**Free check, before anything is buried:** dry-fit the owned PRS40 body against
the owned `20 mm × 1/2" BSPM` Plasson connector. Smooth and keeps going = BSP,
all good. Binds hard after ~2 turns = NPT variant, and the 2 tees + 3 elbows are
the wrong standard (£12.80, inside EGI's 30-day returns).

### Swing joints — now manufacturer-backed, not just trade lore

Hunter's own CAD installation details are titled *"PROS-00-PRS30 PRS40 with
Hunter Swing Joint"*, *"with Flex Swing Arm"*, *"with Field-Built Swing Arm"*,
*"with Rigid Riser"*. The manufacturer assumes an articulated riser between
lateral and body. Still Stage 8D, but better evidenced than when first parked.

## Valve box — identified 2026-08-25, NOT yet bought

The last outstanding item. **Not urgent:** this is a Stage 8D (permanent buried
install) part. The above-ground test rig needs no box.

**EGI cannot supply it.** Every rectangular box there is out of stock — Rain Bird
Standard (£53.95), Rain Bird Jumbo (£82.95), Irritec Standard 12" (£29.99),
Irritec Jumbo 12" (£45.99). Only round boxes remain (7" £22.95, 10" £31.95), and
a 10" round is a *single-valve* box — two 1" DV bodies with bushes and connectors
either side span ~350–400 mm and need hand access to the flow control and bleed
lever. A round box will not house this manifold.

**Recommended:** HydroSure Jumbo Rectangular Valve Box — **Water Irrigation
(waterirrigation.co.uk), product code `32120014`, £47.74 inc VAT, 17 in stock.**
Next-day if ordered by 9pm; click & collect available; 28-day returns.

| | Lid | Base | Height |
|---|---|---|---|
| HydroSure Jumbo `32120014` | 500 × 365 mm | 640 × 507 mm | 300 mm |
| Rain Bird VB-STD (ref) | — | 590 × 491 mm | 318 mm |
| Rain Bird VB-JMB (ref) | — | 700 × 532 mm | 316 mm |

**Fit check:** the *lid aperture* is the working constraint. Two 1" DV assemblies
(~300 mm each end-to-end with bush + connector) fit the 500 mm length; at ~130 mm
spacing they use ~260 mm of the 365 mm width. 300 mm depth covers valve height
plus a gravel base. Leaves room for a third valve if a zone ever splits.

Rain Bird's own Jumbo is the same class for £82.95 at EGI — and out of stock.

### ⚠️ Also missing — gravel base and membrane

The build guide (Stage 8D step 4) specifies the box sits **"on a gravel base
(drainage)"**. Neither gravel nor membrane appears in any parts list.

**Spec — this matters more than the quantity:**

- **20 mm clean *washed* shingle** (pea shingle / 20 mm gravel).
- ❌ **Not MOT Type 1** — a compacting sub-base *with fines*, engineered to bind
  and shed water. Exactly backwards under a drainage box.
- ❌ Not sharp/building sand.
- **Washed** is the operative word: unwashed aggregate carries fines that silt
  the voids and the bed stops draining within a season.

**Quantity** for the HydroSure Jumbo (base 640 × 507 mm = 0.324 m²) at a 75 mm
bed: 0.324 × 0.075 = **0.024 m³ ≈ 37 kg** → **2 × 20 kg bags**, a third if
haunching around the sides. ~£12–18 at B&Q / Wickes. A bulk bag is overkill.

**Geotextile membrane under the gravel** (~£10/roll). Without it soil migrates
up from below and blinds the voids — drainage for one season, then a sump. This
is what makes the bed last rather than merely exist.

## Still unsourced for the buried install (not new, but open)

`docs/wiring-and-cable-grades.md:356` already carries this and it is still
marked `SOURCE`, i.e. not owned:

> Valve-box connectors | gel-filled / IP68, one per solenoid joint | zones + common | `SOURCE`

The build guide is blunter about this than anything else in it: *"Never a dry
Wago in the ground. This is the single most failure-prone spot in the whole
build."* The Wago 221s on hand are enclosure parts, not chamber parts. **2 valves
= 3 joints; 4 valves = 5.**

## Valve manifold — plan-ahead decision (raised 2026-08-25, not yet bought)

Dan is committed to **2 valves now**, with a possible **3rd** if low pressure
forces a zone split, and a **4th** for basket watering deferred to next year. The
box must therefore be sized for **4** even though only 2 are being installed.

**Recommendation: buy the Rain Bird 4-Way Manifold now** (EGI, £39.95, in stock;
£31.96 at the 20% sale). It fixes the footprint on day one — populate 2, add the
3rd and 4th later without re-plumbing or re-excavating.

It also removes the failure mode that destroyed the first valve: *"4 × 1" Swivel
nuts with male thread… produce a tight assembly by the aid of a sealing washer
**without the need to use PTFE sealing tape**."* A union nut with a face seal,
not a taper biting into plastic. Rated 10 bar against a 3.8 bar supply.

**Reconciles against parts already bought:**

| Need for 4 valves | Owned |
|---|---|
| 4 × Hansen bush — one per valve **outlet** | 4 ✓ |
| 4 × Plasson 20 mm × 3/4" BSPM — outlets | 5 ✓ |
| 1 × Hansen bush for the manifold **inlet** | ✗ one short |

The manifold inlet is 1" swivel-female → Hansen bush 1" M × 3/4" F → Plasson
20 mm × 3/4" BSPM → MDPE. (It cannot take MDPE directly: no 20 mm × 1" fitting
exists in the Plasson range — same constraint as the valve ports.)

**Fit against the HydroSure Jumbo — estimated, not confirmed.** Valve body is
111 × 84 × 114 mm (Rain Bird datasheet). Four at ~100–115 mm outlet pitch spans
~400–460 mm, comfortable inside the 500 mm lid aperture. Stack height (manifold +
valve ≈ 200 mm, plus 50 mm gravel) ≈ 250 mm in a 300 mm box — ~50 mm of finger
room above the valves. **Depth is the binding constraint, not width.** The
manifold's actual pitch and height are being retrieved; confirm before buying.

### ⚠️ Open design question — do baskets belong in this box at all?

Drip/micro irrigation is a different regime: a few L/min, emitters that clog
below ~120 micron, often lower regulated pressure. Sharing this manifold makes
the (currently backlogged) filter **mandatory for the whole system** and forces
the basket line to run at lawn pressure. A separate small box near the baskets,
on its own line, is frequently the better build. **Decide this before sizing for
four**, not after.

## Capping unused manifold outlets — decided 2026-08-25

With a 4-way manifold and only 2 valves fitted, **2 outlets need blanking**. The
outlets are **1" BSP male**, so the part class is a **female cap** — a *cap* goes
over a male thread; a *plug* is male and goes into a female. EGI stock both, so
the distinction matters when ordering.

**Chosen:** `Threaded Cap 1" BSP`, EGI, **£1.45 each, in stock**. Buy 2.

⚠️ **Bought as a cheap bet, not a verified part.** The listing says the caps are
*"used to cover up and protect threaded fittings"*, describes the material only
as *"UV stable"*, and gives **no pressure rating**. That is dust-cap language,
and these outlets see full supply pressure (3.8 bar static) whenever a zone runs.
Dan's call, and a sound one: *"its a 1.45 bet. Better to try and fail then be
blocked from day 1."* Fallback if they prove to be dust caps is a properly
pressure-rated 1" BSP female blanking cap — discoverable with the manifold in
hand, before anything is buried.

**Fit the valves adjacent and cap the two OUTER outlets.** Keeps the wetted run
short, keeps both solenoids together for the daisy-chained common return, and
leaves the dead legs at the ends where they are shortest. Stagnant water in a
capped stub is harmless here — downstream of the DCV, non-potable black MDPE.

### ORDER PLACED — EGI144332, 2026-08-25 20:35 (manifold group)

| Part | SKU | Qty | Sale price |
|---|---|---|---|
| Rain Bird 4-Way Manifold | `RB/1301-410` | 1 | £31.96 |
| Threaded Cap 1" BSP | `A44515` | 3 | £3.48 |
| Hansen nylon bush 1" M × 3/4" F (manifold inlet) | `HANSEN/RB2520` | 1 | £1.88 |
| | | **Subtotal** | **£37.32** |

**Placed as its own order at £43.27** (£46.65 gross − £9.33 sale + £5.95
postage). Caps went in at **3**, not 2 — the manifold has connections at *both*
ends and the feed lands on the swivel-female one, leaving the male end to blank.
Postage accepted rather than phoning to amend EGI144331, on stock risk.

---

# ⚠️ CORRECTIONS — datasheet audit, 2026-08-25

A datasheet-refresh agent pulled manufacturer sources for every part and audited
this repo against them. **The findings below supersede anything above that
contradicts them.**

## 1. The liner question is CLOSED — no liner is used

**Plasson's 2026 technical catalogue lists Silver Line as four parts:** PP body,
PP nut, **polyacetal split ring**, nitrile seal. There is **no liner**, and the
16–63 mm assembly instructions contain **no insert step**.

- The white part in hand is the **split ring**. Nothing was missing.
- The Pipe Liner is a separate *Tooling* item, code `07950`.
- The grip ring (`07970`) is specified for UPVC/PP, **not PE**.
- **The "missing liners caused the leaks" hypothesis is dead.** Screwfix `33270`
  was correctly cancelled.

### ✅ But Plasson specify two assembly steps this repo never had

1. **Chamfer the pipe end.**
2. **Silicone-lubricate it** before insertion.

An unchamfered end can roll or nick the O-ring going in — **this fits the
observed leak far better than the liner theory did.** Add both to the assembly
method.

## 2. `20 mm × 1"` Plasson fittings DO exist

`140200020010` (male) and `140300020010` (female) are in Plasson's catalogue.
**The earlier claim that "no 20 mm × 1" fitting exists" was wrong** — what is
true is that *EGI does not stock one*. A shop's dropdown was mistaken for a
range limitation.

Two "rejected options" above rest on that false claim. Practical impact is now
small because the manifold changed the topology, but the male fitting would take
MDPE straight into a 1" port, deleting a bush and a threaded joint. **Catalogue
listing ≠ availability — check before re-planning.**

## 3. Hunter never states the PRS40 thread standard — anywhere

The claim above that "Hunter's US datasheet says ½" NPT" **could not be
reproduced** in the US cutsheet, the metric cutsheet, the specifier brochure or
the product page. Hunter state `½" inlet` and never the standard, in any edition.

There is therefore **no NPT claim to weigh** — only EGI's spec field saying BSPF,
and the dry-fit. (Hunter *does* confirm **grey cap**, so EGI's "Brown Cap" copy
is confirmed PRS30 paste.)

## 4. Thread standard IS part-number-encoded — on both sides

- Rain Bird catalogue the **BSP** valve as **`I100-DV`**, with the footnote
  inverted ("*available with NPT*"). **Check the box/body for the `I` prefix.**
- Plasson state **ISO 7-1 / ISO 228**, and the Silver Line size column is headed
  `R`.

## 5. Solenoid current is higher than documented

`wiring-and-cable-grades.md` *derives* 0.34 A inrush / 0.22 A holding for 50 Hz
from the US 60 Hz sheet. Rain Bird's international catalogue publishes 50/60 Hz
directly:

| | Documented | **Actual** |
|---|---|---|
| Inrush | 0.34 A | **0.450 A (10.8 VA)** |
| Holding | 0.22 A | **0.250 A (6.0 VA)** |
| Coil | 42–55 Ω | **38 Ω** |

Conclusion holds (one zone at a time on a 15 VA transformer) but **the margin is
thinner than believed**. The cable note's "~0.3 A per valve" is wrong. Two valves
energised together would be 21.6 VA against 15 VA — **the one-zone-at-a-time
interlock is load-bearing, not a nicety.**

## 6. MP3500 has no 360° model

`MP350090` (90°–210°) is the only MP3500. **The `12.45 L/min @ 360°` in the flow
table above is actually the 210° figure.** MP1000/2000/3000 360° figures are
correct. No impact on this build — all four heads are 90°.

## 7. Valve box comparison was apples-to-oranges

The table above compares the **HydroSure lid** against the **Rain Bird base**.
Rain Bird VB-JMB's *top opening* is only **474 × 309 mm** — so the HydroSure
Jumbo's 500 × 365 mm aperture is the **roomier** box, not the tighter one.

## 8. Manifold dimensions — Rain Bird publish none

This was the priority ask and **it does not exist** in any Rain Bird document.
Nearest datum: their **MTT-100 gives 120 mm pitch per valve** → four valves span
**480 mm** against the HydroSure's 500 mm aperture. **Fits, tightly.** Put a tape
on the actual part when it arrives.

## 9. Smaller corrections

- DV pressure loss at 19 L/min is **0.26 bar, not 0.17** (the build guide quotes
  the Angle/MxB chart, not the inline one).
- MP3000 max radius is **9.1 m**, not 9.0.
- Songle relay coil is **69.4 Ω → 72.0 mA**, and its DC rating is **28 VDC**
  (30 VDC is max *switching* voltage, not a rating).

## Datasheets

**Added 11** (metric/BSP `I100-DV`, `1301-410` manifold, three valve-box sheets,
Hunter metric PRS40 + MP Rotator cutsheets + design guide Rev J, two Hansen
sheets, Plasson Silver Line chapter). **Refreshed 3** (ESP32 v3.6→v3.7, Mean Well
HDR-15 2024→2026, Songle to the manufacturer's own 2025 sheet). **Could not
obtain 3** — manifold dimensions (do not exist), Wago 221-413 (generator timed
out, retryable), ABB TM15/24 (no PDF exists; the repo's HTML-table capture *is*
the datasheet).
