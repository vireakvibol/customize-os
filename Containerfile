ARG FEDORA_VERSION=43

FROM quay.io/fedora-ostree-desktops/kinoite:${FEDORA_VERSION}

# Remove unwanted packages
RUN rpm-ostree override remove \
    firefox \
    firefox-langpacks \
    mediawriter && \
    ostree container commit

# Replace Fedora Flatpak with Flathub
RUN systemctl disable flatpak-add-fedora-repos.service && \
    flatpak remote-delete fedora --force || true && \
    flatpak remote-delete fedora-testing --force || true && \
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && \
    ostree container commit
