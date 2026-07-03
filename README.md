## lscript v2.2.4 — the LAZY script

> **Launch with `lazy`** — the main command to open lscript. (`l` is legacy and often conflicts with `ls` on Ubuntu/Kali.) See **[FEATURES.md](FEATURES.md)** for the full reference.

**Maintained by KDR** — https://github.com/Mkadir1999/lscript-2

---

### ⚠️ Disclaimer — training & educational use only

**This tool is intended for authorized security training, education, and lab use only.**

- Use only on systems and networks you **own** or have **explicit written permission** to test.
- **Unauthorized access to computer systems is illegal** in most jurisdictions.
- **KDR** accepts **no responsibility or liability** for any misuse, damage, or legal consequences arising from use of this software.
- **You alone** are responsible for how you use this tool. By installing or running it, you agree to use it lawfully and at your own risk.

Full text: **[DISCLAIMER.md](DISCLAIMER.md)**

<p align="center">
<img src="docs/screenshot.png" alt="lscript main menu — by KDR"/>
</p>

**This script will make your life easier, and of course faster. It's not only for noobs. It's for whoever wants to type less and do more.**

---

## What is lscript?

lscript is a Bash automation toolkit for **Kali Linux** that wraps **100+ security tools** behind a single command (`lazy`). It automates WiFi penetration testing, MITM workflows, payload generation, OSINT, web-app testing, and lab/spoof scenarios — all from one menu.

---

## ⚡ Quick start

```bash
# 1. Install (must be root)
cd ~
git clone https://github.com/Mkadir1999/lscript-2.git
cd lscript-2
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
| **`lazy`** | **Primary launcher** — opens the full menu (recommended, no `l` vs `ls` conflict) |
| `l` | Legacy launcher (may conflict with `l` = `ls` on Ubuntu/Kali) |
| `sudo /usr/local/bin/lscript/lazy` | Direct path (no shell aliases needed) |

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
| `update` | Git-pull latest **lscript** from GitHub |
| `update-kali` | Full **Kali OS** upgrade (apt update + full-upgrade + autoremove + autoclean) |
| `doctor` / `health` | Health-check dependencies and paths |
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

### 🔎 Information gathering / OSINT (15)

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

### 🌐 Web / web-app (8)

| Tool | What it does |
|---|---|
| **sqlmap** | Automatic SQL injection + database takeover |
| **patator** | Multi-protocol brute-forcer (SSH, FTP, HTTP, SMTP, MySQL, …) |
| **Nuclei** ⭐ | (see Info Gathering — same tool, used here for web-app CVE scanning) |
| **ffuf** ⭐ | Fast Go web fuzzer (dirs, vhosts, parameters) |
| **Zeus-Scanner** | Advanced SQLi scanner (training only) |
| **LFI-Suite** | Local File Inclusion scanner/exploit |
| **FindSploit** | Search Exploit-DB / Rapid7 / packetstorm from terminal |
| **howdoi** | Stack-Overflow-style code answers from the CLI |

### 🔧 Other / general / modern (33)

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
| **CLI launchers** | `lazy` (recommended) or `l` (legacy) | Primary entry points |
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
├── lazy               # primary launcher — type `lazy`
├── l                  # legacy launcher
└── lh1, lh2, …        # helper scripts
```

---

## 🔧 How to install

**Made for Kali Linux** (native install with a real WiFi adapter). Ubuntu on WSL is supported for the menu and many tools, but **not for wireless attacks** — see [Troubleshooting](#troubleshooting) below.

**Be careful:** if you download as a `.zip`, it will not run. Clone with `git` and run `install.sh`.

```bash
cd
apt-get update
git clone https://github.com/Mkadir1999/lscript-2.git
cd lscript-2
chmod +x install.sh
sudo ./install.sh
```

**Non-interactive (CI / automation):**

```bash
sudo ./install.sh --yes
```

The installer copies files to `/root/lscript`, adds `/usr/local/bin/lscript` to root's PATH, and sets the **`lazy`** (and `l`) launcher aliases in root's `~/.bashrc`.

**Health check:** run `lazy` as root, then type `doctor` or `labcheck`.

See **[FEATURES.md](FEATURES.md)** for the full command reference, configuration options, and platform notes.

---

## 🛟 Troubleshooting

### `l` only lists files (shows Changelog, README, l, lh1…)

On **Ubuntu** and some other distros, `l` is an **alias for `ls`**. Use **`lazy`** instead:

```bash
sudo -i
source ~/.bashrc
lazy
```

If `lazy` is not found, reinstall or run:

```bash
sudo /usr/local/bin/lscript/lazy
```

**Fresh install** (from your clone folder):

```bash
cd ~/lscript-2
chmod +x install.sh
sudo ./install.sh --yes
sudo -i
lazy
```

### Installed but command not found

```bash
sudo -i
export PATH=/usr/local/bin/lscript:$PATH
lazy
```

Check the binary exists:

```bash
ls -la /usr/local/bin/lscript/lazy
ls -la /root/lscript/l
```

### Ubuntu on Windows (WSL / WSL2)

| Works | Does not work |
|--------|----------------|
| Menu, install, `doctor`, `labcheck`, many CLI tools | Real WiFi monitor mode, handshake capture, WPS/WEP over wireless |
| `spoof` / MITM labs on a **wired** lab network | USB WiFi passthrough (hard to set up; often unreliable) |

- Install from your clone: `cd ~/lscript-2 && sudo ./install.sh --yes`
- Always launch as root: `sudo -i` then `lazy`
- lscript will show a **WSL warning** on startup — expected
- For full WiFi labs, use **native Kali** on bare metal or a VM with USB WiFi passthrough

### `syntax error near unexpected token` (often line ~9836 or `do\r`)

Scripts were saved with **Windows CRLF** line endings. Bash on Linux cannot parse `\r`.

**Quick fix (run as root):**

```bash
sed -i 's/\r$//' /root/lscript/l /usr/local/bin/lscript/l /usr/local/bin/lscript/lazy
sed -i 's/\r$//' /root/lscript/lib/*.sh /root/lscript/labs/*.sh /root/lscript/lh* /root/lscript/ls/*.sh
lazy
```

**Or reinstall from a fresh clone** (install.sh now strips CRLF automatically):

```bash
cd ~/lscript-2
git pull
sudo ./install.sh --yes
sudo -i
lazy
```

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
