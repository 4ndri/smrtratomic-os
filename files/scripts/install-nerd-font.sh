#!/usr/bin/env bash
set -oue pipefail

NERD_FONT_VERSION="3.3.0"
FONT_NAME="JetBrainsMono"
FONT_DIR="/usr/share/fonts/$FONT_NAME-Nerd-Font"

if [ ! -d "$FONT_DIR" ]; then
  mkdir -p "$FONT_DIR"
  curl -fsSL "https://github.com/ryanoasis/nerd-fonts/releases/download/v$NERD_FONT_VERSION/$FONT_NAME.tar.xz" \
    | tar -xJ -C "$FONT_DIR"
  fc-cache -fv "$FONT_DIR"
fi
