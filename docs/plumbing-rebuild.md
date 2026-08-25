# Plumbing rebuild — valve manifold (open task)

> **Status as of 2026-08-25:** paused. One valve port is damaged; valve needs
> replacing and the reducing bushes are being switched from brass to plastic.
> Electrical/firmware side is **done and proven** — this is water-side only.

## Pick up here (needs a browser / ordering)

1. **Order a replacement valve** — the current one has a cross-threaded outlet
   port (see below). Same spec: **Rain Bird 1" DV solenoid valve, 24 V, BSP**
   (`RB/100-DV`). Optional upgrade: the **DVF** variant (same valve + built-in
   filter) — the RBY/DVF filter also unlocks the valve's low-flow rating, which
   suits our modest ~19 L/min supply.
2. **Order 2 × plastic (nylon/PP) reducing bush, 1" BSP male × 3/4" BSP female.**
   Replaces the brass bushes (see "why plastic" below).
3. **Optional — evaluate deleting the bush entirely:** price up
   **20 mm MDPE × 1" BSP male** adaptors and run them straight into the valve's
   1" ports. That removes one threaded joint per side (fewer leak points) and
   the reducing step altogether. If readily available, prefer this.

Supplier that has the valve + irrigation bushes: Easy Garden Irrigation
(where the valve came from). Screwfix stocks the brass equivalents but not
always the plastic irrigation bushes.

## The parts chain (verified correct)

```
20 mm MDPE pipe
  → 20 mm × 3/4" BSP-male MDPE adaptor   (already have)
    → 3/4" female side of reducing bush
      → 1" male side of reducing bush
        → valve 1" BSP-female port
```

- **Valve:** Rain Bird 1" DV, **1" BSP female inlet *and* outlet** (confirmed by
  the product spec and order EGI144055, 22 Aug 2026). US-origin brand
  ("assembled in Mexico") but this unit is **BSP**, confirmed because a BSP bush
  sealed perfectly on the good port.
- **Reducing bush:** 1" M × 3/4" F BSP. Screwfix Flomasta 1"×3/4" (28333) was
  the brass version bought 10 Aug (order A27347852422) — **switching to plastic**.
- **PTFE:** Arctic Hayes tape, already on hand (same Screwfix order).

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

## Assembly method (so it doesn't happen again)

1. **Start every threaded fitting by hand.** Turn **anticlockwise first** until
   you feel a click (thread dropping into register), then forward.
2. It should go **2–3 turns finger-easy**. Any force needed to *start*, or a
   gritty first turn → it's cross-starting. **Stop, back out, realign.** Never
   power through the first turn.
3. **PTFE generously** on the male thread, wound clockwise. Parallel BSP does
   **not** self-seal regardless of material — needs a proper pad of tape.
4. **Don't overtighten plastic** — hand-tight then a *gentle* nip only. It seals
   on the tape, not brute force; a plastic bush cracks if forced.
5. Seat square, test each joint from the valve outward, one at a time.

## Supply figures (from field test, for nozzle/zone sizing)

- Static pressure **~3.8 bar / ~55 psi** (mid-band — pressure is fine).
- Flow **~19 L/min** (14 L in 44.17 s) — **flow is the constraint**, points at
  low-flow rotaries and one-zone-at-a-time (matches the firmware interlock).
