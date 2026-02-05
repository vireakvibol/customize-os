ARG FEDORA_VERSION=43

FROM quay.io/fedora-ostree-desktops/kinoite:${FEDORA_VERSION}

# Remove unwanted RPM packages
RUN rpm-ostree override remove \
    firefox \
    firefox-langpacks && \
    ostree container commit

# Remove all Fedora Flatpak apps and replace with Flathub
RUN echo "--- Flatpak Remotes Initial ---" && \
    flatpak remotes && \
    systemctl disable flatpak-add-fedora-repos.service && \
    flatpak uninstall --system --noninteractive --all || true && \
    flatpak remote-delete fedora --force || true && \
    flatpak remote-delete fedora-testing --force || true && \
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && \
    echo "--- Flatpak Remotes After Flathub Add ---" && \
    flatpak remotes && \
    echo "--- Flatpaks After Flathub Setup ---" && \
    flatpak list && \
    ostree container commit

# Install apps from Flathub
RUN flatpak install --system --noninteractive flathub \
    org.kde.kolourpaint \
    org.kde.gwenview \
    org.kde.okular && \
    ostree container commit

# Set default theme to Breeze (removes Fedora branding)
COPY etc/skel/.config/kdeglobals /etc/skel/.config/kdeglobals
