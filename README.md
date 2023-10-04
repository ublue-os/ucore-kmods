[![build-ublue](https://github.com/ublue-os/ucore-kmods/actions/workflows/build.yml/badge.svg)](https://github.com/ublue-os/ucore-kmods/actions/workflows/build.yml)

# ublue-os ucore-kmods

A layer for adding extra kernel modules to your Fedora CoreOS image.

# Features

Feel free to PR more kmod build scripts into this repo!

- [nvidia](https://negativo17.org/nvidia-driver) - latest driver (currently version 535) built from negativo17's akmod package
- ublue-os-ucore-nvidia - RPM with nvidia container runtime repo and selinux policy
- [zfs](https://github.com/openzfs/zfs) - OpenZFS advanced file system and volume manager


# Usage

Add this to your Containerfile to install ZFS RPM packages, replacing `RELEASE` with either `stable` or `testing`:

    COPY --from=ghcr.io/ublue-os/ucore-kmods:RELEASE /rpms/ /tmp/rpms
    RUN rpm-ostree install /tmp/rpms/kmods/zfs/*.rpm

This example shows:
1. copying all the rpms from the `ucore-kmods` image into an image temp directory
2. installing the normal (not debug/src/devel/other) zfs RPMs which were built in this repo

Note: inspect the build logs or image filesystem to see the extra ZFS RPMS provided.


# Adding kmods

TBD

# Verification

These images are signed with sisgstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command, replacing `RELEASE` with either `37` or `38`:

    cosign verify --key cosign.pub ghcr.io/ublue-os/ucore-kmods:RELEASE

