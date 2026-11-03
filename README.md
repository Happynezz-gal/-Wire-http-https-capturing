# Wireshark Lab: Examine HTTP and HTTPS Traffic

A GitHub-ready workflow for the Cisco NetAcad activity **“Lab - Using Wireshark to Examine HTTP and HTTPS Traffic.”**

## Repository purpose

This project documents how to capture HTTP and HTTPS network traffic with `tcpdump`, open the resulting PCAP files in Wireshark, apply display filters, compare visible HTTP form data with encrypted HTTPS application data, and record evidence and observations.

> **Safety and privacy:** Perform this activity only in your authorized CyberOps Workstation VM or another lab environment you control. Use test accounts and dummy data only. Do not capture, commit, or publish real passwords, session cookies, tokens, personal information, or unredacted packet captures. The sample HTTP exercise in the supplied lab uses a test login; never reuse a real password.

## Lab objectives

1. Capture and inspect HTTP traffic.
2. Identify an HTTP `POST` request and inspect the URL-encoded form fields.
3. Capture and inspect HTTPS traffic.
4. Compare the TLS-protected application data with the readable HTTP content.
5. Answer the lab and reflection questions using your own observations.

## Requirements

- CyberOps Workstation VM (or an authorized Linux lab VM)
- Internet connection, as specified by the lab
- `tcpdump`
- Wireshark
- A browser inside the VM
- Git and Git Bash on the Windows host for publishing this repository

The supplied Cisco lab names `enp0s3` as the capture interface. Your VM may use a different interface. Check it before capturing.

## Repository structure

```text
wireshark-http-https-lab/
├── README.md
├── .gitignore
├── LICENSE
├── docs/
│   ├── lab-notes.md
│   ├── answers-and-reflection.md
│   ├── evidence-checklist.md
│   └── troubleshooting.md
├── scripts/
│   ├── list-interfaces.sh
│   ├── capture-http.sh
│   └── capture-https.sh
├── screenshots/
│   ├── part-1-http/
│   │   └── .gitkeep
│   └── part-2-https/
│       └── .gitkeep
├── evidence/
│   ├── notes/
│   │   └── .gitkeep
│   └── packet-capture/
│       └── .gitkeep
└── reports/
    └── .gitkeep
```

## Procedure

### 1. Start the VM and identify the interface

Open a terminal in the CyberOps Workstation VM:

```bash
ip address
```

Identify the active interface that has the VM's network address. The Cisco lab uses `enp0s3` as its example. If yours differs, substitute your actual interface in the capture commands.

You can also run:

```bash
./scripts/list-interfaces.sh
```

### 2. Part 1 — capture HTTP

Start the capture from the VM terminal:

```bash
sudo tcpdump -i enp0s3 -s 0 -w httpdump.pcap
```

Replace `enp0s3` if necessary. While the capture is running, use the browser inside the VM to visit the HTTP test page specified by your instructor/lab. Generate only dummy test traffic. When finished, return to the terminal and press **Ctrl+C**.

Open `httpdump.pcap` in Wireshark. In the display-filter bar, enter:

```wireshark
http
```

Press Enter or click Apply. Select an HTTP `POST` packet, then expand **HTML Form URL Encoded** (shown as `application/x-www-form-urlencoded`) in the packet details. Record what fields are displayed in `docs/answers-and-reflection.md`, using dummy values or redacted values only.

If the lab's historical test URL is unavailable, do not substitute a real login page or enter real credentials. Ask your instructor for an approved HTTP test endpoint or use a controlled local test service.

### 3. Part 2 — capture HTTPS

Start a new capture:

```bash
sudo tcpdump -i enp0s3 -s 0 -w httpsdump.pcap
```

Use the browser inside the VM to visit the HTTPS site specified by the lab/instructor and generate normal test browsing traffic. Do not enter personal credentials. Press **Ctrl+C** to stop the capture.

Open `httpsdump.pcap` in Wireshark and apply:

```wireshark
tcp.port == 443
```

Select a TLS **Application Data** packet. Expand the TLS section and inspect the encrypted application data. Record your observations in `docs/answers-and-reflection.md`.

### 4. Useful Wireshark display filters

| Filter | Purpose |
|---|---|
| `http` | Show packets Wireshark has dissected as HTTP |
| `tcp.port == 80` | Show TCP traffic using port 80 |
| `tcp.port == 443` | Show TCP traffic using port 443 |
| `tls` | Show TLS protocol packets |
| `dns` | Show DNS packets |
| `ip.addr == 192.168.1.10` | Show packets to or from a chosen IP (replace the example IP) |

**Important:** A valid green display filter does not guarantee matching packets exist in the current capture. If `http` returns no packets, the capture may contain HTTPS only, the wrong interface may have been selected, or no HTTP traffic may have been generated. The lab specifically asks you to use `tcp.port == 443` for its HTTPS capture.

### 5. Save evidence

Use the checklist in `docs/evidence-checklist.md`. Save screenshots in the matching `screenshots/` subfolder. Redact usernames, passwords, cookies, tokens, public IPs where appropriate, and other identifying information before committing screenshots.

Keep raw `.pcap` / `.pcapng` files local unless your instructor explicitly requires submission through a private, approved channel. They are ignored by Git by default because packet captures can contain sensitive data.

## Capture scripts

The scripts in `scripts/` are optional helpers. Run them from the VM terminal, not from Windows Git Bash. Make them executable if needed:

```bash
chmod +x scripts/*.sh
```

Examples:

```bash
./scripts/list-interfaces.sh
sudo ./scripts/capture-http.sh enp0s3
sudo ./scripts/capture-https.sh enp0s3
```

Stop either capture with **Ctrl+C**. The scripts write the PCAP file in the current working directory.

## Answers and report

Complete:

- `docs/lab-notes.md`
- `docs/answers-and-reflection.md`
- `docs/evidence-checklist.md`

Do not invent results. Record only what you observed in your own capture. If a question cannot be answered because the site or traffic was unavailable, state that limitation.

## Push to GitHub using Git Bash (Windows)

1. Extract this ZIP file.
2. Open the extracted project folder in File Explorer.
3. Right-click inside the folder and choose **Open Git Bash here** (or open Git Bash and `cd` to the folder).
4. Create an empty GitHub repository named `wireshark-http-https-lab`. Do not initialize it with a README, license, or `.gitignore` because these are already included here.
5. Run:

```bash
git init
git branch -M main
git add .
git status
git commit -m "Add Wireshark HTTP and HTTPS lab workflow"
git remote add origin https://github.com/YOUR-USERNAME/wireshark-http-https-lab.git
git push -u origin main
```

Replace `YOUR-USERNAME` with your GitHub username. If Git asks you to authenticate, complete the browser sign-in or use your configured Git Credential Manager. Do not put a password or token directly in the remote URL.

For later updates:

```bash
git add .
git status
git commit -m "Add lab evidence and observations"
git push
```

Before every push, inspect `git status` and confirm no PCAP files, credentials, cookies, or private information are staged.

## Suggested GitHub repository details

**Repository name:** `wireshark-http-https-lab`

**Description:** `Hands-on Wireshark lab documenting tcpdump capture and analysis of HTTP and HTTPS traffic, display filters, packet inspection, and security observations.`

## Completion criteria

- [ ] Correct network interface identified.
- [ ] HTTP traffic captured (or limitation documented).
- [ ] HTTP display filter applied and POST/form fields inspected where available.
- [ ] HTTPS traffic captured (or limitation documented).
- [ ] `tcp.port == 443` filter applied and TLS Application Data inspected.
- [ ] Answers and reflection questions completed from observed evidence.
- [ ] Screenshots saved and sanitized.
- [ ] No sensitive PCAPs or credentials staged for Git.
- [ ] Repository pushed successfully to GitHub.
