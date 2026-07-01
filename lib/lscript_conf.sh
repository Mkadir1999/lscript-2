#!/usr/bin/env bash
# Load lscript.conf (LPATH, colors, MAC, log limits).
[[ -n "${LSCRIPT_CONF_SOURCED:-}" ]] && return 0
LSCRIPT_CONF_SOURCED=1

LSCRIPT_DEFAULT_LPATH="/root/lscript"

lscript_init_paths()
{
	export LPATH="${LPATH:-$LSCRIPT_DEFAULT_LPATH}"
}

lscript_conf_ensure_file()
{
	local conf="$LPATH/settings/lscript.conf"
	local example="$LPATH/settings/lscript.conf.example"
	mkdir -p "$LPATH/settings"
	if [[ ! -f "$conf" ]]
	then
		if [[ -f "$example" ]]
		then
			cp "$example" "$conf"
		fi
	fi
}

lscript_load_conf()
{
	lscript_init_paths
	lscript_conf_ensure_file
	local conf="$LPATH/settings/lscript.conf"
	[[ -f "$conf" ]] || return 0

	while IFS= read -r line || [[ -n "$line" ]]
	do
		line="${line%%#*}"
		line="${line#"${line%%[![:space:]]*}"}"
		[[ -z "$line" ]] && continue
		local key="${line%%=*}"
		local value="${line#*=}"
		key="${key%"${key##*[![:space:]]}"}"
		value="${value#"${value%%[![:space:]]*}"}"
		value="${value%"${value##*[![:space:]]}"}"
		value="${value%\"}"
		value="${value#\"}"
		value="${value%\'}"
		value="${value#\'}"

		case "$key" in
			LPATH) export LPATH="$value" ;;
			DEFMAC) export DEFMAC="$value" ;;
			LOG_ROTATE_MAX_MB) export LOG_ROTATE_MAX_MB="$value" ;;
			HANDSHAKE_MAX_FILES) export HANDSHAKE_MAX_FILES="$value" ;;
			COLOR_YS) export LSCRIPT_COLOR_YS="$value" ;;
			COLOR_BS) export LSCRIPT_COLOR_BS="$value" ;;
			COLOR_CE) export LSCRIPT_COLOR_CE="$value" ;;
			COLOR_RS) export LSCRIPT_COLOR_RS="$value" ;;
			COLOR_BLS) export LSCRIPT_COLOR_BLS="$value" ;;
			COLOR_DGYS) export LSCRIPT_COLOR_DGYS="$value" ;;
			COLOR_LBS) export LSCRIPT_COLOR_LBS="$value" ;;
			COLOR_GNS) export LSCRIPT_COLOR_GNS="$value" ;;
			COLOR_LGNS) export LSCRIPT_COLOR_LGNS="$value" ;;
			COLOR_CYS) export LSCRIPT_COLOR_CYS="$value" ;;
			COLOR_LCYS) export LSCRIPT_COLOR_LCYS="$value" ;;
			COLOR_DRS) export LSCRIPT_COLOR_DRS="$value" ;;
			COLOR_PS) export LSCRIPT_COLOR_PS="$value" ;;
			COLOR_LPS) export LSCRIPT_COLOR_LPS="$value" ;;
			COLOR_BRS) export LSCRIPT_COLOR_BRS="$value" ;;
			COLOR_LGYS) export LSCRIPT_COLOR_LGYS="$value" ;;
			COLOR_WHS) export LSCRIPT_COLOR_WHS="$value" ;;
			COLOR_LOGO) export LSCRIPT_COLOR_LOGO="$value" ;;
		esac
	done < "$conf"
}

lscript_apply_colors()
{
	YS="${LSCRIPT_COLOR_YS:-\e[1;33m}"
	BS="${LSCRIPT_COLOR_BS:-\e[0;34m}"
	CE="${LSCRIPT_COLOR_CE:-\e[0m}"
	RS="${LSCRIPT_COLOR_RS:-\e[1;31m}"
	BLS="${LSCRIPT_COLOR_BLS:-\e[0;30m}"
	DGYS="${LSCRIPT_COLOR_DGYS:-\e[1;30m}"
	LBS="${LSCRIPT_COLOR_LBS:-\e[1;34m}"
	GNS="${LSCRIPT_COLOR_GNS:-\e[0;32m}"
	LGNS="${LSCRIPT_COLOR_LGNS:-\e[1;32m}"
	CYS="${LSCRIPT_COLOR_CYS:-\e[0;36m}"
	LCYS="${LSCRIPT_COLOR_LCYS:-\e[1;36m}"
	DRS="${LSCRIPT_COLOR_DRS:-\e[0;31m}"
	PS="${LSCRIPT_COLOR_PS:-\e[0;35m}"
	LPS="${LSCRIPT_COLOR_LPS:-\e[1;35m}"
	BRS="${LSCRIPT_COLOR_BRS:-\e[0;33m}"
	LGYS="${LSCRIPT_COLOR_LGYS:-\e[0;37m}"
	WHS="${LSCRIPT_COLOR_WHS:-\e[1;37m}"
	export YS BS CE RS BLS DGYS LBS GNS LGNS CYS LCYS DRS PS LPS BRS LGYS WHS
}

lscript_apply_defaults()
{
	export DEFMAC="${DEFMAC:-00:11:22:33:44:55}"
	export LOG_ROTATE_MAX_MB="${LOG_ROTATE_MAX_MB:-10}"
	export HANDSHAKE_MAX_FILES="${HANDSHAKE_MAX_FILES:-500}"
}
