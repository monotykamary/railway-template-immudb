#!/bin/sh
set -eu
mkdir -p "${IMMUDB_DIR:-/data/immudb}"
chown -R 3322:3322 "${IMMUDB_DIR:-/data/immudb}"
exec setpriv --reuid=3322 --regid=3322 --clear-groups /usr/sbin/immudb "$@"
