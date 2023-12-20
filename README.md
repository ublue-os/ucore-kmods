[![build-ublue](https://github.com/ublue-os/ucore-kmods/actions/workflows/build.yml/badge.svg)](https://github.com/ublue-os/ucore-kmods/actions/workflows/build.yml)

# ublue-os ucore-kmods

A layer for adding extra kernel modules to your Fedora CoreOS image.

# Features

Feel free to PR more kmod build scripts into this repo!

- [nvidia](https://negativo17.org/nvidia-driver) - latest driver (currently version 535) built from negativo17's akmod package
- ublue-os-ucore-nvidia - RPM with nvidia container toolkit repo and selinux policy
    - [nvidia container selinux policy](https://github.com/NVIDIA/dgx-selinux/tree/master/src/nvidia-container-selinux) - uses RHEL9 policy as the closest match
    - [nvidia-container-tookkit repo](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#installing-with-yum-or-dnf) - version 1.14.2 (and newer) provide CDI for podman use of nvidia gpus
- [zfs](https://github.com/openzfs/zfs) - OpenZFS advanced file system and volume manager *(currently pinned to 2.2 release series)*


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

