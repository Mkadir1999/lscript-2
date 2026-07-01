# lscript v2.1.8 — Feature Reference

**LAZY script (lscript)** is a Bash automation toolkit for **Kali Linux** that wraps WiFi penetration testing, MITM workflows, and 90+ third-party security tools behind a single command: `l`.

> **Fork of** [arismelachroinos/lscript](https://github.com/arismelachroinos/lscript) by **Aris Melachroinos**. This repo ([Mkadir1999/lscript-2](https://github.com/Mkadir1999/lscript-2)) adds maintenance, bug fixes, and features from v2.1.7 onward.

> **Legal notice:** Only use on networks and systems you own or have explicit written permission to test. The authors are not responsible for misuse.

---

## Quick start

```bash
# Native Kali (root)
cd
git clone https://github.com/Mkadir1999/lscript-2.git
cd lscript-2
chmod +x install.sh
./install.sh          # interactive
# or
./install.sh --yes    # CI / automation

# Run
l
```

---

## What lscript does

### One command, less typing

| You type | What happens |
|----------|----------------|
| `l` | Opens the full interactive menu |
| `start` | Enable monitor mode + MAC spoof in one step |
| `stop` | Tear down monitor mode, restore interfaces |
| `scan` | Scan for WiFi networks |
| `handshake` | Capture WPA/WPA2 handshakes with deauth helper |
| `wps` | WPS PIN attacks (lh3) |
| `wep` | WEP cracking workflow (lh4) |
| `install` | Multi-select tool installer (90+ tools) |
| `update` | Git-pull latest **lscript** from GitHub |
| `update-kali` | Full **Kali OS** upgrade (apt update + full-upgrade + autoremove + autoclean) |
| `doctor` | Health-check dependencies and paths |
| `refresh` | Git-pull all tools under `/root` |
| `profiles` | Save/load WiFi target profiles |
| `ks` | Custom keyboard shortcuts for any tool |

### WiFi automation

- **Interface management** — managed/monitor mode, `airmon-ng`, ALFA adapter support
- **MAC changing** — `macchanger` with configurable default MAC (`settings/lscript.conf`)
- **Handshake capture** — `airodump-ng` + deauth menu (`lh2`) + validation (aircrack-ng / hcxtools fallback when pyrit is missing)
- **WPS / WEP** — dedicated sub-scripts (`lh3`, `lh4`)
- **Network profiles** — save ESSID/BSSID/channel; skip re-scanning on repeat tests (`psave` / `pload`)

### MITM & credential harvesting

- **sslstrip** + **arpspoof** — automated MITM setup with `l131`/`l132`/`l133` helper terminals
- **MITMf + BeEF** — browser hook injection workflow
- **Email spoofing**, **SQLmap** automation, **Metasploit** payload/listener helpers
- **wififb** — auto-save credentials from WiFi phishing (keyboard shortcut)

### Tool installer (built-in)

Install from inside lscript — no hunting repos manually. Includes (among many others):

Fluxion, Wifite, Wifiphisher, Airgeddon, TheFatRat, Empire, Veil, Bettercap stack tools, Routersploit, SocialFish, Yuki-Chan, and 80+ more.

Multi-select install: pick several tools, press `s` to batch install.

### Operations & maintenance (v2.1.7)

| Feature | Command / location | Description |
|---------|-------------------|-------------|
| **Health check** | `doctor` or `health` | Root, internet, wireless stack, MITM deps, version check |
| **Auto-fix** | Doctor menu → `1` | apt update, xterm, python3, aircrack-ng, sslstrip, iptables, NetworkManager |
| **Log rotation** | `rotate` or Doctor → `3` | Rotates `doctor.log`, `sslstrip.log`; trims old `.cap`/`.csv` in `/root/handshakes` |
| **Kali OS upgrade** | `update-kali` or Settings → `8` | `apt update && full-upgrade && autoremove && autoclean` |
| **Shell alias** | Settings → `9` or first install | Adds `update-kali` alias to `~/.bashrc` for use outside `l` |
| **Profile backup** | `profiles` → `e` or `pexport` | Tarball of `settings/`, `profiles/`, `ks/` |
| **Profile restore** | `profiles` → `i` or `pimport` | Restore from `.tar.gz` |
| **Tool refresh** | `refresh` or `toolsup` | `git pull` on installed tools in `/root` |
| **WSL2 warning** | automatic on `l` | Alerts if no real WiFi adapter (WSL2 limitation) |
| **Config file** | `settings/lscript.conf` | LPATH, colors, DEFMAC, log limits |
| **Terminal helper** | `lib/lscript_term.sh` | gnome-terminal with xterm fallback everywhere |

---

## Configuration (`settings/lscript.conf`)

Created from `settings/lscript.conf.example` on install:

```ini
LPATH=/root/lscript
DEFMAC=00:11:22:33:44:55
LOG_ROTATE_MAX_MB=10
HANDSHAKE_MAX_FILES=500
COLOR_YS=\e[1;33m
# ... more color keys ...
```

Edit and restart `l` to apply. Logo color can still be overridden via `settings/logocolor.txt`.

---

## Kali system upgrade (`update-kali`)

Equivalent to:

```bash
sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean
```

**Inside lscript (root):**

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
- Auto-detects first install (`i`) vs update (`u`) from `~/.bashrc`
- Skips keypress prompts; does not open a new terminal at the end
- Prints: `Non-interactive install complete. Open a terminal and type: l`

---

## Doctor checks (v2.1.7)

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
├── l                 # main script (type `l` from PATH)
├── lh1–lh43           # handshake, deauth, WPS, WEP helpers
├── ls/                # MITM helpers (l131, l132, l133)
├── lib/
│   ├── lscript_term.sh
│   ├── lscript_conf.sh
│   └── lscript_utils.sh
├── settings/
│   ├── lscript.conf
│   └── lscript.conf.example
├── profiles/          # saved WiFi targets (*.prof)
├── ks/                # keyboard shortcuts
├── backups/           # profile export tarballs
└── install.sh
```

```
/root/handshakes/      # captures (WEP/, deauth/ subdirs)
/root/wordlists/
/usr/local/bin/lscript/  # PATH launchers
```

---

## Platform support

| Environment | WiFi tools | Notes |
|-------------|------------|-------|
| **Kali Linux (bare metal)** | Full | Recommended |
| **Kali VM + USB WiFi passthrough** | Full | Pass adapter to VM |
| **WSL2** | Limited / none | lscript warns on startup; use native Kali instead |

---

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

Current release: **2.1.8** — see [Changelog](Changelog) for full history.
