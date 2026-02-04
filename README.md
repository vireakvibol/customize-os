# customize-os

A research purpose on customize linux based on Fedora Kinoite.

## Overview

This project builds a custom Fedora Kinoite (KDE Atomic) image with modifications for personal use and experimentation.

## Changes from base Kinoite

- Firefox removed
- Fedora Media Writer removed
- Fedora Flatpak remote replaced with Flathub (apps migrated)

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
| Push to main | `main`, `latest` |
| Push to branch | `<branch-name>` |
| Tag | `<tag-name>` |

## License

MIT
