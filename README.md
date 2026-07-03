## lazyscript v2.2.6 — the LAZY script

> **Launch with `lazy`** — the only supported way to open lazyscript. See **[FEATURES.md](FEATURES.md)** for the full reference and **[TOOLS.md](TOOLS.md)** for tool-by-tool explanations.
>
> ⚠️ **v2.2.4 breaking change:** the legacy `l` launcher is **no longer installed**. It conflicted with the `l` = `ls` shell alias on Ubuntu/Kali and is removed entirely in this release. If you have an older install, run `sudo /root/lscript/install.sh --yes` to clean it up, then always launch with `lazy`.

**Maintained by KDR** — https://github.com/Mkadir1999/lazyscript

---

### ⚠️ Disclaimer — training & educational use only

**This tool is intended for authorized security training, education, and lab use only.**

- Use only on systems and networks you **own** or have **explicit written permission** to test.
- **Unauthorized access to computer systems is illegal** in most jurisdictions.
- **KDR** accepts **no responsibility or liability** for any misuse, damage, or legal consequences arising from use of this software.
- **You alone** are responsible for how you use this tool. By installing or running it, you agree to use it lawfully and at your own risk.

Full text: **[DISCLAIMER.md](DISCLAIMER.md)**

<p align="center">
<img src="docs/screenshot.png" alt="lazyscript main menu — by KDR"/>
</p>

**This script will make your life easier, and of course faster. It's not only for noobs. It's for whoever wants to type less and do more.**

---

## What is lazyscript?

lazyscript is a Bash automation toolkit for **Kali Linux** that wraps **100+ security tools** behind a single command (`lazy`). It automates WiFi penetration testing, MITM workflows, payload generation, OSINT, web-app testing, and lab/spoof scenarios — all from one menu.

---

## ⚡ Quick start

```bash
# 1. Install (must be root)
cd ~
git clone https://github.com/Mkadir1999/lazyscript.git
cd lazyscript
chmod +x install.sh
sudo ./install.sh
# or for CI / scripts:
sudo ./install.sh --yes

# 2. Launch
sudo -i
source ~/.bashrc   # first time only
lazy               # open the menu
```

**One-liner without staying root:** `sudo /usr/local/bin/lscript/lazy`

---

## 🚀 How to launch

| Command | What it does |
|---|---|
| **`lazy`** | **The only supported launcher** — opens the full menu |
| `sudo /usr/local/bin/lscript/lazy` | Direct path (no shell aliases needed) |

> ❌ `l` is **NOT** a launcher in v2.2.4+. It used to launch lscript, but it conflicted with the `l` = `ls` shell alias on Ubuntu/Kali and has been removed. If you typed `l` and it just listed files, that was the cause. Use **`lazy`** instead.

After `lazy` is running, you can type these from the main menu prompt:

| Hotkey | Action |
|---|---|
| `start` | Enable monitor mode + MAC spoof in one step |
| `stop` | Tear down monitor mode, restore interfaces |
| `scan` | Scan for WiFi networks |
| `handshake` | Capture WPA/WPA2 handshakes with deauth helper |
| `wps` | WPS PIN attacks (pixie dust + bully) |
| `wep` | WEP cracking workflow |
| `install` | Multi-select tool installer (100+ tools) |
| `update` | Git-pull latest **lazyscript** from GitHub |
| `update-kali` | Full **Kali OS** upgrade (apt update + full-upgrade + autoremove + autoclean) |
| `doctor` / `health` | Health-check dependencies and paths |
| `safeaudit` / `audit` | Guided passive/defensive checks with saved reports |
| `spoof` / `lab` | Training lab menu — DNS spoof, ARP MITM, email spoof, MAC, scope, audit log |
| `labcheck` | Verify lab prerequisites (root, deps, scope) |
| `refresh` / `toolsup` | `git pull` all installed tools under `/root` |
| `profiles` | Save/load WiFi target profiles |
| `pexport` / `pimport` | Backup/restore settings, profiles, keyboard shortcuts |
| `ks` | Custom keyboard shortcuts for any tool |
| `rotate` | Trim logs and old handshake files |
| `if` / `ifconfig` | Show network interfaces |
| `changelog` | Show the recent Changelog |
| `exit` | Quit |

---

## 🧰 Every tool lscript can install (100+)

The installer ships with a multi-select menu (`install` / `reinstall_tools` / menu 5 → 6). Categories below match the in-app sub-menus.

### 📡 Wifi / Wireless (15)

| Tool | What it does |
|---|---|
| **Fluxion** | Evil-twin WPA/WPA2 phishing — auto-clones target AP, captive portal, password capture |
| **Wifite** | Automated wireless auditor (WPA handshake, WEP, WPS) — runs the whole attack for you |
| **Wifiphisher** | Automated phishing attacks against WiFi clients (evil-twin + captive portal) |
| **Airgeddon** | All-in-one WiFi audit: handshake, WPS, evil-twin, DoS, captive portal |
| **Zatacker** | MITM + nmap + mail-spammer combo (manual install) |
| **Morpheus** | Automated Ettercap TCP/IP hijacking framework |
| **Bully** | WPS PIN brute-forcer (reaver alternative, often more stable) |
| **Wifiautopwner** | Automated WiFi penetration suite |
| **MDK3** | Wireless DoS / beacon flood / deauth (apt package, pre-installed on Kali) |
| **Katana Framework** | Multi-purpose hacking framework with WiFi modules |
| **The Eye** | Wireless IDS / jammer / deauth toolkit |
| **Xerxes** | Classic DoS tool (training / lab only) |
| **Trity** | Advanced pentest framework (cryptography, scanning, spoofing) |
| **4nonimizer** | Anonymity helper — Tor, Privoxy, mac changer on connect |
| **netool-toolkit** | Swiss-army toolkit for MITM, scanning, sniffing |

### 💻 Remote access / payloads (24)

| Tool | What it does |
|---|---|
| **BeeLogger** | Generate Gmail-emailing keyloggers for Windows |
| **Ezsploit** | Automation wrapper for Metasploit (LAN exploits, payloads) |
| **Pupy** | Cross-platform remote administration and post-exploitation (Python) |
| **Zirikatu** | FUD payload generator (training only) |
| **TheFatRat** | Generate undetectable payloads + listeners |
| **Winpayloads** | Generate undetectable Windows payloads (Python) |
| **Shellter** | Commercial-grade dynamic PE infector (apt) |
| **Chaos** | Generate remote Payloads to control Android browsers |
| **Koadic** ⚠ deprecated | Windows JScript RAT (unmaintained; use Empire) |
| **Empire** | PowerShell + Python post-exploitation framework |
| **Veil** | AV-evasion payload generator |
| **MSFPC** | One-liner Metasploit payload creator (msfvenom wrapper) |
| **Meterpreter_Paranoid_Mode-SSL** | Wrap Meterpreter in self-signed SSL |
| **Dr0p1t-Framework** | Multi-capability dropper (download + execute + AV-evasion) |
| **Wifi-Pumpkin** ⚠ deprecated | Rogue AP framework (no longer maintained) |
| **FakeImageExploiter** | Hide an `.exe` inside an image (HTA + Powershell) |
| **Avet** | Antivirus evasion tool (Windows payloads) |
| **Gloom-Framework** | Linux payload framework (PenTest) |
| **ARCANUS** | Generate payloads (apt + cron / scheduled-task backdoors) |
| **morphHTA** | Morphing HTA attack (training only) |
| **Demiguise** | HTA encryption tool (for Office macro chains) |
| **DKMC** | Don't Kill My Cat — generate shellcode + droppers |
| **SecHub** | Defensive-only credential storage lab helper |
| **Evil-Droid** | Android payload + RAT generator |
| **Nosqlmap** | NoSQL injection scanner (MongoDB, etc.) |
| **EggShell** | iOS/macOS/Linux pentest framework |
| **Zerodoor** | Native Windows backdoor generator |
| **Objection** | Mobile runtime exploration (no jailbreak) |
| **Cromos** | Inject code into Chrome extensions |
| **Yuki-Chan** | Auto-pentest framework (multi-tool wrapper) |
| **SocialFish** | Phishing framework (multi-platform) |
| **AutoSploit** | Automated exploitation via Shodan + Metasploit |
| **Blazy** | Login-form brute-forcer (training only) |
| **Striker** | Recon + vuln scanner (info gatherer) |
| **hyprPulse** | HID attack helper (WiFi HID injection) |
| **InstaBurst** | Instagram bruteforce (training only) |
| **instagram-py** | Instagram brute-force script |
| **SiteBroker** | Information gathering + auto-exploiter |

### 🔎 Information gathering / OSINT (16)

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

### 🌐 Web / web-app (10)

| Tool | What it does |
|---|---|
| **sqlmap** | Automatic SQL injection + database takeover |
| **patator** | Multi-protocol brute-forcer (SSH, FTP, HTTP, SMTP, MySQL, …) |
| **Nuclei** ⭐ | (see Info Gathering — same tool, used here for web-app CVE scanning) |
| **ffuf** ⭐ | Fast Go web fuzzer (dirs, vhosts, parameters) |
| **Feroxbuster** ⭐ | Fast recursive content discovery |
| **WhatWeb** ⭐ | Web technology fingerprinting |
| **Zeus-Scanner** | Advanced SQLi scanner (training only) |
| **LFI-Suite** | Local File Inclusion scanner/exploit |
| **FindSploit** | Search Exploit-DB / Rapid7 / packetstorm from terminal |
| **howdoi** | Stack-Overflow-style code answers from the CLI |

### 🔧 Other / general / modern (47)

| Tool | What it does |
|---|---|
| **Cupp** | Generate targeted password wordlists (per-target, social-engineering) |
| **Hash Buster** | Crack hashes via online lookup (md5, sha1, sha256) |
| **Patator** | Multi-protocol brute-forcer |
| **Bleachbit** | System cleaner (free disk space, wipe cache) |
| **Dracnmap** | Nmap wrapper with auto-exploitation |
| **Fern Wifi Cracker** | Wireless security auditing GUI |
| **Hakku framework** | Multi-tool pentest framework |
| **Osrframework** | OSINT framework (multiple data sources) |
| **Kichthemout** | Kick everyone off your local network (ARP) |
| **Ghost-phisher** | Fake AP + DHCP + HTTP server combo |
| **Ezsploit** | Metasploit automation for LAN |
| **Kerbrute** ⭐ | AD Kerberos username enum / password spray (offline) |
| **Ligolo-ng** ⭐ | Modern TCP tunnel / pivoting tool (replaces chisel for many uses) |
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
| **TheFatRat** | (see Remote Access) |
| **Angry IP Scanner** | Fast GUI IP / port scanner (Java) |
| **Kwetza** | Inject Meterpreter payload into existing Android APK |
| **Ngrok** | Public HTTPS tunnel to your local box |
| **Netdiscover** | ARP-based network discovery (CLI) |
| **Websploit** | Web scanner + MitM + WiFi jammer combo |
| **OpenVAS / GVM** | Full vulnerability scanner (apt) |
| **Geany** | Lightweight IDE / notepad |
| **VMR** | Vulnerability scanner + reporting |
| **Findsploit** | (see Web) |
| **Leviathan** | Wide-range mass audit toolkit |
| **Yuki-Chan** | (see Remote Access) |
| **SocialFish** | (see Remote Access) |
| **fsociety** | Multi-tool "Mr Robot" themed wrapper |
| **MSFPC** | (see Remote Access) |
| **Dagon** | Hash cracker / advanced hash manipulation |
| **LALIN** | Auto-install any Kali package for pentest |
| **BeEF** | Browser Exploitation Framework (XSS post-exploitation) |
| **MITMf** | Man-in-the-Middle framework (BeEF, sslstrip, dnsspoof, …) |
| **iFTOP** | Real-time network bandwidth monitor |
| **DKM C / Demiguise / SecHub / Unibyav** ⚠ deprecated | See Changelog / install notes |

⭐ = new in v2.2.3+ (modern, actively maintained)
⚠ deprecated = tool moved/upstream gone; install function prints an alternative recommendation (e.g. Empire instead of Koadic)

### 🔌 In-tree / built-in features (no install needed)

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

## 🛠️ Operations toolkit (v2.1.7+)

| Feature | Command | Description |
|---|---|---|
| **Health check** | `doctor` / `health` | Root, internet, wireless stack, MITM deps, version check |
| **Auto-fix** | `doctor` → `1` | apt update, install missing tools, fix common issues |
| **Log rotation** | `rotate` / `doctor` → `3` | Rotate `doctor.log`, `sslstrip.log`; trim old handshakes |
| **Kali OS upgrade** | `update-kali` | apt full-upgrade + autoremove + autoclean (with prompt) |
| **Kali upgrade (no prompt)** | `update-kali-yes` | Same, no confirmation |
| **Profile backup** | `pexport` | Tarball of `settings/`, `profiles/`, `ks/` |
| **Profile restore** | `pimport` | Restore from `.tar.gz` |
| **Tool refresh** | `refresh` / `toolsup` | `git pull` on installed tools in `/root` |
| **WSL2 warning** | automatic | Alerts when no real WiFi adapter is visible |
| **Config file** | `settings/lscript.conf` | LPATH, LAUNCHER, DEFMAC, colors, log limits |
| **CLI launcher** | `lazy` | Only supported entry point (the `l` launcher was removed in v2.2.4) |
| **Shell alias install** | settings → `9` | Install `update-kali` alias into `~/.bashrc` |
| **Non-interactive install** | `./install.sh --yes` | CI/automation support |

---

## 📁 Where things live

```
/root/lscript/
├── l                 # main script source
├── lh1–lh43           # handshake, deauth, WPS, WEP helpers
├── ls/                # MITM helpers (l131 dns2proxy, l132/l133 arpspoof)
├── labs/              # lab/spoof scripts (scoped arpspoof, dnsspoof)
├── lib/
│   ├── lscript_term.sh    # gnome-terminal/xterm helper
│   ├── lscript_conf.sh    # config loader
│   ├── lscript_utils.sh   # log rotation, WSL detect, backup
│   └── lscript_lab.sh     # lab scope, audit log
├── settings/
│   ├── lscript.conf.example
│   ├── lab_scope.txt      # IP allow-list for MITM
│   └── logocolor.txt
├── profiles/          # saved WiFi targets (*.prof)
├── ks/                # keyboard shortcut definitions
├── backups/           # profile export tarballs
├── logs/              # lab_audit.log
├── tools/ligolo-ng/   # binary install path (when present)
├── install.sh
└── uninstall.sh

/root/handshakes/      # captures (WEP/, deauth/ subdirs)
/root/wordlists/
/usr/local/bin/lscript/
├── lazy               # THE launcher — type `lazy` (the `l` launcher was removed in v2.2.4)
└── lh1, lh2, …        # helper scripts (called internally by the menu)
```

---

## 🔧 How to install

**Made for Kali Linux** (native install with a real WiFi adapter). Ubuntu on WSL is supported for the menu and many tools, but **not for wireless attacks** — see [Troubleshooting](#troubleshooting) below.

**Be careful:** if you download as a `.zip`, it will not run. Clone with `git` and run `install.sh`.

```bash
cd
apt-get update
git clone https://github.com/Mkadir1999/lazyscript.git
cd lazyscript
chmod +x install.sh
sudo ./install.sh
```

**Non-interactive (CI / automation):**

```bash
sudo ./install.sh --yes
```

The installer copies files to `/root/lscript`, adds `/usr/local/bin/lscript` to root's PATH, and sets the **`lazy`** launcher alias in root's `~/.bashrc`. The legacy `l` launcher is **not** installed (it was removed in v2.2.4).

**Health check:** run `lazy` as root, then type `doctor` or `labcheck`.

See **[FEATURES.md](FEATURES.md)** for the full command reference, configuration options, and platform notes.

---

## 🛟 Troubleshooting

### `l` only lists files (shows Changelog, README, l, lh1…)

This is the most common confusion. The `l` command in your shell is **not** lazyscript — it's either:

- Ubuntu's built-in `l` → `ls` alias (from `~/.bashrc`), or
- A leftover symlink from a very old lazyscript install

**v2.2.4+ removed the `l` launcher entirely.** The correct command is `lazy`. Run:

```bash
sudo -i
source ~/.bashrc
lazy
```

**If a leftover `/usr/local/bin/l` from an older install is shadowing your shell, remove it once:**

```bash
sudo rm -f /usr/local/bin/l /usr/local/bin/lscript/l
hash -r        # tell your current shell to forget the cached path
```

Then launch with `lazy` and you're set. Going forward, the install script also removes any leftover `l` symlink automatically.

**If `lazy` is not found at all** (fresh box, no install), do a fresh install:

```bash
cd ~/lazyscript
chmod +x install.sh
sudo ./install.sh --yes
sudo -i
lazy
```

### Installed but `lazy` not found

```bash
sudo -i
export PATH=/usr/local/bin/lscript:$PATH
hash -r
lazy
```

Check the launcher exists and is executable:

```bash
ls -la /usr/local/bin/lazy
ls -la /usr/local/bin/lscript/lazy
file /usr/local/bin/lscript/lazy
```

### Installer says `lscript_term: install gnome-terminal or xterm`

On minimal Kali installs, `gnome-terminal` and `xterm` may both be missing. Older lazyscript installers tried to relaunch themselves in a GUI terminal after copying into `/root/lscript`, which caused the install to stop here.

**Current fix (v2.2.4+):** the installer now falls back to the **current shell** and continues automatically.

If you already hit this error on an older copy, continue manually:

```bash
sudo bash /root/lscript/install.sh --yes
hash -r
lazy
```

You do **not** need to install `xterm` just to finish the setup.

### Ubuntu on Windows (WSL / WSL2)

| Works | Does not work |
|--------|----------------|
| Menu, install, `doctor`, `labcheck`, many CLI tools | Real WiFi monitor mode, handshake capture, WPS/WEP over wireless |
| `spoof` / MITM labs on a **wired** lab network | USB WiFi passthrough (hard to set up; often unreliable) |

- Install from your clone: `cd ~/lazyscript && sudo ./install.sh --yes`
- Always launch as root: `sudo -i` then `lazy`
- lazyscript will show a **WSL warning** on startup — expected
- For full WiFi labs, use **native Kali** on bare metal or a VM with USB WiFi passthrough

### `syntax error near unexpected token` (often line ~9836 or `do\r`)

Scripts were saved with **Windows CRLF** line endings. Bash on Linux cannot parse `\r`.

**Quick fix (run as root):**

```bash
sed -i 's/\r$//' /root/lscript/l /usr/local/bin/lscript/lazy
sed -i 's/\r$//' /root/lscript/lib/*.sh /root/lscript/labs/*.sh /root/lscript/lh* /root/lscript/ls/*.sh
sudo -i
hash -r
lazy
```

**Or reinstall from a fresh clone** (install.sh now strips CRLF automatically):

```bash
cd ~/lazyscript
git pull
sudo ./install.sh --yes
sudo -i
lazy
```

### `lazy` prints `#!: not found`, `[[ : not found`, or `function: not found`

This means the launcher was executed by `/bin/sh` instead of `bash`. In practice, the usual cause is a **UTF-8 BOM** at the start of `/usr/local/bin/lscript/lazy`, which breaks the shebang on Linux.

Symptoms usually look like this:

```bash
/usr/local/bin/lazy: 1: #!: not found
/usr/local/bin/lazy: 48: [[: not found
/usr/local/bin/lazy: 62: function: not found
```

**Quick fix (run as root):**

```bash
sed -i '1s/^\xEF\xBB\xBF//' /root/lscript/l /usr/local/bin/lscript/lazy
chmod +x /root/lscript/l /usr/local/bin/lscript/lazy
hash -r
lazy
```

**Verify the launcher is clean:**

```bash
file /usr/local/bin/lscript/lazy
bash -n /usr/local/bin/lscript/lazy
```

The repo and installer now strip both **CRLF** and **UTF-8 BOM** automatically, so a fresh `git pull` + `sudo ./install.sh --yes` should prevent this from returning.

### Still stuck?

Run these as your normal user and paste the output in a GitHub issue:

```bash
which lazy
type lazy
ls -la /usr/local/bin/lscript/lazy
sudo /usr/local/bin/lscript/lazy
```

---

## 🗑️ How to uninstall

```bash
cd /root/lscript
./uninstall.sh
rm -rf /root/lscript
```

## 🔄 How to update

```bash
lazy           # launch
type update    # inside the menu — git-pulls latest lscript
```

Or manually:

```bash
cd /root/lscript
git pull
```

---

## 🤝 Contributing

- Report bugs via GitHub Issues
- Suggest tools/features in Issues
- Test on Kali 2023+ before PRs

---

**TRAINING / EDUCATIONAL USE ONLY. KDR is not responsible for misuse. You use this tool at your own risk and must comply with all applicable laws.**
