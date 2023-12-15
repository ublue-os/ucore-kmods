#Build from base, simpley because it's the smallest image
ARG SOURCE_IMAGE="${SOURCE_IMAGE:-fedora-coreos}"
ARG BASE_IMAGE="quay.io/fedora/${SOURCE_IMAGE}"
ARG COREOS_VERSION="${COREOS_VERSION:-stable}"

FROM ${BASE_IMAGE}:${COREOS_VERSION} AS builder
ARG COREOS_VERSION="${COREOS_VERSION:-stable}"

COPY build*.sh /tmp
COPY certs /tmp/certs
ADD ublue-os-ucore-nvidia.spec \
        /tmp/ublue-os-ucore-nvidia/ublue-os-ucore-nvidia.spec
ADD files/usr/lib/systemd/system/ublue-nvctk-cdi.service \
        /tmp/ublue-os-ucore-nvidia/rpmbuild/SOURCES/ublue-nvctk-cdi.service
ADD files/usr/lib/systemd/system-preset/70-ublue-nvctk-cdi.preset \
        /tmp/ublue-os-ucore-nvidia/rpmbuild/SOURCES/70-ublue-nvctk-cdi.preset


RUN /tmp/build-prep.sh

RUN /tmp/build-ublue-nvidia.sh
RUN /tmp/build-kmod-nvidia.sh
RUN ZFS_MINOR_VERSION=2.2 /tmp/build-kmod-zfs.sh

RUN for RPM in $(find /var/cache/akmods/ -type f -name \*.rpm); do \
        cp "${RPM}" /var/cache/rpms/kmods/; \
    done

RUN find /var/cache/rpms

FROM scratch

COPY --from=builder /var/cache/rpms /rpms
