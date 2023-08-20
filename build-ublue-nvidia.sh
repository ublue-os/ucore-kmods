#!/bin/sh

set -oeux pipefail

### SETUP nvidia container stuffs

#install -D /etc/pki/akmods/certs/public_key.der /tmp/ublue-os-ucore-nvidia/rpmbuild/SOURCES/public_key.der

curl -L https://nvidia.github.io/nvidia-docker/rhel9.0/nvidia-docker.repo \
    -o /tmp/ublue-os-ucore-nvidia/rpmbuild/SOURCES/nvidia-container-runtime.repo 
sed -i "s@gpgcheck=0@gpgcheck=1@" /tmp/ublue-os-ucore-nvidia/rpmbuild/SOURCES/nvidia-container-runtime.repo

curl -L https://raw.githubusercontent.com/NVIDIA/dgx-selinux/master/bin/RHEL9/nvidia-container.pp \
    -o /tmp/ublue-os-ucore-nvidia/rpmbuild/SOURCES/nvidia-container.pp

rpmbuild -ba \
    --define '_topdir /tmp/ublue-os-ucore-nvidia/rpmbuild' \
    --define '%_tmppath %{_topdir}/tmp' \
    /tmp/ublue-os-ucore-nvidia/ublue-os-ucore-nvidia.spec

mkdir -p /var/cache/rpms/kmods/nvidia

mv /tmp/ublue-os-ucore-nvidia/rpmbuild/RPMS/*/*.rpm \
   /var/cache/rpms/kmods/nvidia/
