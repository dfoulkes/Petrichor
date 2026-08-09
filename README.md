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

