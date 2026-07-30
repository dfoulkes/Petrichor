# Petrichor — Build Guide (Prototype / Beta)

A step-by-step guide to assembling and testing the irrigation controller, written
to be followed in order on build day. If you're new to this: **read the one rule
first, then just work down the stages, ticking boxes.**

---

## The one rule

**Build in stages, and test each stage before adding the next. Low-voltage first,
mains last, water last of all. Measure before you connect.**

If something misbehaves, you'll know exactly which stage caused it. Never wire the
whole thing together and switch on hoping.

---

## What you need

**Should have arrived (~20 July):**
- [ ] ELEGOO ESP32-WROOM-32 board (30-pin)
- [ ] ELEGOO 8-channel opto relay
- [ ] Mean Well HDR-15-5 (5V DC PSU) · ABB TM15/24 (24V AC transformer)
- [ ] IP65 enclosure · DIN rail · Wago 221s · UK plug→bare-end mains lead
- [ ] Dupont jumper leads · hook-up wire
- [ ] Multimeter · wire strippers

**Arrives Saturday 1 August:**
- [ ] Rain Bird 100-DVF 24VAC valve (needed only for Stage 5D — 5A–5C can be done without it)

**You supply:**
- [ ] A computer (your Arch box) with ESPHome installed ✅ (already done)
- [ ] A **USB-C _data_ cable** — a charge-only cable will NOT flash the board
- [ ] An RCD-protected mains socket to plug into

**Already prepped (nothing to do):**
- ESPHome installed · firmware written & validated · secrets in Infisical · `flash.sh` tested
- **One thing to confirm:** you've restarted since being added to the `uucp` group
  (`groups` should list `uucp`). If not, restart before Stage 2 or the flash will fail on permissions.

---

> ### 📍 Status — 2026-07-26
> **Stages 1–3 complete. Stage 4 half done (5V side only).** Boxes below are ticked to match
> reality, so a few are deliberately left open:
>
> - **1.2 continuity checks** — never separately recorded. The live 5V/3V3 rails were proven in
>   use instead, so this is unticked for honesty, not because anything's wrong.
> - **3.4 "power the ESP32 from USB"** — **skipped on purpose.** Stage 4's 5V side was built
>   first, so Stage 3 ran on **PSU power** throughout. Better order: it sidesteps the USB brownout
>   risk (8 coils ≈ 500–560 mA off USB-5V) entirely. USB stayed unplugged.
> - **3.1 / 3.2** — done, but **not as written.** Relay `VCC`/`GND` come from the **5V Wagos**, not
>   the ESP32's pins, so coil current never crosses the dev board. There is deliberately **no GND
>   wire between the two boards** — both take 0V from the same Wago, which *is* the shared reference.
> - **4.1 DIN rail / 4.2 transformer / 4.5 measurements** — outstanding. Both supplies are loose on
>   the bench, earth is parked in its own Wago bonded to nothing, and the transformer is unwired.
>
> **Evidence** for Stage 3 lives in `evidence/` — two split-screen recordings (HA + camera on the
> board). Verified by frame analysis: correct zone→relay mapping (Zone 1→IN1 … Zone 8→IN8, nothing
> crossed), correct inverted polarity, interlock dropping the older zone after ~500 ms, and fail-off
> dark after a power cycle. PSU output measured **5.081 V**.
>
> ⚠️ **Pin-naming trap:** on this 30-pin DevKit **GPIO16 = `RX2` and GPIO17 = `TX2`** — there are no
> pins marked `D16`/`D17`. Six of the eight are on the top row; only `D13` is on the bottom. `TX0`/`RX0`
> sit right beside them and must be avoided (serial console).

## Stage 1 — Verify the board (5 min, no power)

Dev boards vary, so confirm ours before trusting anything to it.

1. [x] **Read the silkscreen.** Find the pins: `5V` (or `VIN`), a `GND`, and the eight
   we use — `GPIO13, 16, 17, 18, 19, 21, 22, 23`.
2. [ ] **Multimeter continuity test** (set it to the beep/continuity mode):
   - Probe the **USB connector's 5V** and the **`VIN`/`5V` pin** → should **beep** (same rail). ✅
   - Probe **`VIN`** and **`3V3`** → should **NOT** beep directly (the regulator sits between them). ✅
   - *Why:* this confirms you'll feed 5V into the right side of the on-board regulator, not straight onto the 3.3V chip (which would kill it).

---

## Stage 2 — Flash the firmware (USB only, no relay yet)

1. [x] Plug the board into your computer with the **USB-C data cable**.
2. [x] Flash it:
   ```bash
   cd ~/source/GoldenShower/esphome
   ./flash.sh
   ```
   This pulls your Wi-Fi/API secrets from Infisical, flashes, and shreds the temporary
   secrets file automatically. Pick the serial port (`/dev/ttyUSB0`) if prompted.
3. [x] **Adopt it in Home Assistant.** It should appear automatically (Settings →
   Devices → ESPHome discovered). When HA asks for the **encryption key**, paste the
   `api_encryption_key`:
   - Log into `https://infisical.foulkes.cloud` → project **homelab** → env **prod** →
     folder **/Petrichor** → reveal & copy `api_encryption_key`.
4. [x] **Success looks like:** eight switches (`Zone 1`–`Zone 8`) appear in HA. Toggling
   them does nothing physical yet (no relay wired) — you're just proving the brain + Wi-Fi.

*After this first flash, future updates go over Wi-Fi (OTA) — you rarely need USB again.*

---

## Stage 3 — Dry logic test (still USB-powered, NO mains, NO water)

Now connect the ESP32 to the relay board with **dupont leads**:

1. [x] ESP32 `5V` → relay `VCC`
2. [x] ESP32 `GND` → relay `GND`  ← **the shared ground — miss this and nothing works**
3. [x] ESP32 `GPIO13, 16, 17, 18, 19, 21, 22, 23` → relay `IN1 … IN8` (see map below)
4. [ ] Power the ESP32 from **USB** as before.
5. [x] In HA, toggle a switch → you should **hear the relay click** and see its LED. Test all 8.
6. [x] Confirm the safety behaviours:
   - **Interlock:** turn one on → any other on turns off.
   - **Fail-off:** unplug/replug the board → everything comes back **off**.
   - **Polarity:** HA "on" = relay energised (LED on). That's `inverted: true` working.

**If this works, you've basically built the controller** — with zero risk (no mains, no water).

---

## Stage 4 — Power supplies (⚠️ MAINS — the careful stage)

1. [ ] Clip the **HDR-15-5 (5V PSU)** and **ABB transformer** onto the **DIN rail**.
2. [ ] **With the plug OUT of the wall**, wire the mains lead's bare ends via Wagos:
   - brown (Live) / blue (Neutral) / green-yellow (Earth) → **PSU** `L` / `N` / `⏚`
   - brown / blue → **transformer** 230V primary
3. [x] Double-check every connection **by eye and multimeter continuity** before power.
4. [x] Plug into an **RCD-protected socket** (3A fuse in the plug).
5. [ ] **MEASURE before trusting it** (this is why you bought the meter):
   - PSU output → should read **~5V DC**
   - Transformer secondary → **measure across terminals 5 ↔ 7** → should read **~24V AC**
   - ⚠️ **Terminal 6 is a centre tap, not a second winding.** Measure `5–6` or `6–7` and
     you'll read **12V** and think it's broken. There is nothing to join in series — all
     three terminals are brought out from one winding. Take `5 ↔ 7` and you have your 24V.
   - *If `5↔7` reads low:* check `5–6` and `6–7` separately. Both ~11–13V means the winding
     is fine and you're seeing meter/mains tolerance (the valve's window is 21.6–26.4V, so
     22V is in spec). One half near zero is a real fault — find it before building onto it.
6. [x] **Only once those read right:** move the ESP32's power from USB to the PSU —
   PSU `+5V` → board `VIN`, PSU `0V` → board `GND`. **Unplug the USB** (one power source at a time).
7. [x] Confirm the whole thing still runs on DIN power (switches still work in HA).

> ⚠️ **Mains safety.** 230V can genuinely hurt you. Everything downstream of the transformer
> (24V) is safe to handle; the 230V input is not. If you're not confident wiring a plug and
> mains terminals, get a competent person to check this stage before you power it.

---

## Stage 5 — The 24V load side

**Cable: 22 AWG hook-up kit** for everything in this stage. (18 AWG / 0.75 mm² is the *mains*
side only — see `../docs/wiring-and-cable-grades.md`. Field runs out to the valves need
outdoor-rated cable, which is a Stage 6+ problem — 22 AWG is bench only.)

**Find the screws first.** The terminal blocks are completely unlabelled — 24 identical
screws, no silkscreen. See **Relay output terminal map** in the Reference section below.
Short version: board with terminals along the top edge and the `IN1` end of the signal
header on your left, then **`COM` = screws 2, 5, 8, 11, 14, 17, 20, 23** and
**`NO` = screws 3, 6, 9, 12, 15, 18, 21, 24**.

> **Mental model.** Each channel is a single-pole double-throw switch. `COM` is the pole —
> the *only* entry. It lands on `NC` at rest or `NO` when energised. `NC1`/`NO1` are two
> alternative destinations for the same current, **not** stages in a chain, and there is no
> electrical path between channels inside the board. A "block" is plastic, not a circuit:
> `COM1` and `COM2` share a housing but are not connected.

### 5A — Dry contact sweep (no 24V, no valve, no bus)

Do this **before** wiring anything, so a later failure is pinned to the wiring rather than
the relay. Meter on continuity, 24V completely off.

For each channel *n*, probe the middle and right screw of that relay's trio:

| Zone *n* in HA | `COM`–`NO` | `COM`–`NC` |
|---|---|---|
| off | open (OL) | beeps |
| on | beeps, <1 Ω | open |

1. [ ] All 8 channels, **both throws**. Check `COM`–`NC` too — a contact that makes on `NO`
   but never releases `NC` is a relay on its way out, and the valve side would never show it.
2. [ ] Write down anything marginal. A relay that's slow or intermittent now will be a
   mystery fault in a flowerbed later.

### 5B — Build the COM bus

The four blocks are electrically independent — **there is no internal bus.** You build it.

| # | From | To | Screw → screw |
|---|---|---|---|
| 1 | TM15/24 **terminal 5** | COM1 | → **2** |
| 2 | COM1 | COM2 | **2** → **5** |
| 3 | COM2 | COM3 | **5** → **8** *(crosses block gap)* |
| 4 | COM3 | COM4 | **8** → **11** |
| 5 | COM4 | COM5 | **11** → **14** *(crosses block gap)* |
| 6 | COM5 | COM6 | **14** → **17** |
| 7 | COM6 | COM7 | **17** → **20** *(crosses block gap)* |
| 8 | COM7 | COM8 | **20** → **23** |

3. [ ] Build it. **Every jumper skips exactly two screws** — if one of yours spans anything
   else, you've miscounted. The three that hop a block gap want a few mm extra.
4. [ ] **All eight `NC` screws stay empty.** A wire in one means something's wrong.
5. [ ] `COM1` ↔ `COM8` (screw **2** to screw **23**) should beep. That's the bus proven
   independently of the relays.

> **Double-landed screws.** `COM1`–`COM7` each end up with two wires (one arriving, one
> leaving); only `COM8` has one. Fine at this current, but it fails *quietly* — the clamp
> seats on whichever conductor sits proud and the other looks fitted but isn't, killing
> every zone downstream. Twist the pair together before inserting (or use twin-entry
> ferrules), then **tug-test each tail individually**.

### 5C — Live sweep

6. [ ] Run a short 22 AWG **flying lead off terminal 7** with a croc clip. Park the black
   probe on it — that frees a hand for HA, and the lead becomes the valve return in 5D.
7. [ ] Meter on **AC volts**. Red probe onto each `NOn` in turn while toggling that zone.

| | Zone ON | Zone OFF |
|---|---|---|
| **No valve fitted** | solid ~22V AC | **floating garbage** — drifts, changes when you move your hand |
| Valve fitted | solid ~22V AC | ~0V, stable |

**Judge on the on-state only.** With no valve, an open `NO` connects to nothing, so there's
no path to pull it to terminal 7's potential and the meter just reads capacitive coupling.
That wandering off-state number is expected, not a fault.

Never reference the 24V loop to **earth** — the secondary is floating SELV and a
10 MΩ meter input against earth reads meaningless drift.

### 5D — The valve

Three wires. **Do not bus all eight for this** — one valve, one loop.

8. [ ] TM15/24 **terminal 5** → `COM1` (screw **2**)
9. [ ] `NO1` (screw **3**) → valve coil, either lead *(AC — no polarity)*
10. [ ] Valve coil other lead → TM15/24 **terminal 7**
11. [ ] Toggle `Zone 1` in HA → the valve **thunks open**. That's the *entire* chain proven.
    *(No plumbing needed to hear it work — a tap adapter only matters when you want real
    water through it.)*

**Load check:** 0.30 A inrush, 0.19 A holding, coil 42–55 Ω, against the transformer's 15 VA.
One valve at a time is comfortable — the firmware interlock enforces that. Don't gang zones.

> **Things that look like faults but aren't:** turning zone 2 on turns zone 1 off (that's the
> interlock working). Everything going off while you're mid-sweep is the 20-minute per-valve
> backstop or the 5-minute HA watchdog, both by design.

### The full loop, for reference

```
   TM15/24 ┌── term 5 ──► COM bus ──[relay n]──► NOn ──► valve n coil
   secondary│                                                   │
            └── term 7 ◄────────── common ◄─────────────────────┘
                   ▲
                   └── closed inside the transformer winding
```

Eight parallel branches off a shared feed and a shared return; the relay decides which one
is currently a complete ring. The **return is one common** — terminal 7 out to the manifold,
daisy-chained across every solenoid out there, *not* eight wires back to the box. That sets
the field cable core count: **zones + 1**.

---

## Stage 6 — Box it up (only after it all works loose)

1. [ ] Mount the ESP32 + relay on standoffs inside the enclosure (drill the base — the
   GR17016 has no back-plate).
2. [ ] DIN gear on the rail; cables in through glands.
3. [ ] Keep **230V wiring physically separated** from the low-voltage side.
4. [ ] Close the lid. Done — it's a finished thing.

---

## In parallel (any time from the 20th, needs no electronics)

- [ ] **Flow + pressure test.** Screw the gauge on the tap: read **static** pressure (bar),
  then run the tap wide open into a known-volume bucket and time it (**L/min**). Those two
  numbers unlock the nozzle and zone-count decisions.

---

## If something goes wrong

| Symptom | Likely cause / fix |
|---|---|
| Computer doesn't see the board | Charge-only USB cable (use a **data** cable); or you haven't restarted since the `uucp` group add |
| Relays chatter/click at power-on | Wrong GPIO — must be our verified pins (avoids the ESP32 "strapping" pins) |
| Switch is inverted (on = off) | `inverted: true` missing — but it's in the config; re-flash |
| Device never appears in HA | Wi-Fi creds wrong in Infisical, or wrong `api_encryption_key` pasted into HA |
| Valve won't open on 24V | Measure 24VAC at the coil; confirm you're across transformer `5↔7` (not `5–6`/`6–7`, which give 12V); check relay COM↔NO |
| Two zones try to run at once | Interlock not working — check all switches share the interlock group (they do in the config) |
| Transformer reads 12V | You're on the centre tap. Measure **`5 ↔ 7`** |
| One zone works, everything "after" it doesn't | Broken COM bus link. Probe `COM1`↔`COM8`; if dead, bisect. Usually a double-landed screw where only one wire is actually clamped |
| Zone reads volts on `NO` when off | With no valve fitted this is capacitive pickup on a floating open contact — expected. Only a *solid* ~22V with the zone off means a stuck contact |
| Wandering/nonsense 24V readings | You've referenced the meter to **earth**. The secondary is floating SELV — measure against terminal 7, never earth |
| Valve energised whenever controller is off | Wired to `NC` instead of `NO`. All eight `NC` screws should be empty |

---

## Reference

**Zone → GPIO → relay input map**

| Zone | GPIO | Relay IN | Zone | GPIO | Relay IN |
|------|------|----------|------|------|----------|
| 1 | GPIO13 | IN1 | 5 | GPIO19 | IN5 |
| 2 | GPIO16 | IN2 | 6 | GPIO21 | IN6 |
| 3 | GPIO17 | IN3 | 7 | GPIO22 | IN7 |
| 4 | GPIO18 | IN4 | 8 | GPIO23 | IN8 |

**Relay output terminal map**

The screw terminals carry **no markings at all** — 24 identical screws in four blocks of six.
Orient the board with the **terminals along the top edge** and the **`IN1` end of the signal
header on your left** (same view as the ELEGOO datasheet photo), then count screws 1→24 left
to right. Each blue relay cube has exactly three screws above it, in the order `NC · COM · NO`:

| Screw | 1 | **2** | *3* | 4 | **5** | *6* | 7 | **8** | *9* | 10 | **11** | *12* |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| | NC1 | **COM1** | *NO1* | NC2 | **COM2** | *NO2* | NC3 | **COM3** | *NO3* | NC4 | **COM4** | *NO4* |

| Screw | 13 | **14** | *15* | 16 | **17** | *18* | 19 | **20** | *21* | 22 | **23** | *24* |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| | NC5 | **COM5** | *NO5* | NC6 | **COM6** | *NO6* | NC7 | **COM7** | *NO7* | NC8 | **COM8** | *NO8* |

- **COM** = screws 2, 5, 8, 11, 14, 17, 20, 23 — the 24V feed bus
- **NO** = screws 3, 6, 9, 12, 15, 18, 21, 24 — one valve each
- **NC** = screws 1, 4, 7, 10, 13, 16, 19, 22 — **all permanently empty**

Block housings are `J3 · J5 · J4 · J6` left to right (yes, out of order — ignore the
designators). Channels themselves run 1→8 in sequence and trios never straddle a gap.

Verified against `datasheets/ELEGOO_DC_5v_Relay_Module/8-way-relay-datasheet/` — the module
dimension drawing (block→relay mapping) and the optocoupler schematic (`J3` = pins 1–6 =
`NC1, COM1, NO1, NC2, COM2, NO2`, and the `RE1` SPDT contact symbol). Confirm on the bench
with the 5A dry sweep before committing wiring to it.

**Safety behaviours in the firmware:** active-low relay handled · fail-dry on boot and on
lost-HA · one-zone-at-a-time interlock · 20-minute anti-flood auto-off per valve.

**See also:** wiring diagram → `../docs/wiring-diagram.html` · **cable grades →
`../docs/wiring-and-cable-grades.md`** (which conductor is which grade, both ends) ·
firmware → `../esphome/` · datasheets → `../datasheets/`
