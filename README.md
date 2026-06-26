# WSC.pak — Bandai WonderSwan / WonderSwan Color for the Trimui Brick (NextUI)

Emulation pak for the **Bandai WonderSwan** and **WonderSwan Color** on the Trimui
Brick (`tg5040` and `tg5050`) running the **NextUI** firmware.

It uses the **Beetle WonderSwan** libretro core (`mednafen_wswan`), which emulates
both the monochrome WonderSwan and the Color model. The core runs through
`minarch`, the libretro frontend already bundled with NextUI; the `.so` file is the
emulation core only, not a standalone emulator.

## Compatibility

- 💡 **NextUI only**
- 🕹️ Trimui Brick (`tg5040`) and the `tg5050` revision
- `mednafen_wswan_libretro.so` core built for **aarch64** (ARM64)

## Installation

1. Copy the `WSC.pak` folder to `/Emus/<platform>/` on the SD card:
   - Original Brick → `/Emus/tg5040/WSC.pak/`
   - `tg5050` Brick  → `/Emus/tg5050/WSC.pak/`
   (you can copy both; the core is identical)
2. Place your ROMs (`.ws`, `.wsc`, `.pc2`, `.zip`) in
   `/Roms/Bandai WonderSwan Color (WSC)/`
3. SD card layout:
   ```
   /Emus/tg5040/WSC.pak/
     ├── default.cfg
     ├── launch.sh
     └── mednafen_wswan_libretro.so   # core (not a standalone emulator)
   /Roms/Bandai WonderSwan Color (WSC)/   # ROMs
   ```
4. Reboot the device.

> The ROM folder name must end in `(WSC)` so NextUI associates it with `WSC.pak`.
> If you want a different name, change both the `.pak` name and the `(TAG)` together.

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

| Brick control | WonderSwan |
|---------------|-----------|
| D-Pad         | X Cursor (primary pad) |
| L1 / R1       | Y Cursor Left / Right (second pad) |
| L2 / R2       | Y Cursor Down / Up (second pad) |
| A             | A button |
| B             | B button |
| Start         | Start |
| Select        | Rotate screen + active D-Pad |

This is NextUI's default mapping (the pak ships no `bind` lines, so every button —
including the full Y Cursor — shows up in **Menu → Controls** and can be remapped).

### Vertical games

WonderSwan vertical games (shmups, etc.) use the **Y Cursor** as their main pad.
Press **Select** to rotate the screen: with `wswan_rotate_keymap = auto` the D-Pad
then drives the active pad, so you can fly/move with the D-Pad. Alternatively, remap
the D-Pad to the Y Cursor for that game and persist it with *Save for game*.

## Credits

- Core: [beetle-wswan-libretro](https://github.com/libretro/beetle-wswan-libretro)
  (Mednafen / Cygne), aarch64 binary from the libretro buildbot.
- Pak structure based on the NextUI emulator pak format.

## License

This project is licensed under the **GNU General Public License v2.0 or later**
(`GPL-2.0-or-later`). See [LICENSE](LICENSE) for the full text.

### Bundled emulator core

`Emus/<platform>/WSC.pak/mednafen_wswan_libretro.so` is **not** an original work of
this project. It is the **Beetle WonderSwan** libretro core:

- Copyright © its respective authors (Mednafen Team, the Cygne authors, and the
  libretro contributors).
- Licensed under **GPL-2.0-or-later**.
- Upstream source: <https://github.com/libretro/beetle-wswan-libretro>

The redistributed binary was downloaded from the libretro nightly buildbot:

- URL: <https://buildbot.libretro.com/nightly/linux/aarch64/latest/mednafen_wswan_libretro.so.zip>
- Build date (nightly): 2026-06-26
- ELF `BuildID[sha1]`: `d5f9db2e8f2a90a65f4ab834417633a5ddbd5fc6`

### Written offer for source code (GPLv2 §3)

In accordance with the GNU GPL v2, for a period of **three (3) years** from the date
of distribution, the maintainer of this repository will provide, on request, the
complete corresponding source code of the bundled `mednafen_wswan_libretro.so`
binary. The corresponding source is the upstream repository above at the revision
that produced the binary identified by the `BuildID` listed; request it by opening an
issue on this repository.
