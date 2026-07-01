#!/usr/bin/env bash
# WSL2 detection, log rotation, profile backup/import.
[[ -n "${LSCRIPT_UTILS_SOURCED:-}" ]] && return 0
LSCRIPT_UTILS_SOURCED=1

lscript_is_wsl()
{
	[[ -f /proc/version ]] && grep -qiE 'microsoft|wsl' /proc/version && return 0
	[[ -n "${WSL_DISTRO_NAME:-}" ]] && return 0
	return 1
}

lscript_has_wifi_adapter()
{
	command -v iwconfig >/dev/null 2>&1 || return 1
	iwconfig 2>/dev/null | grep -q 'IEEE 802.11' && return 0
	return 1
}

lscript_wsl_wifi_warn()
{
	if lscript_is_wsl && ! lscript_has_wifi_adapter
	then
		echo -e "${RS:-\e[1;31m}WSL2 detected: no real wireless adapter visible.${CE:-\e[0m}"
		echo -e "WiFi tools (airmon-ng, handshake capture, etc.) will not work in WSL2."
		echo -e "Use native Kali on bare metal or a VM with USB WiFi passthrough."
		return 1
	fi
	return 0
}

lscript_rotate_file()
{
	local file="$1"
	local max_mb="${2:-10}"
	[[ -f "$file" ]] || return 0
	local size
	size=$(stat -c%s "$file" 2>/dev/null || stat -f%z "$file" 2>/dev/null || echo 0)
	local limit=$((max_mb * 1024 * 1024))
	if [[ "$size" -gt "$limit" ]]
	then
		local rotated="${file}.$(date +%Y%m%d-%H%M%S).bak"
		mv "$file" "$rotated"
		: > "$file"
		echo -e "Rotated $file -> $rotated"
	fi
}

lscript_trim_handshakes()
{
	local dir="${1:-/root/handshakes}"
	local max_files="${HANDSHAKE_MAX_FILES:-500}"
	[[ -d "$dir" ]] || return 0
	local count
	count=$(find "$dir" -type f \( -name '*.cap' -o -name '*.csv' -o -name '*.kismet.csv' \) 2>/dev/null | wc -l)
	if [[ "$count" -le "$max_files" ]]
	then
		return 0
	fi
	local to_delete=$((count - max_files))
	find "$dir" -type f \( -name '*.cap' -o -name '*.csv' -o -name '*.kismet.csv' \) -printf '%T@ %p\n' 2>/dev/null \
		| sort -n | head -n "$to_delete" | cut -d' ' -f2- | while read -r f; do rm -f "$f"; done
	echo -e "Trimmed $to_delete old handshake file(s) (max $max_files)."
}

lscript_rotate_logs()
{
	local max_mb="${LOG_ROTATE_MAX_MB:-10}"
	lscript_rotate_file "$LPATH/doctor.log" "$max_mb"
	lscript_rotate_file "/root/sslstrip.log" "$max_mb"
	lscript_trim_handshakes "/root/handshakes"
}

lscript_backup_profiles()
{
	local dest="${1:-}"
	mkdir -p "$LPATH/settings" "$LPATH/profiles" "$LPATH/ks"
	if [[ -z "$dest" ]]
	then
		dest="$LPATH/backups/lscript-backup-$(date +%Y%m%d-%H%M%S).tar.gz"
	fi
	mkdir -p "$(dirname "$dest")"
	tar -czf "$dest" -C "$LPATH" settings profiles ks 2>/dev/null
	if [[ -f "$dest" ]]
	then
		echo -e "Backup saved: ${YS:-}$dest${CE:-}"
		return 0
	fi
	echo -e "Backup failed."
	return 1
}

lscript_restore_profiles()
{
	local archive="$1"
	if [[ ! -f "$archive" ]]
	then
		echo -e "Archive not found: $archive"
		return 1
	fi
	mkdir -p "$LPATH"
	tar -xzf "$archive" -C "$LPATH" 2>/dev/null
	echo -e "Restored from: $archive"
	return 0
}

lscript_update_kali()
{
	local skip_confirm="${1:-0}"
	local apt_cmd="apt-get"
	command -v apt-get >/dev/null 2>&1 || apt_cmd="apt"

	if [[ $EUID -ne 0 ]]
	then
		echo -e "${RS:-\e[1;31m}Must run as root (or use: sudo l).${CE:-\e[0m}"
		return 1
	fi

	if [[ "$skip_confirm" != "1" ]]
	then
		echo -e "${BS:-\e[0;34m}Full Kali Linux system upgrade${CE:-\e[0m}"
		echo -e "  $apt_cmd update"
		echo -e "  $apt_cmd full-upgrade -y"
		echo -e "  $apt_cmd autoremove -y"
		echo -e "  $apt_cmd autoclean"
		echo -e ""
		echo -e "Continue? (y/n): "
		read -r UKYN
		if [[ "$UKYN" != "y" ]]
		then
			echo -e "Cancelled."
			return 0
		fi
	fi

	echo -e "${YS:-\e[1;33m}[1/4] Updating package lists...${CE:-\e[0m}"
	$apt_cmd update || return 1
	echo -e "${YS:-\e[1;33m}[2/4] Full upgrade (this may take a while)...${CE:-\e[0m}"
	$apt_cmd full-upgrade -y || return 1
	echo -e "${YS:-\e[1;33m}[3/4] Removing unused packages...${CE:-\e[0m}"
	$apt_cmd autoremove -y || return 1
	echo -e "${YS:-\e[1;33m}[4/4] Cleaning package cache...${CE:-\e[0m}"
	$apt_cmd autoclean || return 1
	echo -e "${LGNS:-\e[1;32m}Kali system upgrade complete.${CE:-\e[0m}"
	return 0
}

lscript_install_update_kali_alias()
{
	local bashrc="${HOME}/.bashrc"
	local marker="# lscript update-kali alias"
	[[ -f "$bashrc" ]] || touch "$bashrc"
	if grep -q "alias update-kali=" "$bashrc" 2>/dev/null || grep -q "$marker" "$bashrc" 2>/dev/null
	then
		return 0
	fi
	{
		echo ""
		echo "$marker"
		echo "alias update-kali='sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean'"
	} >> "$bashrc"
	echo -e "Added shell alias ${YS:-}update-kali${CE:-} to $bashrc (open a new terminal to use it)."
}
