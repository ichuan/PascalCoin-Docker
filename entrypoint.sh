#!/usr/bin/env bash

set -e

if test $# -eq 0; then
  ips=${RPC_WHITELIST:-}
  sed -i "s/^RPC_WHITELIST=.*/RPC_WHITELIST=${ips}/g" /opt/pascalcoin_daemon.ini
  exec ./pascalcoin_daemon --run
else
  exec $@
fi
