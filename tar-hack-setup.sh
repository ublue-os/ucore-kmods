#!/usr/bin/bash

set -oeux pipefail

mv /usr/bin/tar /usr/bin/tar-actual
mv /tmp/tar-hack-script.sh /usr/bin/tar
chmod 755 /usr/bin/tar