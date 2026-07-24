#!/usr/bin/env bash
# Lab scope, audit log, and educational-use guards for spoof/MITM tools.
[[ -n "${LSCRIPT_LAB_SOURCED:-}" ]] && return 0
LSCRIPT_LAB_SOURCED=1

LSCRIPT_LAB_SCOPE_FILE="${LPATH:-/root/lscript}/settings/lab_scope.txt"
LSCRIPT_LAB_AUDIT_LOG="${LPATH:-/root/lscript}/logs/lab_audit.log"

lscript_lab_refresh_paths()
{
	export LSCRIPT_LAB_SCOPE_FILE="${LPATH:-/root/lscript}/settings/lab_scope.txt"
	export LSCRIPT_LAB_AUDIT_LOG="${LPATH:-/root/lscript}/logs/lab_audit.log"
}

lscript_lab_ensure_dirs()
{
	lscript_lab_refresh_paths
	mkdir -p "${LPATH:-/root/lscript}/labs" "${LPATH:-/root/lscript}/logs" "${LPATH:-/root/lscript}/settings"
	if [[ ! -f "${LPATH}/settings/lab_scope.example" ]]
	then
		cat > "${LPATH}/settings/lab_scope.example" <<'EOF'
# Allowed target IPs for spoof/MITM lab tools (one per line).
# Lines starting with # are ignored. Empty file = no IP restriction (lab use only).
# 192.168.1.50
# 10.0.0.100
EOF
	fi
	[[ -f "$LSCRIPT_LAB_SCOPE_FILE" ]] || touch "$LSCRIPT_LAB_SCOPE_FILE"
}

lscript_open_text_file()
{
	local target="$1"
	mousepad "$target" 2>/dev/null || gedit "$target" 2>/dev/null || nano "$target"
}

lscript_lab_audit()
{
	local action="$1"
	local detail="${2:-}"
	lscript_lab_ensure_dirs
	{
		echo "$(date -Iseconds 2>/dev/null || date) | action=$action | user=$(whoami) | $detail"
	} >> "$LSCRIPT_LAB_AUDIT_LOG"
}

lscript_lab_scope_is_set()
{
	lscript_lab_ensure_dirs
	local line
	while IFS= read -r line || [[ -n "$line" ]]
	do
		line="${line%%#*}"
		line="${line#"${line%%[![:space:]]*}"}"
		line="${line%"${line##*[![:space:]]}"}"
		[[ -n "$line" ]] && return 0
	done < "$LSCRIPT_LAB_SCOPE_FILE"
	return 1
}

lscript_lab_ip_in_scope()
{
	local ip="$1"
	[[ -n "$ip" ]] || return 1
	if ! lscript_lab_scope_is_set
	then
		return 0
	fi
	local line
	while IFS= read -r line || [[ -n "$line" ]]
	do
		line="${line%%#*}"
		line="${line#"${line%%[![:space:]]*}"}"
		line="${line%"${line##*[![:space:]]}"}"
		[[ -z "$line" ]] && continue
		if [[ "$line" == "$ip" ]]
		then
			return 0
		fi
		if [[ "$line" == */* ]]
		then
			local base="${line%/*}"
			local prefix="${line#*/}"
			local a b c d ea eb ec ed
			IFS=. read -r a b c d <<< "$ip"
			IFS=. read -r ea eb ec ed <<< "$base"
			case "$prefix" in
				32)
					[[ "$ip" == "$base" ]] && return 0
					;;
				24)
					[[ "$a.$b.$c" == "$ea.$eb.$ec" ]] && return 0
					;;
				16)
					[[ "$a.$b" == "$ea.$eb" ]] && return 0
					;;
				8)
					[[ "$a" == "$ea" ]] && return 0
					;;
				*)
					# Unsupported prefix lengths: exact IP match only (already checked).
					;;
			esac
		fi
	done < "$LSCRIPT_LAB_SCOPE_FILE"
	return 1
}

lscript_lab_require_scope()
{
	local ip="$1"
	local label="${2:-target}"
	if lscript_lab_ip_in_scope "$ip"
	then
		return 0
	fi
	echo -e "${RS:-\e[1;31m}$label IP $ip is not in lab scope.${CE:-\e[0m}"
	echo -e "Add it in spoof menu → Lab scope, or edit $LSCRIPT_LAB_SCOPE_FILE"
	return 1
}

lscript_lab_training_banner()
{
	echo -e "${RS:-\e[1;31m}LAB / TRAINING USE ONLY${CE:-\e[0m} — authorized targets only. ${LSCRIPT_AUTHOR:-KDR} accepts no liability."
}
