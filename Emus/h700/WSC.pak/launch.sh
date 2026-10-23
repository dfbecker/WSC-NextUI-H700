#!/bin/sh

EMU_EXE=mednafen_wswan
CORES_PATH=$(dirname "$0")

###############################

EMU_TAG=$(basename "$(dirname "$0")" .pak)
ROM="$1"
mkdir -p "$BIOS_PATH/$EMU_TAG"
mkdir -p "$SAVES_PATH/$EMU_TAG"
mkdir -p "$CHEATS_PATH/$EMU_TAG"
HOME="$USERDATA_PATH"
export HOME
export XDG_CONFIG_HOME="$USERDATA_PATH/.config"
export XDG_DATA_HOME="$USERDATA_PATH/.local/share"
cd "$HOME"
# POSIX redirect, not "&>": on Anbernic H700 /bin/sh is dash, where "&>" would
# run minarch in the background and drop straight back to the NextUI menu.
minarch.elf "$CORES_PATH/${EMU_EXE}_libretro.so" "$ROM" > "$LOGS_PATH/$EMU_TAG.txt" 2>&1
