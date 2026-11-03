#!/usr/bin/env bash
# Start an HTTP-oriented packet capture. Run inside the Linux lab VM.
set -euo pipefail
IFACE="${1:-enp0s3}"
OUT="${2:-httpdump.pcap}"

if ! command -v tcpdump >/dev/null 2>&1; then
  echo "tcpdump is not installed." >&2
  exit 1
fi
if [[ ! -d "/sys/class/net/$IFACE" ]]; then
  echo "Interface '$IFACE' was not found. Run: ip address" >&2
  exit 1
fi
echo "Capturing on $IFACE to $OUT. Generate approved HTTP test traffic, then press Ctrl+C."
echo "Use dummy data only. The resulting PCAP may contain sensitive information; do not commit it."
exec tcpdump -i "$IFACE" -s 0 -w "$OUT"
