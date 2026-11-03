# Troubleshooting

## `http` filter shows no packets

- Confirm the filter is applied by pressing Enter.
- A green filter bar means the syntax is valid, not that matching packets exist.
- Confirm you captured on the interface carrying the VM's traffic.
- Generate HTTP traffic while tcpdump is running; opening a page before starting capture will not be recorded.
- Confirm the capture is the HTTP capture file, not the HTTPS capture.
- Modern sites commonly redirect to HTTPS. Use only an instructor-approved HTTP test endpoint or controlled lab service.
- If the supplied historical HTTP test site is unavailable, document that limitation and ask for an approved alternative. Do not enter real credentials into an HTTP site.

## `tcp.port == 443` shows no packets

- Confirm the browser generated traffic while capture was running.
- Confirm you opened the HTTPS capture file.
- Check that the selected interface is correct.
- Try `tls` as an additional display filter if Wireshark has decoded TLS.
- Port 443 is commonly used for HTTPS, but not every TLS connection must use that port.

## tcpdump: permission denied

Run the capture with `sudo`, as shown in the lab.

## tcpdump: device/interface not found

Run:

```bash
ip address
```

Use the correct interface name instead of the example `enp0s3`.

## Secure connection failed / certificate or time error

Check the VM's date and time and follow your instructor's approved VM time-correction procedure. Do not blindly copy an old date/time from a historical lab handout.

## Capture file not opening

Confirm tcpdump was stopped with Ctrl+C so the file was closed cleanly, and check that the file exists and has a non-zero size:

```bash
ls -lh httpdump.pcap httpsdump.pcap
```

## Git is trying to add a capture file

The `.gitignore` excludes common capture extensions. Check:

```bash
git status --short
git check-ignore -v httpdump.pcap
```

If a capture was already staged, unstage it:

```bash
git rm --cached --ignore-unmatch httpdump.pcap httpsdump.pcap
```

Do not use `git add -f` for packet captures.
