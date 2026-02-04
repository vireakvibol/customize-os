ARG FEDORA_VERSION=43

FROM quay.io/fedora-ostree-desktops/kinoite:${FEDORA_VERSION}

# Remove Firefox
RUN rpm-ostree override remove firefox firefox-langpacks && \
    ostree container commit
