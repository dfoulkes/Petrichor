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

**Arrived Friday 8 August** *(ahead of the revised 13 August estimate; originally 1 August)*:
- [x] Rain Bird 100-DVF 24VAC valve (needed only for Stage 5D — 5A–5C can be done without it)

**You supply:**
- [ ] A computer (your Arch box) with ESPHome installed ✅ (already done)
- [ ] A **USB-C _data_ cable** — a charge-only cable will NOT flash the board
- [ ] An RCD-protected mains socket to plug into

**Already prepped (nothing to do):**
- ESPHome installed · firmware written & validated · secrets in Infisical · `flash.sh` tested
- **One thing to confirm:** you've restarted since being added to the `uucp` group
  (`groups` should list `uucp`). If not, restart before Stage 2 or the flash will fail on permissions.

---

> ### 📍 Status — 2026-08-09
> **Stages 1–5 complete. Only Stage 6 (box it up) and the wet test remain.**
>
> Stage 5D closed on 2026-08-09: valve wired to **zone 8**, solenoid energises, coil holds
> ~29.2V with a 0.2V drop from supply, coil slightly warm after 5 minutes. The electrical chain
> is proven end to end. **Valve actuation is NOT proven** — the 100-DVF is pilot-operated and
> cannot open without water pressure, so that is deferred to a wet test. See 5D.
>
> Two things carried forward: the transformer runs ~29V into a 24V coil (bell-transformer
> regulation — expected, documented in Stage 4, not a fault), and the **20-minute thermal soak
> is still outstanding** because the 5-minute HA watchdog cuts the run short.
>
> Left unticked on purpose: **5A.1 / 5A.2** (the meter continuity sweep of all 8 channels was
> never separately recorded — all 8 were proven clicking via HA in Stage 3, and `NO8` conduction
> was proven live in 5C/5D, but the dry `COM`–`NC` sweep wasn't logged) and **5B.4** (`NC` screws
> confirmed empty at build time, not re-verified since). Unticked for honesty, not because
> anything is known to be wrong.
>
> ---
>
> **Earlier status — 2026-07-26.** Stages 1–3 complete, Stage 4 half done (5V side only). Boxes
> below are ticked to match reality, so a few are deliberately left open:
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

1. [x] Clip the **HDR-15-5 (5V PSU)** and **ABB transformer** onto the **DIN rail**.
2. [x] **With the plug OUT of the wall**, wire the mains lead's bare ends via Wagos:
   - brown (Live) / blue (Neutral) / green-yellow (Earth) → **PSU** `L` / `N` / `⏚`
   - brown / blue → **transformer** 230V primary
3. [x] Double-check every connection **by eye and multimeter continuity** before power.
4. [x] Plug into an **RCD-protected socket** (3A fuse in the plug).
5. [x] **MEASURE before trusting it** (this is why you bought the meter):
   - PSU output → should read **~5V DC**
   - Transformer secondary → **measure across terminals 5 ↔ 7** → expect **~29V AC off-load**
     *(measured 29.4V on 2026-08-09)*, settling toward the 24V nameplate as load is applied.
   - ⚠️ **Do not expect 24V here.** The TM15/24 is a **bell transformer** — ABB's own datasheet
     calls it a *"fail safe bell transformer… for loads that call for a discontinuous supply"*.
     That class is deliberately built with high leakage inductance and poor regulation (it's what
     makes them inherently short-circuit-safe), so the **24V nameplate is the full-load figure**.
     Light-load output running ~20% high is designed behaviour, not a fault. The datasheet quotes
     no regulation figure or off-load voltage at all, so there is nothing to check it against —
     ~29V unloaded is simply what this part does.
   - ⚠️ **Terminal 6 is a centre tap, not a second winding.** Measure `5–6` or `6–7` and
     you'll read **12V** and think it's broken. There is nothing to join in series — all
     three terminals are brought out from one winding. Take `5 ↔ 7` and you have your 24V rail.
   - *If `5↔7` reads low:* check `5–6` and `6–7` separately. Both ~14–15V off-load means the
     winding is fine. One half near zero is a real fault — find it before building onto it.
6. [x] **Only once those read right:** move the ESP32's power from USB to the PSU —
   PSU `+5V` → board `VIN`, PSU `0V` → board `GND`. **Unplug the USB** (one power source at a time).
7. [x] Confirm the whole thing still runs on DIN power (switches still work in HA).

> ⚠️ **Mains safety.** 230V can genuinely hurt you. Everything downstream of the transformer
> (24V) is safe to handle; the 230V input is not. If you're not confident wiring a plug and
> mains terminals, get a competent person to check this stage before you power it.
>
> 🌍 **UK supply assumed** — 230V/50Hz to BS 7671 (IEC 60364 family). This stage relies on the
> **5A BS 1362 fuse in the plug** for conductor protection, and on **harmonised cable colours**
> (brown/blue/green-yellow). Neither holds in North America. If you're not on a UK supply, read
> [Regional assumptions](../docs/wiring-and-cable-grades.md#regional-assumptions)
> before this stage — the low-voltage stages are fine anywhere.

---

## Stage 5 — The 24V load side

**Cable: 22 AWG hook-up kit** for everything in this stage. (18 AWG / 0.75 mm² is the *mains*
side only — see `../docs/wiring-and-cable-grades.md`. Field runs out to the valves need
outdoor-rated cable — that's **Stage 7**; 22 AWG is bench only.)

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

3. [x] Build it. **Every jumper skips exactly two screws** — if one of yours spans anything
   else, you've miscounted. The three that hop a block gap want a few mm extra.
4. [ ] **All eight `NC` screws stay empty.** A wire in one means something's wrong.
5. [x] `COM1` ↔ `COM8` (screw **2** to screw **23**) should beep. That's the bus proven
   independently of the relays.

> **Double-landed screws.** `COM1`–`COM7` each end up with two wires (one arriving, one
> leaving); only `COM8` has one. Fine at this current, but it fails *quietly* — the clamp
> seats on whichever conductor sits proud and the other looks fitted but isn't, killing
> every zone downstream. Twist the pair together before inserting (or use twin-entry
> ferrules), then **tug-test each tail individually**.

### 5C — Live sweep

6. [x] Run a short 22 AWG **flying lead off terminal 7** with a croc clip. Park the black
   probe on it — that frees a hand for HA, and the lead becomes the valve return in 5D.
7. [x] Meter on **AC volts**. Red probe onto each `NOn` in turn while toggling that zone.

| | Zone ON | Zone OFF |
|---|---|---|
| **No valve fitted** | solid **~29V AC** *(off-load secondary — see Stage 4)* | **floating garbage** — drifts, changes when you move your hand |
| Valve fitted | solid **~29V AC** *(29.2V measured 2026-08-09)* | ~0V, stable |

**Judge on the on-state only.** With no valve, an open `NO` connects to nothing, so there's
no path to pull it to terminal 7's potential and the meter just reads capacitive coupling.
That wandering off-state number is expected, not a fault.

> **Corrected 2026-08-09 — this table previously said ~22V.** That figure came from a
> measurement taken on 2026-08-01 with no valve fitted, and it was wrong. An unloaded floating
> SELV winding seen through a 10 MΩ meter input doesn't give you a voltage, it gives you
> whatever capacitive coupling produces. The same session also threw a 33V phantom on an open
> contact. Once a real load (the ~108 Ω coil at 50 Hz) was in circuit, supply and coil read
> **29.4V and 29.2V** — consistent with each other and with the bell-transformer regulation
> described in Stage 4. **Do not treat any off-load reading here as a measurement.**

**That 0.2V delta is the real prize.** Supply-side minus coil-side is the total drop across the
relay contact and every joint in the loop. Tenths of a volt means the `NO` contact conducts, the
COM bus is continuous end to end, and there are no high-resistance joints. Whole volts means go
hunting. This single comparison proves more than the absolute number ever will.

Never reference the 24V loop to **earth** — the secondary is floating SELV and a
10 MΩ meter input against earth reads meaningless drift. Both probes stay on the same
low-voltage loop. There is no "live" and "neutral" on an AC secondary to get right.

### 5D — The valve

Three wires. **One valve at a time** — the COM bus from 5B stays, but only ever one solenoid
is connected and only ever one zone energised. (The firmware interlock enforces this anyway.)

Worked here on **zone 8**, which is the useful choice: with the bus already built, feeding
`COM1` and taking the output from `NO8` forces the current through all seven jumper links, so
it proves the whole bus as a side effect. Substitute your own zone's `NO` screw if you prefer —
`NO` = screws 3, 6, 9, 12, 15, 18, 21, 24.

8. [x] TM15/24 **terminal 5** → `COM1` (screw **2**) — already in place from 5B
9. [x] `NO8` (screw **24**) → valve coil, either lead *(AC — no polarity; the two leads are
   identical white-with-black-stripe for exactly this reason)*
10. [x] Valve coil other lead → TM15/24 **terminal 7**
11. [x] Toggle `Zone 8` in HA → the solenoid **hums** and the coil warms slightly. That is the
    electrical chain proven end to end.

> ### ⚠️ It will NOT "thunk open" on a dry bench — and that is not a fault
>
> **Corrected 2026-08-09.** This step used to promise an audible open/close with no plumbing.
> That was wrong and can never pass dry. The 100-DVF is a **pilot-operated diaphragm valve**:
> the solenoid does not shift the main valve, it vents a pilot chamber and lets *water pressure*
> move the diaphragm. With no water, the plunger travels about a millimetre and nothing else
> happens. Actuation can only be proven wet.
>
> **What a dry bench *can* prove**, and what to accept as a pass:
> - solenoid hums when the zone is energised, and the hum is localised to the valve body
> - coil voltage steady and repeatable under load (~29V here)
> - supply-to-coil volt-drop in the tenths, not volts (see 5C)
> - coil only **slightly warm** after a few minutes — a plunger that failed to seat would be
>   uncomfortably hot inside two minutes, so mild warmth is the evidence it pulled in and is
>   sitting on holding current rather than stuck at inrush
>
> The manual bleed lever on the valve body (marked `ON`/`OFF`) opens it mechanically without the
> solenoid — useful for proving the valve body is sound independently of the electrics, once
> water is involved.

**Load check:** datasheet gives 0.30 A inrush / 0.19 A holding, coil 42–55 Ω — but those are
**60 Hz** figures. On UK 50 Hz reactance is lower and it runs nearer **0.34 A / 0.22 A**; at the
~29V this transformer actually delivers, closer to **0.27 A** holding. Against 15 VA that is
roughly 43% load, and one valve at a time is comfortable — the firmware interlock enforces that.
Don't gang zones.

> **Things that look like faults but aren't:**
> - **The solenoid hums.** Expected, and it will hum more than you think. An AC coil is dragged
>   at twice mains frequency (100 Hz on 50 Hz), and this one is a 60 Hz-rated coil fed ~29V from
>   a bell transformer — over-voltage and under-frequency both push current up. Hum is a sign it
>   is energised, not a sign it is unhappy. Judge it on temperature, not noise.
> - Turning zone 2 on turns zone 1 off — that's the interlock working.
> - Everything going off while you're mid-sweep is the 20-minute per-valve backstop or the
>   5-minute HA watchdog, both by design. A run that stops dead at exactly five minutes is the
>   watchdog, not a failure — and note you cannot do a 20-minute thermal soak without lifting it.
> - Off-load voltage readings that wander, or read higher than the 24V nameplate. See 5C.

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

**Plan the base layout and drill the box empty.** Both penetrations below want the bottom face,
and swarf inside a box full of electronics is a problem you only make once.

1. [ ] **Decide the mounting orientation first.** The condensation drain must sit at the box's
   *true lowest point as mounted* — get this wrong and it's a water trap instead of a drain.
   Pick the **shadiest viable spot** while you're at it — see the UV note (step 4).
2. [ ] **Drill the 230V cable entry — fit a gland, not a bare hole.** A plain hole voids IP65 and
   gives the mains lead no strain relief. Size the gland to the lead's outer diameter — **measure
   it**: the WEMNO **M16** glands already on hand seal 3–8 mm, which covers a typical 3-core flex;
   step up to **M20** only if the lead measures over 8 mm. Enter through a **bottom or lower-side
   face** so water runs off rather than tracking in along the cable sheath.
3. [ ] **Fit a vented drain in the base.** ⚠️ Also *not* a drilled hole — use an **IP-rated
   vented drain plug / pressure-equalisation breather** (M12–M16 type). It does two jobs: lets
   liquid water out, and equalises pressure so the box doesn't inhale moist air every time it
   heats and cools. An unvented sealed box in a garden is a condensation generator.
4. [ ] **UV & heat — treat the box while it's empty.** This one lives in **full sun**, and the
   GR17016 is grey **ABS**, which chalks and goes brittle under years of UK UV. Do this before the
   electronics go in (mess, fumes). Order of preference:
   - **Shade first, it's free.** A small hood/sunshade or mounting under an overhang cuts UV *and*
     the internal heat that eats cable-insulation margin (see cable grades). Do this regardless.
   - **If painting:** scuff + degrease, a **plastic-adhesion primer** (bare ABS sheds ordinary
     paint), then a UV-stable exterior topcoat in a **light colour** — white/light grey. **Never
     dark:** dark paint bakes the box and makes the 50–60 °C internal problem worse.
   - **Paint is UV/appearance only — it is not the waterproofing.** IP65 comes from the lid gasket,
     the gland and the breather. So **keep paint off the lid sealing faces and off the breather/drain.**
   - This is a prototype box; the long-term fix is a UV-stable polycarbonate/GRP enclosure. Reassess
     after a season in the sun.
5. [ ] Mount the **ESP32 and relay** — ESP32 on its DIN carrier, relay on a DIN mount. The
   GR17016 has **no back-plate**, so anything not on the rail is drilled directly into the base.
6. [ ] **DIN gear on the rail**, spacers between the transformers.
7. [ ] **Tidy the 5V wiring** — ferrules on stranded tails, routed and secured.
8. [ ] Keep **230V wiring physically separated** from the low-voltage side.
9. [ ] Close the lid. Done — the box is finished, but the system isn't: power, field cable and the
   valves are **Stage 7**, water is **Stage 8**.

> **Why the vent matters more than it sounds.** IP65 keeps water *out*, but it also keeps water
> *in*. A sealed box that warms in the sun and cools overnight pumps humid air in through any
> imperfect seal and then condenses it on the coldest surface — usually your electronics. The
> breather is what stops that cycle. It is not optional kit on an outdoor enclosure.

---

## Stage 7 — Out to the garden (power in, signal out)

The box is proven and sealed; now connect it to the world. Both runs here are **short (<10 m)**,
which makes the electrical side easy — the work is all about **weather**, not distance.

### 7A — A weatherproof outdoor supply

1. [ ] Feed the box from an **RCD-protected outdoor socket**. MVP: plug the existing UK
   plug→bare-end lead into an **IP66 weatherproof socket enclosure** on an existing RCD circuit —
   the lead enters the box through its Stage 6 gland.
   > ⚠️ A *permanent* outdoor spur is **BS 7671 work for a competent person**. The plug-in
   > weatherproof-socket route keeps the prototype on the right side of that line. UK supply
   > assumed throughout — see [Regional assumptions](../docs/wiring-and-cable-grades.md#regional-assumptions).

### 7B — The field cable (box → manifold)

2. [ ] Run **one outdoor/UV-rated multicore** from the box out to the manifold. **Cores = zones + 1**
   (one per valve + one shared common) — *not* zones × 2. At <10 m and ~0.3 A per valve,
   **0.5–0.75 mm² is ample**; volt-drop is negligible, especially at the ~29 V this transformer
   delivers. This is the cable the old Stage 5 note left "not specified" — it is now specified.
3. [ ] If buried, use **direct-burial-rated cable or run it in a duct**, and leave a **drip loop**
   at both ends. The 24 V loop is **SELV — safe to handle** — so the rating here is about water, UV
   and abrasion, not shock.

### 7C — The valve box (in-ground manifold chamber)

4. [ ] Set an **in-ground valve box** on a **gravel base** (drainage), sized for the manifold plus
   **hand access and cable slack**. It houses: the **double-check valve** (backflow prevention to
   the tap — a must-have *and* a UK water-regs requirement), the manifold, and the 24 V solenoid(s).
5. [ ] ⚠️ **Waterproof every connection — this is the bit that bites.** Valve boxes flood. The
   solenoid coils don't care; **bare joints do.** Use **gel-filled / IP68 connectors** (gel
   Scotchloks, resin, or waterproof crimp + adhesive heatshrink) at every solenoid. **Never a dry
   Wago in the ground.** This is the single most failure-prone spot in the whole build.
6. [ ] Wire the return as **one common daisy-chained across the solenoids** at the manifold
   (terminal 7 out, hopping valve to valve), with **one individual conductor per valve** back to its
   `NO`. That's the "zones + 1" core count in the flesh.

> Plumbing order at the manifold: **tap → double-check valve → (low-flow filter) → manifold →
> solenoids → zones.** The filter is cheap insurance for the drip line and rotary nozzles.

### 7D — Pipe size & the NPT/BSP thread trap

7. [ ] **Feed pipe: 3/4" / 20 mm.** At the measured **19 L/min** that's ~**1.5 m/s** — under Rain
   Bird's **2.3 m/s** water-hammer cap. 1/2" runs ~2.2 m/s (too fast); 1" is needless — the **tap
   and supply are the throttle, not the pipe**. The 1" valve is oversized for ~5 gpm (loss ~0.17 bar),
   which is fine — oversized means low loss and less hammer.
8. [ ] ⚠️ **Mind the thread standard — the valve is NPT, your tap is BSP.** The 100-DVF's standard
   threaded ports are **1" female NPT** (FNPT), and the unit on hand is US-market ("Assembled in
   Mexico"), so it is **NPT, not** the BSP special-order variant. UK taps and pipe are **BSP**.
   **NPT and BSP do not seal** (NPT 11.5 TPI / 60° taper vs BSP 11 TPI / 55°) — a BSP male bites two
   turns into the NPT female, then weeps or cracks the plastic body.
9. [ ] **Bridge with transition adapters:** a **1" MNPT × 3/4" BSP** adapter into **each** valve port
   (inlet + outlet), PTFE tape or anaerobic sealant. Everything downstream is then plain BSP.
   *Confirm before buying:* NPT female is visibly **tapered** (thread shallows toward the mouth); a
   thread gauge settles any doubt.

> Full plumbing chain: **tap (3/4" BSP M) → 3/4" DCV → 3/4"/20 mm pipe → [1" MNPT×3/4" BSP adapter]
> → valve (1" FNPT) → [adapter] → 3/4" to the zone.** *(Values from
> `../datasheets/100-DVF_RainBird_solenoid-valve.pdf`.)*

---

## Stage 8 — Water & commissioning (⚠️ WATER — last of all)

This is where "water last of all" finally lands. **Do one zone end to end before building the rest.**

**The numbers that drive this** (flow/pressure test, 2026-07-20): **~3.8 bar static, ~19 L/min.**
Pressure is comfortably in band; **flow is the constraint** — a classic single-domestic-tap throttle.

### 8A — Nozzles: low-flow rotaries, not fixed sprays

1. [ ] Fit **low-flow rotaries** (Hunter MP Rotator / Rain Bird R-VAN), ~1.5–3 L/min each. Within
   the ~15 L/min working budget (~80 % of measured flow) that's **~5–8 heads per zone**; fixed
   sprays are thirsty and you'd fit only 2–3. Rotaries also give better uniformity and matched
   precipitation. Corner-mounted, **facing inward** (as decided), they cover the 11 × 14 m plot.

> This **revises two earlier decisions** — "fixed spray nozzles" → rotaries, and "one nozzle at a
> time" → **one *zone* at a time**. The flow numbers made the call; see README **Decisions**.

### 8B — Zones: fewer than you think

2. [ ] The interlock already runs **one zone at a time**, and low-flow rotaries mean the **four
   corners (~4 × 2.5 ≈ 10 L/min) fit in a single zone.** So the MVP is **~2 zones**, not 8:
   - **HP:** the corner rotary ring (README's self-back-feeding **circular loop** equalises pressure across the heads).
   - **LP:** a **drip line** for the 4 hanging baskets — needs a **pressure reducer (~1–1.5 bar) + filter**.
   The 8-channel relay is then **expansion headroom**, not a target to fill.
3. [ ] ⚠️ **Verify dynamic sag before trusting a grouped zone.** Running 4 heads together depends on
   pressure holding *under flow*, which is **not yet measured** (the gauge that arrived is dead-end).
   **Tee an inline gauge** (~£5–10) and confirm the zone holds **≥ ~2.75 bar under ~10 L/min**.
   **Fallback:** split HP into **two zones of two corners** — the interlock and the spare relay
   channels make that free.

### 8C — Commission one zone, end to end

4. [ ] **Wet-test one valve** — the actuation deferred from Stage 5D. With water on, energise the
   zone: the pilot-operated diaphragm should **open and flow**. The manual **bleed lever** proves the
   valve body independently of the electrics.
5. [ ] Re-check the **supply-to-coil volt-drop in tenths** (Stage 5C method) with the field run in
   circuit — that proves the cable and every gel connector under real load.
6. [ ] Confirm the **dynamic pressure** read (8B), then **add the drip/LP zone**. Subdivide the HP
   ring into more zones **only if** the sag test demands it.

---

## In parallel (any time from the 20th, needs no electronics)

- [x] **Flow + pressure test** *(done 2026-07-20)*. Static **~3.8 bar / 55 psi** (dead-end gauge,
  tap fully open); flow **~19 L/min** (14 L in 44.17 s, wide open). Pressure is not the
  constraint — **flow is**. Those numbers drove the Stage 8 nozzle/zone decisions (low-flow
  rotaries, ~2 grouped zones run sequentially).
  - [ ] **Dynamic pressure (sag under flow)** — *still outstanding*. The gauge that arrived is
    single-ended and reads only with no flow. Tee it inline (~£5–10) to get working pressure; needed
    before committing to a grouped multi-head zone (Stage 8B).

---

## If something goes wrong

| Symptom | Likely cause / fix |
|---|---|
| Computer doesn't see the board | Charge-only USB cable (use a **data** cable); or you haven't restarted since the `uucp` group add |
| Relays chatter/click at power-on | Wrong GPIO — must be our verified pins (avoids the ESP32 "strapping" pins) |
| Switch is inverted (on = off) | `inverted: true` missing — but it's in the config; re-flash |
| Device never appears in HA | Wi-Fi creds wrong in Infisical, or wrong `api_encryption_key` pasted into HA |
| Valve won't open on 24V | Measure AC volts at the coil (expect ~29V, not 24 — see Stage 4); confirm you're across transformer `5↔7` (not `5–6`/`6–7`, which give 12V); check relay COM↔NO. **Dry on the bench it will never open** — it's pilot-operated, see 5D |
| Valve hums but "does nothing" | Almost certainly correct behaviour. Hum = energised; dry = cannot actuate. Confirm with coil volts + slight warmth, then judge it wet |
| Coil gets hot fast (too hot to touch inside ~2 min) | Plunger not seating, so it stays at inrush current. Check coil volts under load and for mechanical obstruction. Slight warmth is normal |
| Transformer reads ~29V, not 24V | Expected. Bell transformer, poor regulation by design, nameplate is the full-load figure. Not a fault — see Stage 4 |
| Two zones try to run at once | Interlock not working — check all switches share the interlock group (they do in the config) |
| Transformer reads 12V | You're on the centre tap. Measure **`5 ↔ 7`** |
| One zone works, everything "after" it doesn't | Broken COM bus link. Probe `COM1`↔`COM8`; if dead, bisect. Usually a double-landed screw where only one wire is actually clamped |
| Zone reads volts on `NO` when off | With no valve fitted this is capacitive pickup on a floating open contact — expected. Only a *solid* ~29V with the zone off means a stuck contact |
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
