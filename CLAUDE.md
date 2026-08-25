# Petrichor — project notes for Claude Code

ESP32 + ESPHome irrigation controller. Electrical/firmware side is built and
proven; see `specs/build-guide.md` and `docs/wiring-and-cable-grades.md`.

## Active hand-off

**Read `docs/outstanding-to-complete-build.md` first** — the consolidated
register of everything still needed to get from "proven on the bench" to
"installed and running". `docs/plumbing-rebuild.md` carries the water-side
reasoning and part evidence behind it.

Status as of 2026-08-25:

- **Water side is ordered.** EGI144331 (£218.96) placed — 2 valves, 3 spray
  bodies, 4 MP3500 nozzles, all fittings, a second MDPE coil. Arrives Wed 26th.
  A second basket (manifold, caps, bush — £43.27) is built and ready to place.
- **⛔ The electrical side is NOT installable.** `CLAUDE.md` previously said it
  was "built and proven" — true of the bench, but **six items in the wiring BOM
  are still marked `SOURCE`**, including the **field cable to the manifold**.
  Without that the controller cannot reach the valves.
- **Nothing in this repo mentions winterisation**, and the spray bodies bought
  are the `-CV` variant that deliberately holds water in the head.
- Several **free physical checks** must happen before anything is buried —
  thread dry-fit, liner test, throw test. See the register.
