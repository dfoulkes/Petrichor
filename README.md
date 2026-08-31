# Petrichor

> **📍 Project tracking lives outside this repo.** This repo holds the spec, datasheets and
> ESPHome config. Design decisions, the ticket board and the open questions — especially the
> flow/pressure measurement that gates the hydraulic design — are tracked separately.

## What is this?

Petrichor is an IoT irrigation system designed to work with Home Assistant.
It automates the watering of a back garden.

## Must Haves

- Two zone system setup, low pressure (for 4 hanging baskets), high pressure (4 outputs) 
- the Manifold (water hub) will have a Double check valve to the tap to avoid backflow. 
- We'll manage the zones via a 24VAC solenoid valve. 
- compute will be supplied via a ESP32. 
- we'll use a drip solution for the hanging baskets. 
- 

## Decisions 

- This is going to be driven by a single tap, thus we must use valves to run only one zone at a time and keep reasonable pressure.

- To help with pressure the high pressure line should be a circular in design (self back feeding) so to ensure equal distribution and allow for higher pressure build up 

- **one zone comes on at any one time** (enforced by the firmware interlock).

- high pressure will be located at the 90 degree corners of the garden facing inwards.

- high pressure will use **low-flow rotary nozzles** (Hunter MP Rotator / Rain Bird R-VAN).

> **Revised 2026-07-20 by the flow/pressure test** (~3.8 bar static, ~19 L/min — see the build
> guide). Two earlier decisions changed because **flow, not pressure, is the constraint**:
> - *"only one **nozzle** at a time" → "one **zone** at a time".* Low-flow rotaries (~1.5–3 L/min
>   each) mean the four corner heads (~10 L/min together) fit in a **single zone**, so we group and
>   sequence zones rather than firing one nozzle at a time.
> - *"fixed spray nozzles" → **rotaries**.* Fixed sprays are thirsty — only 2–3 fit the ~19 L/min
>   budget; rotaries give ~5–8 heads with better uniformity.
>
> Net effect: the MVP is **~2 zones** (the corner rotary ring + a drip line for the baskets), which
> is exactly the "two-zone" split already in Must Haves. The 8-channel relay is expansion headroom.
> The grouped-zone plan is contingent on a **dynamic-pressure (sag-under-flow)** check still
> outstanding — if it sags, the HP ring splits into two smaller zones (interlock makes that free).

> **Revised 2026-08-31 — the watering target changed.** Everything above sized the hydraulics around
> **watering the lawn**. That was wrong: the **three flower beds are the priority, and always were.**
> The beds appeared in the design only as the place the sprinklers were *mounted* — as specified,
> the system watered the lawn and the hanging baskets, and gave the beds nothing.
>
> **Bed layout:** three beds — **north, east and west** looking out from the house. The lawn is the
> leftover middle, roughly **8 × 12.5 m** once the beds are taken out of the 11 × 14 m plot.
>
> Consequences, in order of how much they change:
> - *"high pressure at the 90° corners facing inwards"* → **beds get pressure-compensating inline
>   dripline.** Rotaries are the wrong tool for a bed: overhead spray wets foliage, is shadowed by
>   the planting, and lands its water off-root. Drip is what beds want.
> - *"~2 zones"* → **3 zones, built in priority order**: (1) the beds — **the entire MVP**;
>   (2) the hanging baskets; (3) the lawn ring, **deferred**. Zone 1 draws ~9 L/min against the
>   ~15 L/min budget and runs on the **one valve already owned** — no further valve needed for MVP.
> - **The circular self-back-feeding loop is obsolete for the MVP.** It exists to equalise pressure
>   across rotary heads; PC dripline equalises itself, and also absorbs the garden's decline
>   (~0.1 bar per metre of fall). It carries forward to zone 3 if the lawn ring is built.
> - **The sag-under-flow gate is obsolete for the MVP.** It was the PRS40's 2.75 bar regulation
>   point. Zone 1 runs behind a reducer at ~1.5 bar from 3.8 bar static, on flat PC emitters. Still
>   gates zone 3.
> - **Nothing bought is wasted.** The PRS40 body and MP3000 nozzle (£26.15) carry forward to zone 3,
>   where the shrunken lawn puts corner-to-centre at **~7.4 m** — mid-range for an MP3000 instead of
>   at its 9.0 m ceiling. The marginal-throw worry that dominated 8A resolves itself.
>
> ⚠️ **The lawn cannot be watered as a byproduct of the beds.** Drip has no throw — it delivers into
> the soil at the emitter and gives the lawn precisely nothing. The lawn is its own zone or it is
> nothing. That is why it is deferred rather than folded in.
>
> **Supersedes the two-zone split in Must Haves above.** Full detail in the build guide, Stage 8–9.


## Project Setup 

- All device data sheets to be stored in ./datasheets/ 
- ./specs/ includes design specifications

## Garden Facts 

- the garden in 11 meters by 14 meters. 
- the is a suttle decline in the gardens level (the side closest to the house is slightly higher then the bottom of the garden.)
- It's south west facing.

## License

The firmware, scripts and documentation in this repo are released under the
[MIT License](LICENSE).

**Except `datasheets/`.** Those PDFs are third-party manufacturer documents (ELEGOO, Mean Well,
ABB, Rain Bird, Songle, Wago, CE-TEK), included for reference. They remain the copyright of
their respective owners and are **not** covered by the MIT grant above.

## ⚠️ Safety & regional scope

This project involves **230 V mains wiring**. The documentation here is a personal build log,
not a certified electrical drawing, and it carries no warranty of any kind — see the MIT
disclaimer. If you are not confident working with mains, have a competent person check your
work. Anything downstream of the transformer (24 V SELV) is safe to handle; the 230 V input is
not.

**Built for a UK domestic supply** — 230 V nominal at 50 Hz, wired to **BS 7671** (IET Wiring
Regulations 18th Edition, the UK implementation of **IEC 60364 / HD 60364**).

The low-voltage side is universal. The mains side is **not**, and two assumptions will mislead
you elsewhere:

- **The plug carries a 5 A BS 1362 fuse.** Most countries don't fuse at the plug. The conductor
  sizing here is justified by that fuse; with only a 15–20 A branch breaker upstream, it isn't.
- **Brown = Line, Blue = Neutral** (IEC 60445 harmonised). North America uses black/white/green.
  **Verify with a meter, never by colour.**

Full breakdown — including RCD vs GFCI, SELV vs NEC Class 2, and cable-standard equivalents —
in [`docs/wiring-and-cable-grades.md`](docs/wiring-and-cable-grades.md#regional-assumptions).
Adapting this elsewhere means working to your own local wiring regulations.

