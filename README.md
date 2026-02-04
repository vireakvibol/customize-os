# customize-os

A research purpose on customize linux based on Fedora Kinoite.

## Overview

This project builds a custom Fedora Kinoite (KDE Atomic) image with modifications for personal use and experimentation.

## Changes from base Kinoite

- Firefox removed
- Fedora look-and-feel theme removed (plasma-lookandfeel-fedora)
- All pre-installed Fedora Flatpak apps removed (MediaWriter, kolourpaint, kmahjongg, etc.)
- Fedora Flatpak remote replaced with Flathub
- Default theme set to Breeze

### Enabling Auto Day/Night Theme (Plasma 6.5+)

Go to System Settings → Quick Settings and enable automatic day/night theme switching.

## Installed Apps (from Flathub)

- Kolourpaint - simple image editor
- Gwenview - image viewer
- Okular - document viewer

## Usage

### Rebase to this image

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/vireakvibol/customize-os:main
systemctl reboot
```

### Update

```bash
rpm-ostree upgrade
```

### Rollback

```bash
rpm-ostree rollback
systemctl reboot
```

## Building

Images are automatically built via GitHub Actions on every push and tag.

| Event | Image Tag |
|-------|-----------|
| Push to main | `main` |
| Push to branch | `<branch-name>` |
| Tag | `<tag-name>` |

## License

MIT
