#!/bin/sh

set -oeux pipefail

wget -P /etc/yum.repos.d/ https://copr.fedorainfracloud.org/coprs/dasskelett/jool/repo/fedora-39/dasskelett-jool-fedora-39.repo

rpm-ostree install jool

dkms status

rm -f /etc/yum.repos.d/dasskelett-jool-fedora-39.repo