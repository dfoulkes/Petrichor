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

- This is going to be driven by a single tap, thus we must use valves to limit which nozzle is active at any given point to ensure we keep reasonable pressure.

- To help with pressure the high pressure line should be a circular in design (self back feeding) so to ensure equal distribution and allow for higher pressure build up 

- only one high pressure nozzle comes on at any one time. 

- high pressure will be located at the 90 degree corners of the garden facing inwards.

- high pressure will use fixed spray nozzles.


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

## ⚠️ Safety

This project involves **230 V mains wiring**. The documentation here is a personal build log,
not a certified electrical drawing, and it carries no warranty of any kind — see the MIT
disclaimer. If you are not confident working with mains, have a competent person check your
work. Anything downstream of the transformer (24 V SELV) is safe to handle; the 230 V input is
not.

