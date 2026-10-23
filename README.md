# WSC.pak — WonderSwan / WonderSwan Color for NextUI on Anbernic H700 devices

Emulation pak for the **Bandai WonderSwan** and **WonderSwan Color** on Anbernic
RG XX handhelds with the H700 chip, running
[NextUI for Anbernic H700](https://github.com/pvaibhav/NextUI/releases)
(platform folder `h700`).

> This is an H700 port of [alecrem/Trimui-Brick-WSC](https://github.com/alecrem/Trimui-Brick-WSC),
> the WonderSwan pak for the Trimui Brick. If you have a Trimui Brick, use that one.

It uses the **Beetle WonderSwan** libretro core (`mednafen_wswan`), which emulates
both the monochrome WonderSwan and the Color model. The core runs through
`minarch`, the libretro frontend already bundled with NextUI; the `.so` file is the
emulation core only, not a standalone emulator.

## Download

Get the latest build from the
[**latest release**](https://github.com/dfbecker/WSC-NextUI-H700/releases/latest),
or scan the QR code:

![QR code to the latest release](qr-code.png)

## Compatibility

- 💡 **NextUI for Anbernic H700 only**
- 🕹️ Anbernic devices supported by NextUI's `h700` platform (RG 28XX, 34XX, 35XX,
  40XX, CubeXX and SP families)
- `mednafen_wswan_libretro.so` core built for **aarch64** (ARM64)

## Installation

The H700 build of NextUI does not include the Pak Store yet, so install by hand:

Grab `WSC.zip` from the [latest release](https://github.com/dfbecker/WSC-NextUI-H700/releases/latest)
and extract it onto the **root of your SD card** (it contains the `Emus/` and `Roms/`
folders). Or do it by hand:

1. Copy the `WSC.pak` folder to `/Emus/h700/WSC.pak/` on the SD card.
2. Place your ROMs (`.ws`, `.wsc`, `.pc2`, `.zip`) in
   `/Roms/Bandai WonderSwan Color (WSC)/`
3. SD card layout:
   ```
   /Emus/h700/WSC.pak/
     ├── default.cfg
     ├── launch.sh
     └── mednafen_wswan_libretro.so   # core (not a standalone emulator)
   /Roms/Bandai WonderSwan Color (WSC)/   # ROMs
   ```
4. Reboot the device.

> The ROM folder name must end in `(WSC)` so NextUI associates it with `WSC.pak`.
> If you want a different name, change both the `.pak` name and the `(TAG)` together.
>
> Do not put the pak inside the hidden `.system` folder; NextUI replaces that folder
> on every update.

## What changed from the Trimui Brick pak

- The pak lives in `/Emus/h700/` instead of `/Emus/tg5040/`; NextUI on H700 only
  looks in its own platform folder.
- The log redirect at the end of `launch.sh`. On Anbernic's stock OS `/bin/sh` is
  `dash`, which reads the Bash-only `&>` as "run in the background", so the game
  would start and NextUI would immediately return to its menu. The pak uses the
  POSIX form `> file 2>&1` instead.
- Nothing else. The core, its options and the controls are the same. The core only
  needs `libc`, `libstdc++` and the dynamic loader, which are present on all three
  OSes NextUI supports on H700 (stock, StockMod and BaseOS). NextUI rc11's H700 SDL
  button renumbering does not affect it: controls go through `minarch`, and the pak
  ships no `bind` lines.

## Configuration notes

- **`wswan_60hz_mode = enabled`**: the WonderSwan is natively **75Hz**. Without this
  mode, 60Hz displays may show tearing or FPS drops. It is left enabled by default
  (light frameskip, dropping 1 of every 5 frames).
- **`wswan_rotate_keymap = auto`**: many WonderSwan games are vertical. This option
  automatically reassigns the active pad based on screen rotation.
- **Rotate the screen** in vertical games: by default the core rotates with
  **SELECT** (`wswan_rotate_display = manual`). Change it under Menu → Emulator if
  you prefer a fixed orientation.

These settings can be changed from the emulator menu (Menu) and persisted with
*Save for console* or *Save for game*.

## Default button mapping

| Device control | WonderSwan |
|----------------|-----------|
| D-Pad          | X Cursor (primary pad) |
| L1 / R1        | Y Cursor Left / Right (second pad) |
| L2 / R2        | Y Cursor Down / Up (second pad) |
| A              | A button |
| B              | B button |
| Start          | Start |
| Select         | Rotate screen + active D-Pad |

This is NextUI's default mapping (the pak ships no `bind` lines, so every button —
including the full Y Cursor — shows up in **Menu → Controls** and can be remapped).

### Vertical games

WonderSwan vertical games (shmups, etc.) use the **Y Cursor** as their main pad.
Press **Select** to rotate the screen: with `wswan_rotate_keymap = auto` the D-Pad
then drives the active pad, so you can fly/move with the D-Pad. Alternatively, remap
the D-Pad to the Y Cursor for that game and persist it with *Save for game*.

## Credits

- Original Trimui Brick pak: [alecrem/Trimui-Brick-WSC](https://github.com/alecrem/Trimui-Brick-WSC).
- Core: [beetle-wswan-libretro](https://github.com/libretro/beetle-wswan-libretro)
  (Mednafen / Cygne), aarch64 binary from the libretro buildbot.
- Pak structure based on the NextUI emulator pak format.

## License

This project is licensed under the **GNU General Public License v2.0 or later**
(`GPL-2.0-or-later`). See [LICENSE](LICENSE) for the full text.

### Bundled emulator core

`Emus/h700/WSC.pak/mednafen_wswan_libretro.so` is **not** an original work of
this project. It is the **Beetle WonderSwan** libretro core:

- Copyright © its respective authors (Mednafen Team, the Cygne authors, and the
  libretro contributors).
- Licensed under **GPL-2.0-or-later**.
- Upstream source: <https://github.com/libretro/beetle-wswan-libretro>

The redistributed binary was downloaded from the libretro nightly buildbot:

- URL: <https://buildbot.libretro.com/nightly/linux/aarch64/latest/mednafen_wswan_libretro.so.zip>
- Build date (nightly): 2026-06-26
- ELF `BuildID[sha1]`: `d5f9db2e8f2a90a65f4ab834417633a5ddbd5fc6`
- Source revision: [`da6d0d9`](https://github.com/libretro/beetle-wswan-libretro/commit/da6d0d9acb8d4e9bd6725ab44225a275325d8352)
  (the core reports itself as `Beetle WonderSwan v0.9.35.1 da6d0d9`)

### Corresponding source (GPLv2 §3)

Every release of this repository includes
`beetle-wswan-libretro-da6d0d9-source.tar.gz`, the complete source of the bundled
core at the revision above, next to the binary downloads.

In addition, for a period of **three (3) years** from the date of distribution, the
maintainer of this repository will provide, on request, the complete corresponding
source code of the bundled `mednafen_wswan_libretro.so` binary. Request it by
opening an issue on this repository.
