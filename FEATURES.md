# lazyscript v2.2.10 — Feature Reference

**lazyscript** is a Bash automation toolkit for **Kali Linux** that wraps **100+ security tools** behind a single command: **`lazy`**.

> **Maintained by KDR** — [Mkadir1999/lazyscript](https://github.com/Mkadir1999/lazyscript)

> **Legal notice — training & educational use only:** This software is for **authorized security training and education** in controlled environments (labs, courses, systems you own, or with explicit written permission). **Unauthorized use is illegal.** **KDR** accepts **no responsibility or liability** for any misuse, harm, or legal consequences. **You use this tool entirely at your own risk.**

---

## Quick start

```bash
# Native Kali (root)
cd
git clone https://github.com/Mkadir1999/lazyscript.git
cd lazyscript
chmod +x install.sh
./install.sh          # interactive
# or
./install.sh --yes    # CI / automation

# Run
lazy
# `l` is NOT a launcher in v2.2.4+ — it was removed because it conflicts
# with `l` = `ls` on Ubuntu/Kali. Use `lazy`.
```

---

## What lazyscript does

### One command, less typing

| You type | What happens |
|----------|----------------|
| `lazy` | Opens the full interactive menu (**the only supported launcher** in v2.2.4+) |
| `start` | Enable monitor mode + MAC spoof in one step |
| `stop` | Tear down monitor mode, restore interfaces |
| `scan` | Scan for WiFi networks |
| `handshake` | Capture WPA/WPA2 handshakes with deauth helper |
| `wps` | WPS PIN attacks (lh3) |
| `wep` | WEP cracking workflow (lh4) |
| `install` | Multi-select tool installer (100+ tools) |
| `update` | Git-pull latest **lazyscript** from GitHub |
| `update-kali` | Full **Kali OS** upgrade (apt update + full-upgrade + autoremove + autoclean) |
| `doctor` | Health-check dependencies and paths |
| `safeaudit` / `audit` | Guided passive/defensive checks with saved reports |
| `spoof` / `lab` | Training lab menu — DNS spoof, ARP MITM, email spoof, MAC, scope, audit log |
| `labcheck` | Verify lab prerequisites (root, deps, scope) |
| `refresh` | Git-pull all tools under `/root` |
| `profiles` | Save/load WiFi target profiles |
| `ks` | Custom keyboard shortcuts for any tool |
| `rotate` | Trim logs and old handshake files |
| `changelog` | Show the recent Changelog |
| `if` / `ifconfig` | Show network interfaces |
| `exit` | Quit |

---

## Tool categories (100+ tools)

### WiFi / Wireless

| Tool | What it does |
|---|---|
| **Fluxion** | Evil-twin WPA/WPA2 phishing — auto-clones target AP, captive portal, password capture |
| **Wifite** | Automated wireless auditor (WPA handshake, WEP, WPS) |
| **Wifiphisher** | Automated phishing attacks against WiFi clients (evil-twin + captive portal) |
| **Airgeddon** | All-in-one WiFi audit: handshake, WPS, evil-twin, DoS, captive portal |
| **Zatacker** | MITM + nmap + mail-spammer combo (manual install) |
| **Morpheus** | Automated Ettercap TCP/IP hijacking framework |
| **Bully** | WPS PIN brute-forcer (reaver alternative, often more stable) |
| **Wifiautopwner** | Automated WiFi penetration suite |
| **MDK3** | Wireless DoS / beacon flood / deauth (apt package) |
| **Katana Framework** | Multi-purpose hacking framework with WiFi modules |
| **The Eye** | Wireless IDS / jammer / deauth toolkit |
| **Xerxes** | Classic DoS tool (training / lab only) |
| **Trity** | Advanced pentest framework (cryptography, scanning, spoofing) |
| **4nonimizer** | Anonymity helper — Tor, Privoxy, mac changer on connect |
| **netool-toolkit** | Swiss-army toolkit for MITM, scanning, sniffing |

### Remote access / payloads

| Tool | What it does |
|---|---|
| **BeeLogger** | Generate Gmail-emailing keyloggers for Windows |
| **Ezsploit** | Automation wrapper for Metasploit (LAN exploits, payloads) |
| **Pupy** | Cross-platform remote administration and post-exploitation (Python) |
| **Zirikatu** | FUD payload generator (training only) |
| **TheFatRat** | Generate undetectable payloads + listeners |
| **Winpayloads** | Generate undetectable Windows payloads (Python) |
| **Shellter** | Commercial-grade dynamic PE infector (apt) |
| **Chaos** | Generate remote payloads to control Android browsers |
| **Empire** | PowerShell + Python post-exploitation framework |
| **Veil** | AV-evasion payload generator |
| **MSFPC** | One-liner Metasploit payload creator (msfvenom wrapper) |
| **Meterpreter_Paranoid_Mode-SSL** | Wrap Meterpreter in self-signed SSL |
| **Dr0p1t-Framework** | Multi-capability dropper (download + execute + AV-evasion) |
| **FakeImageExploiter** | Hide an `.exe` inside an image (HTA + Powershell) |
| **Avet** | Antivirus evasion tool (Windows payloads) |
| **Gloom-Framework** | Linux payload framework (PenTest) |
| **ARCANUS** | Generate payloads (apt + cron / scheduled-task backdoors) |
| **morphHTA** | Morphing HTA attack (training only) |
| **Demiguise** | HTA encryption tool (for Office macro chains) |
| **DKMC** | Don't Kill My Cat — generate shellcode + droppers |
| **Evil-Droid** | Android payload + RAT generator |
| **EggShell** | iOS/macOS/Linux pentest framework |
| **Zerodoor** | Native Windows backdoor generator |
| **Objection** | Mobile runtime exploration (no jailbreak) |
| **Cromos** | Inject code into Chrome extensions |
| **Yuki-Chan** | Auto-pentest framework (multi-tool wrapper) |
| **SocialFish** | Phishing framework (multi-platform) |
| **AutoSploit** | Automated exploitation via Shodan + Metasploit |
| **Blazy** | Login-form brute-forcer (training only) |
| **hyprPulse** | HID attack helper (WiFi HID injection) |
| **InstaBurst** | Instagram bruteforce (training only) |
| **instagram-py** | Instagram brute-force script |
| **SiteBroker** | Information gathering + auto-exploiter |

### Information gathering / OSINT

| Tool | What it does |
|---|---|
| **Sniper** | Automated pentest recon scanner |
| **ReconDog** | All-in-one recon (whois, DNS, port scan, geo) |
| **RED HAWK** | All-in-one scanner (SQLi, XSS, LFI, RFI, DNS, whois) |
| **Infoga** | Email information gathering (The404Hacking fork) |
| **KnockMail** | Verify if an email address exists |
| **Operative framework** | OSINT + recon framework (Python) |
| **Netattack2** | WiFi scanning + MITM (PyQt5 GUI) |
| **Eternal scanner** | MS17-010 (EternalBlue) scanner |
| **Eaphammer** | Targeted evil-twin attacks against WPA2-Enterprise |
| **Nuclei** ⭐ | Fast vulnerability scanner (ProjectDiscovery) with template engine |
| **Subfinder** ⭐ | Passive subdomain enumeration (ProjectDiscovery) |
| **httpx** ⭐ | HTTP probe / tech fingerprint / status code (ProjectDiscovery) |
| **Naabu** ⭐ | Fast port scanner (ProjectDiscovery) |
| **Sherlock** ⭐ | Hunt social media accounts by username (300+ sites) |
| **Gowitness** ⭐ | Web screenshot recon (Chrome headless) |
| **Amass** ⭐ | Passive/deep asset discovery and subdomain enumeration |

### Web / web-app

| Tool | What it does |
|---|---|
| **sqlmap** | Automatic SQL injection + database takeover |
| **patator** | Multi-protocol brute-forcer (SSH, FTP, HTTP, SMTP, MySQL, …) |
| **Nuclei** ⭐ | (re-listed — used here for web-app CVE scanning) |
| **ffuf** ⭐ | Fast Go web fuzzer (dirs, vhosts, parameters) |
| **Feroxbuster** ⭐ | Fast recursive content discovery |
| **WhatWeb** ⭐ | Web technology fingerprinting |
| **Zeus-Scanner** | Advanced SQLi scanner (training only) |
| **LFI-Suite** | Local File Inclusion scanner/exploit |
| **FindSploit** | Search Exploit-DB / Rapid7 / packetstorm from terminal |
| **howdoi** | Stack-Overflow-style code answers from the CLI |

### Other / general / modern

| Tool | What it does |
|---|---|
| **Cupp** | Generate targeted password wordlists |
| **Hash Buster** | Crack hashes via online lookup (md5, sha1, sha256) |
| **Bleachbit** | System cleaner (free disk space, wipe cache) |
| **Dracnmap** | Nmap wrapper with auto-exploitation |
| **Fern Wifi Cracker** | Wireless security auditing GUI |
| **Hakku framework** | Multi-tool pentest framework |
| **Osrframework** | OSINT framework (multiple data sources) |
| **Kichthemout** | Kick everyone off your local network (ARP) |
| **Ghost-phisher** | Fake AP + DHCP + HTTP server combo |
| **Kerbrute** ⭐ | AD Kerberos username enum / password spray |
| **Ligolo-ng** ⭐ | Modern TCP tunnel / pivoting (replaces chisel) |
| **Lynis** ⭐ | Local Linux security audit |
| **checksec** ⭐ | Binary hardening checks |
| **sslscan** ⭐ | TLS certificate/cipher scanner |
| **testssl.sh** ⭐ | Deep TLS/SSL configuration audit |
| **Gitleaks** ⭐ | Secret/token scanner for repositories |
| **Trivy** ⭐ | Vulnerability scanner for filesystems and container images |
| **Semgrep** ⭐ | Static code security scanner |
| **Syft** ⭐ | SBOM/package inventory generator |
| **Grype** ⭐ | Vulnerability scanner for SBOMs, filesystems, and images |
| **dnsx** ⭐ | DNS resolver/prober for recon lists |
| **Katana** ⭐ | Web crawler for authorized targets |
| **Anonsurf** | Anonymize the whole system through Tor (Kali) |
| **Anonym8** | Similar to anonsurf (auto-configures Tor + iptables) |
| **Angry IP Scanner** | Fast GUI IP / port scanner (Java) |
| **Kwetza** | Inject Meterpreter payload into existing Android APK |
| **Ngrok** | Public HTTPS tunnel to your local box |
| **Netdiscover** | ARP-based network discovery (CLI) |
| **Websploit** | Web scanner + MitM + WiFi jammer combo |
| **OpenVAS / GVM** | Full vulnerability scanner (apt) |
| **Geany** | Lightweight IDE / notepad |
| **VMR** | Vulnerability scanner + reporting |
| **Leviathan** | Wide-range mass audit toolkit |
| **fsociety** | Multi-tool "Mr Robot" themed wrapper |
| **Dagon** | Hash cracker / advanced hash manipulation |
| **LALIN** | Auto-install any Kali package for pentest |
| **BeEF** | Browser Exploitation Framework (XSS post-exploitation) |
| **MITMf** | Man-in-the-Middle framework (BeEF, sslstrip, dnsspoof, …) |
| **iFTOP** | Real-time network bandwidth monitor |

### Deprecated (replaced with safer/more maintained alternatives)

| Tool | Status | Recommended alternative |
|---|---|---|
| **Koadic** | Unmaintained | Empire (already in menu) |
| **WiFi-Pumpkin** | Deprecated by author | Use Bully/Fluxion or external tools |
| **nWatch** | Unmaintained | nmap (auto-installed as fallback) |
| **UniByAv** | Unmaintained | Veil / TheFatRat (already in menu) |

⭐ = new in v2.2.3+ (modern, actively maintained)

### In-tree / built-in features (no install needed)

- **Handshake capture** (WPA/WPA2) — `airodump-ng` + deauth menu + auto-validation (aircrack-ng / pyrit / cowpatty)
- **WEP attack workflow** — fake auth + ARP replay + IV capture (lh41/42/43)
- **WPS pixie-dust loop** — reaver with `-K 1` retry loop (lh3)
- **MAC randomize / restore** — `macchanger` integration
- **Monitor-mode on/off** — `airmon-ng` start/stop, ALFA AWUS036ACH support
- **Lab / spoof menu** — DNS spoof (scoped), ARP MITM (scoped), email spoof, credential viewer, scope editor, audit log
- **MITM helpers** — `l131` (dns2proxy), `l132` (arpspoof forward), `l133` (arpspoof reverse)
- **Metasploit wizards** — payload generator, listener, saved listeners, eternalblue, eternalblue check, findsploit
- **Custom keyboard shortcuts** — bind any single key to any tool/action (`ks`)

---

## WiFi automation

- **Interface management** — managed/monitor mode, `airmon-ng`, ALFA adapter support
- **MAC changing** — `macchanger` with configurable default MAC (`settings/lscript.conf`)
- **Handshake capture** — `airodump-ng` + deauth menu (`lh2`) + validation (aircrack-ng / hcxtools fallback when pyrit is missing)
- **WPS / WEP** — dedicated sub-scripts (`lh3`, `lh4`)
- **Network profiles** — save ESSID/BSSID/channel; skip re-scanning on repeat tests (`psave` / `pload`)

## MITM & credential harvesting

- **sslstrip** + **arpspoof** — automated MITM setup with `l131`/`l132`/`l133` helper terminals
- **MITMf + BeEF** — browser hook injection workflow
- **Email spoofing**, **SQLmap** automation, **Metasploit** payload/listener helpers
- **wififb** — auto-save credentials from WiFi phishing (keyboard shortcut)

## Lab / spoof toolkit (v2.2.0 — training only)

| Command | Description |
|---------|-------------|
| `spoof` or `lab` | Opens guided lab menu |
| `labcheck` | Checks root, disclaimer, scope, dnsspoof, arpspoof, macchanger, sslstrip |

**Spoof menu options:**

1. DNS spoof lab (`dnsspoof` + `labs/hosts.lab`)
2. ARP MITM lab (scoped `arpspoof` pair)
3. Email spoof (SMTP)
4. MAC randomize
5. MAC restore (original)
6. View captured credentials (`sslstrip.log`, wififb logs)
7. Lab scope editor (`settings/lab_scope.txt`)
8. View lab audit log (`logs/lab_audit.log`)
9. Full MITM menu (sslstrip)

**Scope file:** one IP per line in `settings/lab_scope.txt`. ARP MITM refuses targets not listed when scope is set. Empty scope = no IP restriction (still training-only).

---

## Operations & maintenance (v2.1.7+)

| Feature | Command / location | Description |
|---------|-------------------|-------------|
| **Health check** | `doctor` or `health` | Root, internet, wireless stack, MITM deps, version check |
| **Auto-fix** | Doctor menu → `1` | apt update, xterm, python3, aircrack-ng, sslstrip, iptables, NetworkManager |
| **Log rotation** | `rotate` or Doctor → `3` | Rotates `doctor.log`, `sslstrip.log`; trims old `.cap`/`.csv` in `/root/handshakes` |
| **Kali OS upgrade** | `update-kali` or Settings → `8` | `apt update && full-upgrade && autoremove && autoclean` |
| **Shell alias** | Settings → `9` or first install | Adds `update-kali` alias to `~/.bashrc` for use outside `lazy` |
| **Profile backup** | `profiles` → `e` or `pexport` | Tarball of `settings/`, `profiles/`, `ks/` |
| **Profile restore** | `profiles` → `i` or `pimport` | Restore from `.tar.gz` |
| **Tool refresh** | `refresh` or `toolsup` | `git pull` on installed tools in `/root` |
| **WSL2 warning** | automatic on `lazy` | Alerts if no real WiFi adapter (WSL2 limitation) |
| **Config file** | `settings/lscript.conf` | LPATH, LAUNCHER (`lazy`), colors, DEFMAC, log limits |
| **Terminal helper** | `lib/lscript_term.sh` | gnome-terminal with xterm fallback everywhere |

---

## Configuration (`settings/lscript.conf`)

Created from `settings/lscript.conf.example` on install:

```ini
LPATH=/root/lscript
LAUNCHER=lazy
DEFMAC=00:11:22:33:44:55
LOG_ROTATE_MAX_MB=10
HANDSHAKE_MAX_FILES=500
COLOR_YS=\e[1;33m
# ... more color keys ...
```

Edit and restart `lazy` to apply. Logo color can still be overridden via `settings/logocolor.txt`.

---

## Kali system upgrade (`update-kali`)

Equivalent to:

```bash
sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean
```

**Inside lscript (root):** launch with `lazy`, then use these commands:

| Command | Behavior |
|---------|----------|
| `update-kali` | Prompts for confirmation, then runs all four steps |
| `update-kali-yes` | No confirmation (automation) |
| `updatekali` / `kaliupdate` | Same as `update-kali` |

**From settings menu:** `s` → `8` (upgrade) or `9` (install shell alias)

**From doctor:** `doctor` → `4`

**Outside lscript:** after first install, `~/.bashrc` includes:

```bash
alias update-kali='sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean'
```

Open a new terminal and run `update-kali`.

> Note: `update` updates **lscript** from GitHub. `update-kali` upgrades the **entire Kali system**.

---

## Non-interactive install (CI / scripts)

```bash
./install.sh --yes
# aliases: -y, --non-interactive
```

- Requires root
- Auto-detects first install vs update from the existing lscript setup (`/usr/local/bin/lazy` / PATH marker)
- Skips keypress prompts; does not open a new terminal at the end
- Prints: `Non-interactive install complete. Open a terminal and type: lazy`
- If `gnome-terminal` / `xterm` is missing, install continues in the current shell
- Strips Windows **CRLF** and UTF-8 **BOM** from shell scripts during install/update

---

## Doctor checks (v2.1.7+)

**System:** root, WSL2/WiFi adapter, internet, LPATH, settings/profiles/handshakes/wordlists, interface configs

**Terminal:** gnome-terminal, xterm

**Python:** python3, pip3

**Wireless:** aircrack-ng suite, wash, reaver, hcxpcaptool

**MITM / network:** arpspoof (dsniff), sslstrip, iptables, NetworkManager

**Legacy hints:** pyrit, leafpad, msfupdate, OpenVAS→GVM

**Version:** compares local `version.txt` to GitHub

---

## Directory layout

```
/root/lscript/
├── l                 # main script source
├── lazy              # (installed to PATH as /usr/local/bin/lscript/lazy) — the only launcher
├── lh1–lh43           # handshake, deauth, WPS, WEP helpers
├── ls/                # MITM helpers (l131, l132, l133)
├── labs/              # lab/spoof scripts (scoped arpspoof, dnsspoof)
├── lib/
│   ├── lscript_term.sh
│   ├── lscript_conf.sh
│   ├── lscript_utils.sh
│   └── lscript_lab.sh
├── settings/
│   ├── lscript.conf
│   ├── lscript.conf.example
│   ├── lab_scope.txt
│   └── logocolor.txt
├── profiles/          # saved WiFi targets (*.prof)
├── ks/                # keyboard shortcuts
├── backups/           # profile export tarballs
├── logs/              # lab_audit.log
├── tools/ligolo-ng/   # binary install path (when present)
├── install.sh
└── uninstall.sh
```

```
/root/handshakes/      # captures (WEP/, deauth/ subdirs)
/root/wordlists/
/usr/local/bin/lscript/
├── lazy               # THE launcher — type `lazy` (the `l` launcher was removed in v2.2.4)
└── lh1, lh2, …        # helper scripts (called internally by the menu)
```

---

## Platform support

| Environment | WiFi tools | Notes |
|-------------|------------|-------|
| **Kali Linux (bare metal)** | Full | Recommended |
| **Kali VM + USB WiFi passthrough** | Full | Pass adapter to VM |
| **WSL2 / Ubuntu on Windows** | Limited / none | Menu and CLI tools work; wireless labs do not. See **[README — Troubleshooting](README.md#troubleshooting)** (`lazy` launcher, WSL, install steps). |

---

## Troubleshooting

Full install and launch help (use **`lazy`**, WSL, root): **[README.md — Troubleshooting](README.md#troubleshooting)**.

That section covers the most common failures users report:

- `l` listing files instead of opening lscript
- `lscript_term: install gnome-terminal or xterm`
- `syntax error near unexpected token` from CRLF line endings
- `#!: not found`, `[[ : not found`, or `function: not found` when a BOM breaks the bash shebang

## Uninstall

```bash
cd /root/lscript
./uninstall.sh
rm -rf /root/lscript
```

---

## Keyboard shortcuts (`ks`)

Map any single key to launch a tool or built-in action without navigating menus. Reserved keys include: `doctor`, `update`, `profiles`, `pexport`, `rotate`, etc.

---

## Contributing

- Report bugs via GitHub Issues
- Suggest tools/features in Issues
- Test on Kali 2023+ before PRs

---

## Version

Current release: **2.2.10** — see [Changelog](Changelog) for full history.

Recent highlights:

- **2.2.10** — bug sweep: doctor WiFi check, banner hang on long ifaces, terms NO exit, ligolo URLs, katana mapping, lab ip_forward/CIDR, email quoting.
- **2.2.9** — redesigned CLI main menu and GitHub README; docs synced to current release.
- **2.2.8** — remaining xterm calls quoted via `lscript_term`; patator XPT export fix; library function audit.
- **2.2.7** — lab terminal launch fix (`env LPATH=...`); doctor without `eval`; shared `lscript_find_pid`.
- **2.2.6** — expanded lazyscript into a report-oriented Swiss-knife workflow: added sslscan, testssl.sh, Gitleaks, Trivy, Semgrep, Syft, Grype, dnsx, and Katana; expanded `safeaudit`; added `TOOLS.md`.
- **2.2.5** — added Amass, Feroxbuster, WhatWeb, Lynis, checksec, a guided Safe audit workflow, safer install/uninstall cleanup, and doctor checks for modern recon/defensive tools.
- **2.2.4** — 13 broken/redirected GitHub URLs fixed (6 redirects, 4 dead→replaced, 3 deprecated with alternatives); `lscript_load_conf` no longer overrides env-set `LPATH`; `install_ligolo_ng` copy-paste URL bug fixed.
- **2.2.3** — 20+ bug fixes; 10 new modern tools (Nuclei, ffuf, RustScan, Subfinder, httpx, Naabu, Ligolo-ng, Kerbrute, Sherlock, Gowitness); header banners and section comments added.
