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
   Pick the **shadiest viable spot** while you're at it — see the UV note (step 5).
2. [ ] **Drill the 230V cable entry — fit a gland, not a bare hole.** A plain hole voids IP65 and
   gives the mains lead no strain relief. Size the gland to the lead's outer diameter — **measure
   it**: the WEMNO **M16** glands already on hand seal 3–8 mm, which covers a typical 3-core flex;
   step up to **M20** only if the lead measures over 8 mm. Enter through a **bottom or lower-side
   face** so water runs off rather than tracking in along the cable sheath.
   > ⚠️ **The M16 fits the *supplied* lead, not its outdoor replacement.** If/when the lead is swapped
   > for **H07RN-F `3G1.0`** (7A step 3), that cable is **8.3–10.7 mm** OD — entirely above the M16's
   > 8 mm ceiling — so the swap **requires an M20**. Not a measure-on-the-day call for that cable.
   >
   > ⛔ **SUPERSEDED IN PART, 2026-09-06 — the cable bought is `3183P` 1.5 mm², not H07RN-F.** The
   > **conclusion is unchanged and now settled**: the bought lead is **~9.75 mm** ⚠ OD, the fitted
   > **WEMNO M16 seals 3–8 mm**, so **its seal never compresses on the sheath at all.** This is not
   > a "tight fit" to be got away with — it is *no seal*. The **M20 has been bought** (Vimark
   > `651VT`). **See step 3: fitting it is now a drilling job on a finished box.**
   > ⚠️ **`651VT`'s own clamping range is not recorded in this repo** — read the packet against the
   > calipered cable before you cut anything, or you repeat the M16 mistake one size up.
3. [ ] ⛔ **Enlarge the mains entry from M16 to M20 — added 2026-09-06. This is a drilling job on
   an already-built and wired box.** The M20 gland cannot go into the M16 hole; the entry has to be
   opened out from roughly **16.5 mm to roughly 20.5 mm**.

   > ⚠️ **Those two figures are INFERRED from the metric gland thread designations, not read from a
   > datasheet.** M16 and M20 are thread sizes, not hole sizes, and manufacturers vary. **Caliper
   > the existing hole first** and size the cut from what you actually measure.

   - **Tool: a step drill / cone cutter**, not a twist bit. A twist bit in thin ABS grabs, snatches
     the panel and triangulates the hole — and a triangulated hole does not seal.
   - ⛔ **Swarf near electronics is the real risk, not the hole.** **Remove the board and both PSUs
     from the box, or fully shroud them,** before the cutter touches plastic. ABS swarf is light,
     statically clingy and gets everywhere; a chip bridging relay terminals or PSU pins is a fault
     you will chase for a evening.
   - **Support the panel from behind** while cutting, go slow, and **let the step do the work** —
     each step should cut a clean shoulder, not melt one.
   - **Clear every last chip before re-sealing** — vacuum, then a wipe. Then refit the gland,
     check the lid gasket seats, and confirm the entry is still on a **bottom or lower-side face**.
   - ⚠️ **The redundant M16 hole does not exist** — you are enlarging the same hole, not making a
     second one. If the M20 is put somewhere new instead, **the old M16 hole must be blanked with
     an IP-rated blanking plug**, or IP65 is gone.

   > 📌 **Decision, 2026-09-06 — Dan chose the drilling route knowingly.** Step 7A step 3 offers
   > *"or sleeve in conduit"*, which needs **no drilling at all** and was put to him. He chose the
   > cable-and-gland swap with his eyes open. **Recorded, not re-argued.**

4. [ ] **Fit a vented drain in the base.** ⚠️ Also *not* a drilled hole — use an **IP-rated
   vented drain plug / pressure-equalisation breather** (M12–M16 type). It does two jobs: lets
   liquid water out, and equalises pressure so the box doesn't inhale moist air every time it
   heats and cools. An unvented sealed box in a garden is a condensation generator.
5. [ ] **UV & heat — treat the box while it's empty.** This one lives in **full sun**, and the
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
6. [ ] Mount the **ESP32 and relay** — ESP32 on its DIN carrier, relay on a DIN mount. The
   GR17016 has **no back-plate**, so anything not on the rail is drilled directly into the base.
7. [ ] **DIN gear on the rail**, spacers between the transformers.
8. [ ] **Tidy the 5V wiring** — ferrules on stranded tails, routed and secured.
9. [ ] Keep **230V wiring physically separated** from the low-voltage side.
10. [ ] Close the lid. Done — the box is finished, but the system isn't: power, field cable and the
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
   plug→bare-end lead into a **weatherproof socket enclosure** on an existing RCD circuit —
   the lead enters the box through its Stage 6 gland.
   > ⚠️ A *permanent* outdoor spur is **BS 7671 work for a competent person**. The plug-in
   > weatherproof-socket route keeps the prototype on the right side of that line. UK supply
   > assumed throughout — see [Regional assumptions](../docs/wiring-and-cable-grades.md#regional-assumptions).
   > **The plug itself carries no IP rating and is not meant to** — a moulded BS 1363 plug never
   > does. The sealing is the enclosure's job.
2. [ ] ⚠️ **The enclosure actually bought is IP54, not IP66.** A **RESTMO weatherproof box**
   (Amazon 206-6337738-2459509, 2026-09-06) — **IP54 is splashing water only**, a weaker claim than
   the IP66 this step originally assumed. That makes mounting load-bearing rather than incidental:
   - **Wall-mount it vertically. Not on the ground** — ground-sited it meets bouncing rain, puddles
     and leaf litter, which is where IP54 runs out.
   - **Cable entries pointing down**, with a **drip loop** in the lead before each entry.
   - **Out of direct run-off** — not under a gutter join or a dripping sill.
3. [ ] ⚠️ **The lead between socket and box is indoor-grade flex.** Supplied H05VV-F ⚠ is PVC —
   fine short-term and not a shock risk, but it chalks and cracks under UV over seasons. Replace it
   with **rubber flex** — ✅ **`3183P` 3-core 1.5 mm² is bought and waiting at Horsforth**
   *(see the BOUGHT block below)* — or sleeve in conduit once this stops being a prototype. Full
   reasoning: [The external lead](../docs/wiring-and-cable-grades.md#the-external-lead--the-run-nobody-specified).
   *(This line previously said* **H07RN-F `3G1.0`** *— superseded 2026-09-06, kept in the
   correction blocks below.)*
   > ⛔ **Corrected 2026-09-06 — ask for `3G1.0`, not 0.75 mm².** This step previously said
   > *"H07RN-F ... 0.75 mm²"*. **H07RN-F is not made in 3-core 0.75 mm²** — the smallest 3-core is
   > **1.0 mm²**. 0.75 mm² rubber flex is **H05RN-F** (300/500 V), a lighter cable a voltage class
   > down, and not the outdoor upgrade intended here.
   > ⚠️ **And it needs a bigger gland than the one owned.** `3G1.0` is **8.3–10.7 mm** OD; the
   > **WEMNO M16** fitted at Stage 6 step 2 seals **3–8 mm**. The lead swap therefore carries an
   > **M20 gland** with it — the whole OD range is above the M16 ceiling, so step 2's *"step up only
   > if the lead measures over 8 mm"* is already decided for this cable. Buy the two together.
   > **Evidence class: manufacturer catalogue (Lapp), verified** — corroborated by Eland Cables and
   > FS Cables. Not a seller listing.

   > ✅ **BOUGHT 2026-09-06 — and it is `3183P`, not H07RN-F. This paragraph is now history.**
   > **Screwfix order `A27859275166`**: `994JY` **Time `3183P` black 3-core 1.5 mm², 10 m coil**
   > £19.99 · `651VT` **Vimark M20 nylon comp gland** 2-pack £1.35 · `68744` **Essentials 13 A
   > fused heavy-duty plug** £1.69. **£23.03 inc VAT**, Click & Collect Horsforth.
   > *Evidence class: Screwfix order confirmation, verified.*
   >
   > ⛔ **Do not describe the lead as H07RN-F.** Screwfix state the conductors are **"rated
   > 300/500 V"** — that is the **H05RN-F class**; the `07` in H07RN-F *means* 450/750 V. The
   > correct description is **"3183P rubber flex (PCP sheath), 300/500 V class"**.
   > ✅ **It is the right cable anyway:** the requirement here was always **a rubber sheath instead
   > of PVC**, not a voltage class. Screwfix's own words — *"the durable rubber sheath resists
   > weather, UV exposure and moisture degradation"*, sold for *"pond pumps and other outdoor
   > cabling applications"*, **−35 °C to +60 °C**. On 230 V behind the **3 A fuse now fitted**
   > (2026-09-07 — see below), 450/750 V buys even less than it did against the 5 A this line
   > originally cited.
   >
   > **Three things this changes about the job:**
   > 1. ⛔ **The box entry must be drilled out M16 → M20** — the bought lead is ~9.75 mm ⚠ and the
   >    fitted M16 seals 3–8 mm, so it does not seal *at all*. **Stage 6 step 3.**
   > 2. ✅ **The coil is bare-ended, so the plug is a separate part** — that is what `68744` is
   >    for. **It shipped with a 13 A fuse; a 3 A fuse is now fitted (2026-09-07)**, tighter than
   >    the 5 A this step previously called for. HDR-15-5 typical AC input current is 0.25 A at
   >    230 VAC *(datasheet, verified)* — ample headroom over the actual load, and every
   >    cable-protection argument this guide rests on gets stronger, not weaker, at 3 A. ⚠️ **Only
   >    open risk: nuisance-blowing on cold start** — datasheet inrush is 45 A cold-start, and the
   >    rig has already bench-tested clean through a 5 A fuse *(bench evidence, verified)*, which
   >    reduces but does not close the risk at 3 A. If it ever blows on power-up, step to **5 A —
   >    never back to the 13 A it shipped with**, now a spare.
   > 3. ⚠️ **10 m bought against ~2 m needed.** The surplus is not spare tri-rated wire — 3183P
   >    core temperature class is **not sourced**, so it does **not** substitute for the internal
   >    wiring this guide asks to be re-done in tri-rated.
   >
   > ⚠️ **Before cutting the old lead up for cores, read its sheath printing.** It settles whether
   > it was ever H05VV-F, which this repo has only ever inferred. **Free, and destroyed by the
   > cut.** See `wiring-and-cable-grades.md` → *Before you touch the 230 V side*.

### 7B — The field cable (box → manifold)

4. [ ] Run **one outdoor/UV-rated multicore** from the box out to the manifold. **Cores = zones + 1**
   (one per valve + one shared common) — *not* zones × 2. At <10 m and ~0.3 A per valve,
   **0.5–0.75 mm² is ample**; volt-drop is negligible, especially at the ~29 V this transformer
   delivers. This is the cable the old Stage 5 note left "not specified" — it is now specified.
5. [ ] If buried, use **direct-burial-rated cable or run it in a duct**, and leave a **drip loop**
   at both ends. The 24 V loop is **SELV — safe to handle** — so the rating here is about water, UV
   and abrasion, not shock.

### 7C — The valve box (in-ground manifold chamber)

6. [ ] Set an **in-ground valve box** on a **gravel base** (drainage), sized for the manifold plus
   **hand access and cable slack**. It houses: the **double-check valve** (backflow prevention to
   the tap — a must-have *and* a UK water-regs requirement), the manifold, and the 24 V solenoid(s).

> ⛔ **CUT THE PIPE ENTRIES AS U-NOTCHES OPEN TO THE BOTTOM RIM — NOT CLOSED HOLES.**
> **A one-way decision, taken at cut time.** The pipe crosses the wall horizontally. With a
> **closed hole**, lifting the box drives the hole's lower edge into the pipe and it jams after
> ~15 mm — **the box is trapped for the life of the install**, and since the manifold will not
> pass up through the lid throat either, the manifold then only comes out by cutting pipe. With a
> **U-notch open to the bottom rim**, the box lifts vertically clean off over the pipework.
> **The notch costs nothing: a valve box has no floor** — it is an open-bottomed tapered tub on
> gravel, so a slot up from the bottom edge opens nothing that is not already open to the ground.
> ~**120 mm tall × 30 mm wide**, cut **oversize** so the adaptor hex nests in the aperture; deburr
> so it cannot chafe the pipe. Detail: `../docs/build-work-plan.md` Phase B ·
> `../docs/plumbing-rebuild.md` *Pipe entry* · vault decision #18.
7. [ ] ⚠️ **Waterproof every connection — this is the bit that bites.** Valve boxes flood. The
   solenoid coils don't care; **bare joints do.** Use **gel-filled / IP68 connectors** (gel
   Scotchloks, resin, or waterproof crimp + adhesive heatshrink) at every solenoid. **Never a dry
   Wago in the ground.** This is the single most failure-prone spot in the whole build.
8. [ ] Wire the return as **one common daisy-chained across the solenoids** at the manifold
   (terminal 7 out, hopping valve to valve), with **one individual conductor per valve** back to its
   `NO`. That's the "zones + 1" core count in the flesh.

> Plumbing order at the manifold: **tap → double-check valve → (low-flow filter) → manifold →
> solenoids → zones.**
> ⚠️ **RESTATED 2026-09-07 — the filter is NOT a V1 part.** *(Superseded 2026-08-31: "the filter is
> **mandatory** now the beds are drip-irrigated — emitter clogging is the main failure mode of any
> drip system." **That is the V2 case.**)* **V1 is rotaries:** Hunter condition primary filtration on
> **dirty water**, each MP Rotator carries a **removable inlet filter screen**, and the `100-DV` has
> a built-in **90-mesh (200 micron)** element *(manufacturer datasheets, verified)*. ⚠️ **Not
> established as required for V1** — a manufacturer-backed inference, not a ruling. **It returns with
> V2's dripline; see 8D-V2 for mesh size and ordering.** ⛔ **And do not fit the drip zone's ~1.5 bar
> reducer anywhere upstream of the rotary heads — the PRS40 bodies regulate to 2.8 bar and 1.5 bar
> starves them.**

### 7D — Pipe size & the thread standard (BSP — check yours)

9. [ ] **Feed pipe: 3/4" / 20 mm.** At the measured **19 L/min** that's ~**1.5 m/s** — under Rain
   Bird's **2.3 m/s** water-hammer cap. 1/2" runs ~2.2 m/s (too fast); 1" is needless — the **tap
   and supply are the throttle, not the pipe**. The 1" valve is oversized for ~5 gpm (loss ~0.17 bar),
   which is fine — oversized means low loss and less hammer.
10. [ ] ⚠️ **Check which thread standard your valve is — the 100-DVF ships in both.** The datasheet
    makes it a specify-on-order option ("*Available with BSP threads*"; "*necessary to specify NPT or
    BSP thread type*"). **This build's valve is BSP** — the Amazon order confirmation of 2026-07-19
    reads verbatim *"Rain Bird 100-DVF, **1 inch BSPF** 24vac Solenoid Valve"* — so its ports are
    **1" BSP female** and mate straight into UK pipe.
    **Do not infer the standard from where it was assembled.** An earlier revision of this guide
    concluded "NPT" from an "Assembled in Mexico" moulding and specified £7.49 hydraulic transition
    adapters. That was **wrong** — Rain Bird build both variants there. Country of origin carries no
    thread information. **Trust the order confirmation or a test fit; nothing else.**
11. [ ] **Fit a plain reducing bush per port:** **1" BSP male × 3/4" BSP female** into **each** valve
    port (inlet + outlet), PTFE tape. ~£2 each (Screwfix Flomasta 28333, Toolstation, HydroSure).
    Everything downstream is then plain 3/4" BSP.
12. [ ] **Verify on assembly.** A BSP bush should thread **smoothly and keep going**. If it **binds
    hard after ~2 turns**, you have the NPT variant after all — fall back to a **1" NPTF male × 3/4"
    BSP female bush** (e.g. Hydraulic Megastore 16360, £7.49).

> ⚠️ **Why this is worth two minutes:** at 1" the two standards are within **0.05 mm** on major
> diameter (33.2 vs 33.25 mm) and differ only in pitch and flank angle (**NPT** 11.5 TPI / 60°
> tapered · **BSP** 11 TPI / 55°). A mismatch therefore *feels correct* for about two turns, then
> weeps or **cracks the plastic body**. **No rule-and-eye measurement can separate them** — only the
> paperwork or a test fit.

> Full plumbing chain: **tap (3/4" BSP M) → 3/4" DCV → 3/4"/20 mm pipe → [1" BSP M × 3/4" BSP F
> bush] → valve (1" BSP F) → [bush] → 3/4" to the zone.** *(Values from
> `../datasheets/100-DVF_RainBird_solenoid-valve.pdf`.)*

---

## Stage 8 — Water & commissioning (⚠️ WATER — last of all)

> ## ⛔ RE-SCOPED 2026-09-07 — READ THIS BEFORE ANY OF STAGE 8
>
> **Dan ruled** *(vault decision **#25** — the vault is the source of truth for decisions)*:
>
> > **"V1 = sprinklers installed, working, trenched and piped. (beds) both zone 1 and zone 2."**
> > **"V2 = drip feed (Spring / Summer 2027)."**
>
> ⛔ **This REVERSES the 2026-08-31 drip re-scope that Stages 8A–8E and 9 were rebuilt around.**
> **V1 is the pop-up rotary system on the beds/borders, two zones. The bed dripline is V2.**
>
> | | V1 — build now | V2 — Spring/Summer 2027 |
> |---|---|---|
> | **Zone 1** | Rotaries on **Line 1** (box → S11 → bottom edge → S12) | — |
> | **Zone 2** | Rotaries on **Line 2** (box → left edge → S21 → top edge → S22) | — |
> | **Zone 3** | — | **Bed drip feed** + hanging baskets, on the third valve |
>
> **Where to read what:** **8B** (zones) and **8C** (prove the supply) are live · **8D** now carries
> **both** builds — V1's rotary zones first, V2's drip build preserved below it · **8A** is
> superseded and kept as history · **Stage 9** is now V2 + baskets.
>
> 📌 **The Line 1 / Line 2 mapping is a reading of Dan's ruling, recorded as one** — he gave scope,
> not a design.
>
> ⚠️ **Numbering note:** "zone 1 / zone 2" here are **irrigation** zones. `switch.zone_1` /
> `switch.zone_2` in Home Assistant and "Zone 1–8" in Stages 3–5 are **relay channels**. Different
> numbering — do not conflate them.

This is where "water last of all" finally lands. **Do one zone end to end before building the rest.**

**The numbers that drive this** (flow/pressure test, 2026-07-20): **~3.8 bar static, ~19 L/min.**
Pressure is comfortably in band; **flow is the constraint** — a classic single-domestic-tap throttle.

### ⏸️ 8A — ~~Beds first: drip, not rotaries~~ — SUPERSEDED 2026-09-07, kept as history

> ⛔ **Do not build from this section.** It argues for **dripline in the beds**, which is now **V2**.
> ✅ **Its priority claim survives and still governs: the beds are the target.** ⚠️ **Its method claim
> does not — V1 waters them with rotaries.**
>
> ⚠️ **One argument here is worth carrying into V1 as a design constraint rather than a rebuttal:**
> *"overhead spray wets foliage (fungal risk in a UK summer), gets shadowed by the planting itself,
> and lands most of its water where the roots are not."* **That is a real property of rotaries over
> beds.** It is not a veto — Dan has ruled — but it is **why aiming and arcs matter more in V1 than
> the old lawn design ever needed**, and it is an argument for V2 following on rather than being
> dropped. **Throw-test with it in mind.**
>
> ✅ **And the paragraph below about the MP3000 / 8.9 m reach is LIVE AGAIN for V1** — with the caveat
> that ~7.4 m is corner-to-**lawn-centre** and V1 aims at the **borders**, which is not the same
> requirement. See 8D-V1.

**The three flower beds are the priority.** They sit **north, east and west** looking out from the
house; the lawn is the leftover middle. An earlier revision of this guide had this backwards — it
sized the whole hydraulic design around throwing water *across the lawn*, and left the beds with no
zone at all. The beds appeared in the design only as the place the sprinklers were mounted.

1. [ ] **Use pressure-compensating (PC) inline dripline in the beds** — 16 mm, ~2.3 L/hr emitters at
   ~30–33 cm spacing ⚠. Rotaries are the wrong tool for a bed: overhead spray wets foliage (fungal
   risk in a UK summer), gets shadowed by the planting itself, and lands most of its water where the
   roots are not.
2. [ ] ⚠️ **PC specifically, not plain dripline.** Pressure-compensating emitters hold output
   constant across roughly 1–4 bar ⚠, which buys two things this plot needs: it absorbs the **subtle
   decline** in the garden's level (~0.1 bar per metre of fall — see README *Garden Facts*), and it
   makes emitter output independent of position along the run.

> **Why this supersedes the rotary sizing.** 8A previously argued that *"only the MP3000 reaches"* —
> the 11 × 14 m plot puts the centre 8.9 m from the nearest corner, against the MP3000's 9.0 m
> ceiling. That argument was about **watering the lawn**, which is no longer the MVP target. It
> carries forward to **Stage 9**, where it is comfortable rather than marginal: the three beds shrink
> the lawn to roughly **8 × 12.5 m**, so corner-to-centre falls from 8.9 m to **~7.4 m** — mid-range
> for an MP3000 instead of at its ceiling.

> This also **closes the "open design question"** about four-corners-inward versus head-to-head
> spacing. That question was only ever about lawn coverage. It moves to Stage 9 with the rotary
> hardware and gates nothing in the MVP.

### 8B — Zones: two rotary zones for V1, two valves in hand — RESTATED 2026-09-07

3. [ ] **V1 is two zones.** The firmware interlock runs one at a time.

| Zone | Target | Route | Heads | Flow ⚠ | When |
|---|---|---|---|---|---|
| **1** | Beds / borders on the bottom edge | **Line 1** — box → **S11** → bottom edge → **S12** | 2 × PRS40 + MP nozzle | ~5 L/min ⚠ *(2 × MP3500 @ 90° ≈ 9.7 L/min if both were live; only one zone runs at a time)* | **V1** |
| **2** | Beds / borders on the left and top edges | **Line 2** — box → left edge → **S21** → top edge → **S22** | 2 × PRS40 + MP nozzle | as above | **V1** |
| **3** | **Bed drip feed + hanging baskets** | off the manifold's third outlet | PC inline dripline + micro-drip | ~9 L/min ⚠ | **V2 — Spring/Summer 2027** |

4. [ ] ⛔ **V1 fits NO filter and NO pressure reducer.** *(Superseded 2026-08-31: "zones 1 and 2
   share one reducer + filter, splitting to separate valves downstream.")* Both are **drip** parts:
   - The `PROS-04-PRS40` bodies are **pressure-regulated to 2.8 bar** themselves *(datasheet,
     verified: "To optimise MP Rotator Nozzle performance, the Pro-Spray PRS40 is pressure-regulated
     to 2.8 bar; 280 kPa")*. **A 1.5 bar drip reducer would starve them.**
   - Hunter condition **primary filtration on dirty water**; each MP Rotator has a **removable inlet
     filter screen**; the `100-DV` carries a built-in **90-mesh (200 micron)** element. **No filter
     is established as required for V1** ⚠ *(manufacturer-backed inference, not a Dan ruling)*.
   - ⚠️ **V2 brings both** — and the reducer must sit **on the drip leg**, downstream of the split,
     never upstream of the V1 heads.

> **How many valves? Valves = zones — so 3 eventually, 2 needed now.** ✅ **Three are already
> owned, so no valve purchase arises at any stage.** The 8-channel relay stays headroom.

> ⚠️ **One earlier constraint stays obsolete; one comes back.**
> - ⛔ **Still obsolete: the circular self-back-feeding loop** (README *Decisions*). It was replaced
>   on 2026-08-25 by **two independent branch runs**, and neither re-scope touched that reasoning.
> - ⛔ **BACK: the sag-under-flow gate** — *"confirm the zone holds ≥ ~2.75 bar under ~10 L/min"*, the
>   PRS40's regulation point. *(Superseded 2026-08-31: "zone 1 runs ~9 L/min through a reducer set to
>   ~1.5 bar… the MVP is no longer gated on that measurement." **That described the drip MVP, now
>   V2.**)* **V1 runs rotaries at full supply pressure, so it gates V1.** See 8C.

### 8C — Prove the supply and the valve (the rig you already own)

This rig was bought to prove a **rotary head**, and ✅ **as of 2026-09-07 that is exactly what it is
for again.** It proves the DCV, the solenoid valve, the MDPE run and every compression joint, it
produces the supply-loss model — **and under V1 the head is once more the thing under test, not just
a load.** ⏸️ *(Superseded 2026-08-31: "with the beds as the priority, the head is now a convenient
load rather than the thing under test.")*

⛔ **Both readings gate V1**, and the rig is only on the surface once. **Take them now** — after
backfill the same measurement costs a trench.

The wet test needs **no trenching and no second valve** — a temporary surface rig on the valve you
already have. **Test through the pipe you will actually install**: hose has different bore and
friction to 20 mm MDPE, so a reading taken through a garden hose does not transfer to the built
system, and the transferability *is* the point.

**Bill of materials (as bought, 2026-08-10 — ~£163):**

| Part | Why | £ |
|---|---|---|
| **20 mm black MDPE**, 50 m coil | ~16 m needed for the rig; the rest goes into the permanent run. **Black** = irrigation / non-potable, downstream of the DCV. Blue is the potable code — wrong here, and it misleads whoever digs later | 74.95 |
| **Brass 2-way tap splitter, threaded 3/4" BSP outlets**, lever shut-offs | Feeds the rig *and* keeps the manual hose. **Threaded, not push-fit** — a push-fit O-ring under constant mains pressure is a wear item whose failure mode is an unattended flood | 29.00 |
| **Hunter Pro-Spray PRS40 4" body** (`PROS-04-PRS40-CV`) | Regulates to 2.8 bar, so head performance is independent of supply variation | 15.90 |
| **Hunter MP Rotator MP-3000, 90°–210°** | See 8A — **only** the MP3000 (6.7–9.0 m) reaches the 8.9 m corner-to-centre. Also the thirstiest of the family, so it is the honest **worst case** for sag | 10.25 |
| **2 × brass bush 1" BSP M × 3/4" BSP F** | Valve ports (see 7D) | 4.18 |
| **4 × Plasson compression connectors** — 20 mm × 3/4" BSPM ×2, × 3/4" BSPF ×1, × 1/2" BSPM ×1 | MDPE to splitter, valve, head. Plastic compression underground is correct, not a compromise: water-industry standard, no UV, no dezincification | 10.20 |
| **MDPE tee 20 mm × 1/2" BSPF** + bush 1/2" M × 1/4" F + **10 bar gauge, 1/4" M bottom entry** | The head-end gauge — see below | 10.11 |
| PTFE tape | Every threaded joint | 0.80 |

> **Order provenance** (so "do we already have this?" is answerable from the repo, not the inbox).
> The BOM above spans **three orders placed within 20 minutes on 2026-08-10**, totalling **£163.39**:
>
> | Order | Contents | £ | Received |
> |---|---|---|---|
> | **EGI143157** — Easy Garden Irrigation | MDPE coil, tee, 4 × connectors, tap splitter, PRS40 body | 137.60 | delivered 2026-08-12 |
> | **EGI143158** — Easy Garden Irrigation | MP-3000 nozzle (`HI/MP3000-90`) | 14.20 | delivered 2026-08-13 |
> | **A27347852422** — Screwfix | 2 × bush 1"×3/4", PTFE tape, 2 × bush 1/2"×1/4", 10 bar gauge | 11.59 | Click & Collect, picked up |
>
> The MP3000 shipped **separately** from everything else — a single small packet, easily mistaken for
> a missing item when reconciling against EGI143157 alone.

⚠️ **Instrument BOTH ends.** A dead-end gauge screwed to a tap reads **static** pressure and tells
you almost nothing. Fit **two**:

| | Where | How | Reads |
|---|---|---|---|
| **#1** | at the tap | existing dead-end gauge on the splitter's spare **threaded** outlet | supply pressure while water flows |
| **#2** | at the head | **MDPE tee** — sprinkler on the run, gauge on the branch, so flow passes both | what the sprinkler actually sees |

**#1 − #2 is the number that matters**: total loss across the pipe run, the valve and every fitting.
That figure **scales** — it is how you predict the system with a longer run and more load pulling at
once. One gauge gives a reading; two give a model. ⛔ **It gates V1 (restated 2026-09-07)** —
*(superseded: "it no longer gates the MVP… it is the input to Stage 9")* — and it is far cheaper to
measure now, on a surface rig, than after trenching.

5. [ ] Confirm the outside tap's **double-check valve** before any water. Many UK taps have an
   integral DCV; on a new build it may sit **inline behind the wall** and be invisible. If absent,
   fit a hose-union DCV **at the tap, upstream of the splitter**, so it covers the manual-hose leg
   too. ⚠️ The PRS40's `-CV` check valve is an **anti-drainage** device, **not** backflow protection.
6. [ ] Rig it **tap → DCV → splitter → MDPE → bush → valve → bush → MDPE → tee → head**, all above
   ground.
7. [ ] **Wet-test:** energise the zone — the pilot-operated diaphragm should open and the head should
   spray. The manual **bleed lever** proves the valve body independently of the electrics.
8. [ ] **Read both gauges under flow** and record `#1 − #2`. This proves the supply chain end to end
   and gives the sag figure V1's head grouping depends on. ✅ **No valve purchase follows from it —
   three are already owned.**
8b. [ ] ⛔ **THROW TEST — do it while the rig is up. It gates V1 and it is free.** PRS40 body straight
   off the splitter, nozzle fitted, measure where the water lands on a still day. ⚠️ **Do not test
   against 8.9 m or ~7.4 m** — both are **corner-to-lawn-centre**, and **V1 aims at the beds and
   borders**, for which no arithmetic exists anywhere. ✅ **Hunter allow "radius reduction up to
   approximately 25% on all models"**, so an owned MP3500 (9.4–10.7 m) trims to **≈7.05 m**
   *(MP3500 datasheet, verified)* — likely enough with the `HI/MPTOOL`, and **no nozzle purchase
   implied.** ⛔ **Likely is not proven. Measure it.**

### 8D — Build the zones

> ⛔ **RESTATED 2026-09-07.** This section previously read *"Build the bed drip zone (the MVP)"*.
> **V1's build is now first; the drip build is preserved below it as V2.**

#### 8D-V1 — the two rotary zones (build now)

**Four flush pop-up bodies on two lines, on two of the three valves you own.** ✅ **Everything here is
already bought except one item.**

⚠️ **STILL TO BUY — SWING JOINTS.** Articulated risers between lateral and body: height adjustment to
level the head to grade, and they save the fitting or the body when a boot or a mower hits the head.
**Hunter's own CAD details assume one.** ⛔ **Not bought, not priced, not sourced** — only lead is
EGI's *Rain Bird Swing Pipe, 1 m*. ⏳ **Size after the heads are pegged out.**

9. [ ] **Peg out S11, S12, S21, S22** and mark both trench routes. ⏳ **Walk them with a tape** —
   trench length is unmeasured (~33 m is scaled off a drawing).
10. [ ] Plumb **tap → DCV → splitter → MDPE → valve → lateral → swing joint → `PROS-04-PRS40-CV`
    body → nozzle**, two heads per zone. ⛔ **No filter, no reducer** — see 8B step 4.
11. [ ] **Trench to 200 mm over the pipe, dig 250** — set by the body's **155 mm retracted height**
    *(Hunter datasheet, verified)*, with the control cable **under** the pipe. **Tees** through
    S11/S21, **elbows** terminating S12/S22 — `PL/14840C1C` ×2 and `PL/14850C10` ×3, **owned**.
12. [ ] **Set arcs and trim radius with the `HI/MPTOOL`.** **Over-throw is correctable; under-throw
    is not** — so start wide and come down. ⚠️ **No overspray onto patio, fence or house.**
13. [ ] ⛔ **WET-TEST WITH THE TRENCH STILL OPEN**, on the bleed levers. **Do not backfill until it
    holds.** Then mulch/backfill and water in.

**V1 acceptance:** each valve actuates wet · both zones run end to end on their own valve · every
head throws a real pattern onto its target with **no dry gap between adjacent heads** · the trench
holds pressure with every joint visible. ⚠️ **A catch-can / precipitation-rate method is not
specified in this repo and is not being invented here.**

#### ⏸️ 8D-V2 — the bed drip zone (Spring/Summer 2027). **Preserved, do not build yet.**

> ⛔ **Moved to V2 on 2026-09-07.** ✅ **Nothing below was ever ordered, so nothing is stranded.**
> The BOM, the peg price and the evidence gap are tracked in the vault ticket
> `Projects/golden-shower/tasks/plan-v2-bed-drip-zone.md`.

The three beds, on the third valve you own. This is the zone the whole project exists for.

**Still to buy** ⚠ *(indicative — no dripline datasheet is in `datasheets/` yet; confirm emitter
spacing and flow against the product you actually order):*

| Part | Why |
|---|---|
| **16 mm PC inline dripline**, ~80 m | Two laterals per bed at ~40–50 cm apart. **Pressure-compensating** — see 8A |
| **Pressure reducer**, ~1.5 bar, 3/4" BSP | Drip runs at ~1–1.5 bar. Your supply is 3.8 bar static — unreduced it will blow emitters off the line |
| **Filter**, ~120 mesh / 130 micron, 3/4" BSP | **Not optional.** Emitter clogging is the main failure mode of every drip system |
| **16 mm fittings** — start connector (3/4" BSP × 16 mm), tees, elbows, end caps or flush valves | Joining laterals to the 20 mm MDPE mainline |
| **Dripline pegs**, ~1 per 1–1.5 m | Stops the line lifting and wandering as it warms |

V2-1. [ ] Plumb **tap → DCV → splitter → MDPE → filter → reducer → valve → dripline.** Filter
   **before** the reducer, so grit never reaches the regulating element. ⚠️ **The reducer sits on the
   drip leg, downstream of the split — never upstream of the V1 rotary heads, which need 2.8 bar.**
V2-2. [ ] Lay **two laterals per bed**, ~40–50 cm apart, snaked through the planting and pegged down.
    Keep emitters **off the stems** — wetting the crown of a plant is the thing drip is meant to avoid.
V2-3. [ ] **Flush every lateral before capping it.** Run water through open-ended until it comes out
    clean. Swarf from cutting the mainline will otherwise end up in the first emitters.
V2-4. [ ] **Run it and dig.** Thirty minutes in, put a trowel in at three points down each bed. You are
    looking for wetted cones that have **joined up** — a wet band, not isolated damp spots. Adjust run
    time, not emitter spacing, until they merge. **This is V2's acceptance test — ⛔ NOT V1's.**

> **Mulch after commissioning, not before.** Dripline is laid *on* the soil and covered with mulch —
> mulch first and you cannot see what you are doing or find a blocked emitter later.

### 8E — Commission in situ (the permanent build)

Once the zones water correctly, build them for real — valves in the buried box, field cable run.
✅ **Applies to V1's two rotary zones now, and to V2's drip zone in 2027.**

14. [ ] Repeat the **wet actuation** check on each installed valve.
15. [ ] Re-check the **supply-to-coil volt-drop in tenths** (Stage 5C method) with the **field run** in
    circuit — that proves the cable and every gel connector under real load.

---

## Stage 9 — V2 and beyond: the drip feed, the baskets, and lawn-centre coverage

> ⛔ **RESTATED 2026-09-07.** This stage previously read *"Deferred: the basket zone and the lawn
> ring"*. **The rotary heads have moved OUT of here and into V1 (8D-V1); the bed drip has moved IN.**

1. [ ] **V2 — the bed drip feed, Spring/Summer 2027.** Dripline, filter, reducer, 16 mm fittings and
    `ESS16-H` pegs, on the third valve. **Build steps: 8D-V2.** ⛔ **Nothing ordered — and nothing
    ever was, so nothing is stranded.** Spec, pricing and the missing-datasheet gap:
    `Projects/golden-shower/tasks/plan-v2-bed-drip-zone.md`.
2. [ ] **V2 — hanging baskets.** Drip, off the **same filter and reducer as the bed drip zone**
    *(⚠️ restated: not "as zone 1" — V1's zone 1 is rotaries and has neither)*, split to its own
    valve. Baskets need short, frequent cycles; beds need long, infrequent ones. That difference is
    the reason they are separate zones rather than one. **Five baskets** — HB1–3 on the top border
    (FB2), HB4–5 on the right border (FB3).
3. [ ] ⏸️ **Lawn-centre coverage — the only part of the old "lawn ring" still deferred.**
   ✅ **The four corner heads themselves are V1 now** (8D-V1) — same hardware, same positions, aimed
   at the beds and borders instead of across the lawn.
   ⚠️ **What has never been specified is whether the lawn's middle gets watered at all**, and by
   what. The old arithmetic assumed it: the beds shrink the lawn to ~**8 × 12.5 m**, corner-to-centre
   **~7.4 m**. ⛔ **That figure describes the LAWN target, not V1's border target — do not carry it
   across.**
   ✅ **Hardware is fully stocked either way; nothing further needs buying.** **EGI144331** bought
   **3 × `HI/PROS-04-PRS40-CV` and 4 × `HI/MP3500-90`**; with the 8C rig's body and MP3000 that is
   **4 bodies and 5 nozzles in hand.** *(This line once said the ring "needs three more of each" —
   wrong since 2026-08-25.)*
   ⛔ **Nozzle choice is now a V1 question, not a Stage 9 one — see 8C step 8b.** ✅ Hunter allow
   **"radius reduction up to approximately 25% on all models"**, so an owned MP3500 (9.4–10.7 m)
   trims to **≈7.05 m** *(MP3500 datasheet, verified)* — over-throw is correctable, under-throw is
   not. **Throw-test it; do not settle it on paper.**
    - **4 corners ≈ 12 L/min** fits the ~15 L/min working budget in one zone. ⚠️ **V1 splits them
      across two zones anyway**, so only ~2 heads are ever live — roughly half that.
    - **6 heads (corners + mid-sides on the long edges) ≈ 18 L/min** does **not** fit one zone. This
      is where 8C's `#1 − #2` loss figure earns its keep if lawn coverage is ever added.
    - ⚠️ **Aiming — restated for V1.** *(Superseded: "arc the heads inward, away from the beds. The
      beds are already drip-irrigated; rotary overspray onto them is both overwatering and exactly
      the foliage-wetting that drip avoids.")* **Under V1 the beds are the target, so the heads aim
      AT them, not away.** ⚠️ **When V2's dripline arrives the beds will be watered twice**, so the
      V1 arcs and run times want revisiting then. **Recorded now so it is not discovered in 2027.**
3. [ ] **Consider splitting the beds by aspect.** On a SW-facing plot the **west bed takes the hot
   afternoon sun**, north gets the most overall, east only morning. Three separately scheduled bed
   zones is the first concrete use anyone has found for the 8-channel relay's spare channels —
   it stops being abstract "headroom" and starts being differential scheduling.

---

## In parallel (any time from the 20th, needs no electronics)

- [x] **Flow + pressure test** *(done 2026-07-20)*. Static **~3.8 bar / 55 psi** (dead-end gauge,
  tap fully open); flow **~19 L/min** (14 L in 44.17 s, wide open). Pressure is not the
  constraint — **flow is**. Those numbers still set the **~15 L/min working budget** every zone is
  sized against. ⚠️ *(The 2026-08-31 note here said the grouped-rotary design they drove was
  "superseded when the beds became the priority". **Restated 2026-09-07: the beds are still the
  priority, and V1 waters them with rotaries** — so the rotary sizing is live again. See 8B/8D-V1.)*
  - [ ] ⛔ **Dynamic pressure (sag under flow) — still outstanding, and V1-BLOCKING again
    (2026-09-07).** The gauge that arrived is single-ended and reads only with no flow; the **MDPE
    tee to run it inline is in the 8C BOM** and already in hand. *(Superseded: "no longer
    MVP-blocking — zone 1 (drip, ~9 L/min behind a reducer) does not depend on this measurement."
    **That zone is now V2.**)* **V1's rotaries run at full supply pressure and do depend on it.**
    Take it during 8C, while the rig is still on the surface.

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
