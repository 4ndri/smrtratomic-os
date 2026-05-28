# PITCH: Niri Desktop BlueBuild Image

## Problem

The current BlueBuild image is still a generic Silverblue-based personal OS image. It does not yet provide a complete Wayland desktop environment built around niri.

The desired system should boot into a cohesive niri-based desktop with the core pieces needed for daily graphical use: niri for compositing, waybar for status, walker for launching, elephant as walker's data provider, and mako for notifications. The image should define this desktop environment directly so it can stand on its own rather than depending on an external host setup.

## Appetite

Two weeks.

This should be enough to prove the image can build, include the required desktop components, ship baseline configs, and boot into a usable niri session. The pitch is not asking for a full desktop distribution.

## Solution

Create a BlueBuild recipe shape for a niri desktop image based on the existing `smrtratomic-os` recipe.

The image should install and configure the desktop-session components as first-class packages or layered artifacts:

- `niri` as the Wayland compositor and session target.
- `waybar` as the panel/status bar.
- `walker` as the app launcher.
- `elephant` as the data provider for walker.
- `mako` as the notification daemon.

The repo should contain baseline configs under `files/system` or a similarly conventional BlueBuild path so they are installed into standard XDG config locations for new users or system defaults. These configs should be owned by the image and should avoid machine-specific assumptions.

The build should include enough session wiring that the compositor can be selected from a display manager or started as the primary graphical session. Supporting autostart behavior should be kept minimal: start waybar, walker-related services if required, and mako from the niri session config rather than adding a broad custom service framework.

## Security

Do not copy secrets, machine-specific credentials, private tokens, SSH keys, browser/session data, or host-specific state into the image.

Before adding configs, inspect them for absolute user paths, hardware-specific assumptions, private command invocations, and secret-bearing environment variables. Any sensitive or host-specific values should be replaced with documented placeholders or left out of the image.

## Rabbit Holes

- Fedora package availability may not match Arch package names. `niri`, `walker`, `elephant`, and related dependencies may require COPR, custom RPMs, source builds, or containerized installation decisions.
- `elephant` packaging and integration need confirmation on Fedora Atomic. Treat it as required for the walker setup, but avoid turning its provider configuration into a broader search/indexing project.
- Niri session integration can expand quickly into display-manager defaults, systemd user units, portals, polkit agents, lock screen, idle handling, screenshots, screen sharing, and xdg-desktop-portal setup. Keep this pitch scoped to the minimal usable session.
- Desktop configs may depend on paths, package names, scripts, fonts, themes, or helper commands that are not present in the Fedora Atomic image.
- User-level config defaults on an immutable image can be tricky. Decide whether configs are installed as `/etc/skel`, `/etc/xdg`, or copied directly into a managed location, and avoid over-engineering a sync mechanism in the first pass.

## No-Gos

- Do not implement the full recipe as part of this pitch.
- Do not include unrelated desktop components such as a full GNOME replacement, lock screen stack, wallpaper manager, terminal setup, themes, fonts, or app suite unless they are required for the minimal niri session to function.
- Do not create a complex per-user configuration management system.
- Do not depend on files outside this repository for the image to build or boot into the target desktop.
