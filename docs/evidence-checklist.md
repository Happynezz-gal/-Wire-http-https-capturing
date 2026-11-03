# Evidence Checklist

Save sanitized screenshots in the relevant folder. Use clear filenames and do not include real credentials, cookies, tokens, or private data.

## Part 1 — HTTP (`screenshots/part-1-http/`)

- [ ] `01-interface-and-ip-address.png` — terminal showing the interface used (redact addresses if needed).
- [ ] `02-tcpdump-http-running.png` — tcpdump listening on the selected interface.
- [ ] `03-http-display-filter.png` — Wireshark with `http` filter and matching packets.
- [ ] `04-http-post-details-redacted.png` — POST packet details with form values obscured or omitted.

## Part 2 — HTTPS (`screenshots/part-2-https/`)

- [ ] `01-tcpdump-https-running.png` — tcpdump listening for HTTPS capture.
- [ ] `02-port-443-filter.png` — Wireshark with `tcp.port == 443`.
- [ ] `03-tls-application-data.png` — selected TLS Application Data packet.
- [ ] `04-encrypted-data-details.png` — TLS encrypted application data details.

## Documentation

- [ ] `docs/lab-notes.md` completed.
- [ ] `docs/answers-and-reflection.md` completed.
- [ ] Screenshots reviewed and sanitized.
- [ ] No raw PCAP/PCAPNG files staged for Git.

## Evidence quality

- Show the filter bar and relevant packet list.
- Keep screenshots readable; crop unnecessary desktop areas.
- Use consistent filenames.
- Never expose actual passwords, session cookies, authorization headers, or personal information.
