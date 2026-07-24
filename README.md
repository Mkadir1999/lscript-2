# lazyscript v2.2.10

**Training toolkit for Kali** — 100+ security tools behind one command: **`lazy`**.

Maintained by **KDR** — [Mkadir1999/lazyscript](https://github.com/Mkadir1999/lazyscript)

<p align="center">
<img src="docs/screenshot.png" alt="lazyscript main menu — by KDR"/>
</p>

---

## Disclaimer — training and educational use only

Use only on systems and networks you **own** or have **explicit written permission** to test. Unauthorized access is illegal. **KDR** accepts no liability for misuse. You use this tool at your own risk.

Full text: **[DISCLAIMER.md](DISCLAIMER.md)**

---

## Quick start

```bash
cd ~
git clone https://github.com/Mkadir1999/lazyscript.git
cd lazyscript
chmod +x install.sh
sudo ./install.sh
# or non-interactive:
sudo ./install.sh --yes

sudo -i
source ~/.bashrc   # first time only
lazy
```

**Launcher:** type **`lazy`** only. The old `l` launcher was removed (it conflicted with `l` = `ls` on Ubuntu/Kali). Details under [Troubleshooting](#troubleshooting).

Direct path: `sudo /usr/local/bin/lscript/lazy`

---

## What you get

| Area | Examples |
|---|---|
| **WiFi** | Handshake capture, WPS/WEP workflows, Fluxion, Wifite, Airgeddon |
| **MITM / labs** | Scoped DNS spoof, ARP MITM, sslstrip helpers, lab audit log |
| **Tools** | Metasploit wizards, OSINT, web fuzzers, modern recon (Nuclei, ffuf, …) |
| **Ops** | `doctor` health check, `safeaudit` reports, `update-kali`, profiles, shortcuts |

Full command reference: **[FEATURES.md](FEATURES.md)**  
Tool-by-tool notes: **[TOOLS.md](TOOLS.md)**  
Installable catalog (100+): type `install` inside `lazy`, or see FEATURES.

### Useful menu hotkeys

| Hotkey | Action |
|---|---|
| `start` / `stop` | Monitor mode on / off |
| `scan` | Network / ARP scan |
| `handshake` / `wps` / `wep` | Wireless attack workflows |
| `spoof` / `lab` / `labcheck` | Training lab menu and checks |
| `doctor` / `safeaudit` | Health check / guided audit |
| `update` / `update-kali` | Update lazyscript / upgrade Kali |
| `install` | Multi-select tool installer |
| `profiles` / `ks` / `rotate` | Profiles, shortcuts, log trim |

---

## Install notes

Made for **Kali Linux** with a real WiFi adapter. Ubuntu on WSL can run the menu and many CLI tools, but not wireless monitor-mode attacks.

The installer copies to `/root/lscript`, installs **`/usr/local/bin/lazy`**, and adds PATH/alias entries for root. Clone with `git` (zip downloads are not supported).

```
/root/lscript/          # install tree (lib/, labs/, helpers, settings/)
/usr/local/bin/lazy     # launcher symlink
/root/handshakes/       # captures
```

---

## Troubleshooting

### `l` only lists files

`l` is not lazyscript — it is usually the shell `ls` alias. Use **`lazy`**.

```bash
sudo -i
source ~/.bashrc
lazy
```

Remove a leftover old launcher if needed:

```bash
sudo rm -f /usr/local/bin/l /usr/local/bin/lscript/l
hash -r
```

### `lazy` not found

```bash
sudo -i
export PATH=/usr/local/bin/lscript:$PATH
hash -r
lazy
```

Or reinstall: `cd ~/lazyscript && sudo ./install.sh --yes`

### Installer: `lscript_term: install gnome-terminal or xterm`

v2.2.4+ continues in the current shell when no GUI terminal is present. If an older copy stopped, run:

```bash
sudo bash /root/lscript/install.sh --yes
```

### Ubuntu on Windows (WSL / WSL2)

| Works | Does not work |
|---|---|
| Menu, install, doctor, many CLI tools | Real WiFi monitor mode / handshake over wireless |
| Wired lab spoof/MITM (scoped) | Reliable USB WiFi passthrough |

Use native Kali (or a VM with USB WiFi) for wireless labs. A WSL warning on startup is expected.

### Syntax errors / `do\r` / BOM (`#!: not found`)

Usually **CRLF** line endings or a **UTF-8 BOM**. Reinstall from git (installer strips both):

```bash
cd ~/lazyscript
git pull
sudo ./install.sh --yes
hash -r
lazy
```

Manual strip if needed:

```bash
sed -i 's/\r$//' /root/lscript/l /usr/local/bin/lscript/lazy
sed -i '1s/^\xEF\xBB\xBF//' /root/lscript/l /usr/local/bin/lscript/lazy
```

### Lab / DNS spoof: `$LPATH/labs/...` not found

Update to **v2.2.7+** and reinstall so lab scripts and the terminal launcher are in sync:

```bash
cd ~/lazyscript
git pull
sudo ./install.sh --yes
hash -r
lazy
```

### Still stuck?

```bash
which lazy
type lazy
ls -la /usr/local/bin/lscript/lazy
sudo /usr/local/bin/lscript/lazy
```

Paste that output in a GitHub issue.

---

## Update / uninstall

**Update**

```bash
lazy          # then type: update
# or
cd /root/lscript && git pull && sudo ./install.sh --yes
```

**Uninstall**

```bash
cd /root/lscript
./uninstall.sh
rm -rf /root/lscript
```

---

## Contributing

- Report bugs via GitHub Issues
- Suggest tools/features in Issues
- Test on Kali 2023+ before PRs

---

**TRAINING / EDUCATIONAL USE ONLY. KDR is not responsible for misuse. You use this tool at your own risk and must comply with all applicable laws.**
