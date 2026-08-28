# Petrichor — project notes for Claude Code

ESP32 + ESPHome irrigation controller. Electrical/firmware side is built and
proven **on the bench** — but see the hand-off below: six items needed to
install it outdoors were never bought. `specs/build-guide.md` and
`docs/wiring-and-cable-grades.md`.

## Active hand-off

**Read `docs/outstanding-to-complete-build.md` first** — the consolidated
register of everything still needed to get from "proven on the bench" to
"installed and running". `docs/plumbing-rebuild.md` carries the water-side
reasoning and part evidence behind it.

Status as of 2026-08-25:

- **Water side is ordered.** EGI144331 (£218.96) placed — 2 valves, 3 spray
  bodies, 4 MP3500 nozzles, all fittings, a second MDPE coil. Arrives Wed 26th.
  A second order EGI144332 (manifold, 3 caps, bush — £43.27) also placed.
  Running spend ~£469.35.
- **The electrical side is closer than this file used to claim.** It previously
  said **six** wiring-BOM items were `SOURCE` "including the field cable to the
  manifold — without that the controller cannot reach the valves". **Wrong since
  2026-08-25:** the field cable (`RB/IRRICAB5-15M`, 5-core, 15 m) and the
  gel-filled splices (`RB/DBRY.P2` ×2 = 4 × DBR/Y) were bought in EGI144337 and
  delivered 2026-08-27. **Four items remain `SOURCE`** — mains flex cores,
  ferrules, earth bond, breather plug — and **all four are enclosure-side, so
  none blocks groundwork.** ⚠️ Still unverified: the 15 m has not been walked
  with a tape against the SW-patio-corner-to-valve-box run.
- **Nothing in this repo mentions winterisation**, and the spray bodies bought
  are the `-CV` variant that deliberately holds water in the head.
- Several **free physical checks** must happen before anything is buried —
  thread dry-fit, liner test, throw test. See the register.
