#!/usr/bin/env bash
# List network interfaces and addresses in the Linux lab VM.
set -euo pipefail
command -v ip >/dev/null 2>&1 || {
  echo "The 'ip' command is not installed." >&2
  exit 1
}
ip address
