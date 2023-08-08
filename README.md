[![build-ublue](https://github.com/ublue-os/ucore-kmods/actions/workflows/build.yml/badge.svg)](https://github.com/ublue-os/ucore-kmods/actions/workflows/build.yml)

# ublue-os ucore-kmods

A layer for adding extra kernel modules to your Fedora CoreOS image.

# Usage

Add this to your Containerfile to install all the RPM packages, replacing `RELEASE` with either `stable` or `testing`:

    COPY --from=ghcr.io/ublue-os/ucore-kmods:RELEASE /rpms/ /tmp/rpms
    RUN rpm-ostree install /tmp/rpms/kmods/*.rpm

This example shows:
1. copying all the rpms from the `ucore-kmods` image
2. installing the kmods RPMs, providing the actual kmods built in this repo


# Features

Feel free to PR more kmod build scripts into this repo!

- [zfs](https://github.com/openzfs/zfs) - OpenZFS advanced file system and volume manager


# Adding kmods

TBD

# Verification

These images are signed with sisgstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command, replacing `RELEASE` with either `37` or `38`:

    cosign verify --key cosign.pub ghcr.io/ublue-os/ucore-kmods:RELEASE

