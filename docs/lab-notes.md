# Lab Notes — HTTP and HTTPS Traffic

## Environment

- Date:
- VM name:
- Operating system:
- Wireshark version:
- tcpdump version:
- Capture interface:
- Interface IPv4/IPv6 address (redact if needed):
- Network notes:

## Part 1 — HTTP

- Capture filename: `httpdump.pcap` (keep local; do not commit)
- Capture command:
  ```bash
  sudo tcpdump -i INTERFACE -s 0 -w httpdump.pcap
  ```
- Test destination used (URL):
- Was the page reachable?
- Wireshark display filter: `http`
- Did HTTP packets appear?
- Selected request type:
- Did you find a POST packet?
- Fields visible under HTML Form URL Encoded (record field names only; redact values):
- Screenshot filenames:

## Part 2 — HTTPS

- Capture filename: `httpsdump.pcap` (keep local; do not commit)
- Capture command:
  ```bash
  sudo tcpdump -i INTERFACE -s 0 -w httpsdump.pcap
  ```
- Test destination used (URL):
- Was the page reachable?
- Wireshark display filter: `tcp.port == 443`
- Did packets appear?
- Selected TLS message:
- What did you observe in Application Data?
- Screenshot filenames:

## Issues and resolutions

| Issue | What I tried | Outcome |
|---|---|---|
| | | |

## Conclusion

Write a short conclusion based only on your capture and observations.
