#!/bin/sh

set -oeux pipefail

RELEASE="$(rpm -E '%fedora.%_arch')"

cd /tmp

### BUILD nvidia

dnf install -y \
    akmod-nvidia*:*.fc${RELEASE}

# Either successfully build and install the kernel modules, or fail early with debug output
rpm -qa |grep nvidia
KERNEL_VERSION="$(rpm -q kernel --queryformat '%{VERSION}-%{RELEASE}.%{ARCH}')"
NVIDIA_AKMOD_VERSION="$(basename "$(rpm -q "akmod-nvidia" --queryformat '%{VERSION}-%{RELEASE}')" ".fc${RELEASE%%.*}")"


akmods --force --kernels "${KERNEL_VERSION}" --kmod "nvidia"

modinfo /usr/lib/modules/${KERNEL_VERSION}/extra/nvidia/nvidia{,-drm,-modeset,-peermem,-uvm}.ko.xz > /dev/null || \
(cat /var/cache/akmods/nvidia/${NVIDIA_AKMOD_VERSION}-for-${KERNEL_VERSION}.failed.log && exit 1)

# create a directory for later copying of resulting nvidia specific artifacts
mkdir -p /var/cache/rpms/kmods/nvidia

cat <<EOF > /var/cache/rpms/kmods/nvidia/nvidia-vars
KERNEL_VERSION=${KERNEL_VERSION}
RELEASE=${RELEASE}
NVIDIA_AKMOD_VERSION=${NVIDIA_AKMOD_VERSION}
EOF
#NVIDIA_FULL_VERSION=${NVIDIA_FULL_VERSION}
#NVIDIA_LIB_VERSION=${NVIDIA_LIB_VERSION}

mv /var/cache/akmods/nvidia/*.rpm \
   /var/cache/rpms/kmods/nvidia/
