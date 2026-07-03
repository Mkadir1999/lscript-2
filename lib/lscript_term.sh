#!/usr/bin/env bash
# Shared terminal launcher for lscript (gnome-terminal with xterm fallback).
[[ -n "${LSCRIPT_TERM_SOURCED:-}" ]] && return 0
LSCRIPT_TERM_SOURCED=1

lscript_ensure_term()
{
	if command -v gnome-terminal >/dev/null 2>&1 || command -v xterm >/dev/null 2>&1
	then
		return 0
	fi
	if command -v apt-get >/dev/null 2>&1
	then
		apt-get -y install xterm 2>/dev/null || true
		apt-get -y install gnome-terminal 2>/dev/null || true
	fi
	command -v gnome-terminal >/dev/null 2>&1 || command -v xterm >/dev/null 2>&1
}

# lscript_term [--geometry WxH+X+Y] [--title TITLE] [--hold] [--disown] [--quiet] -- COMMAND [ARGS...]
lscript_term()
{
	local geometry="" title="" hold=0 disown_bg=0 quiet=0
	local -a cmd=()

	while [[ $# -gt 0 ]]
	do
		case "$1" in
			--geometry|-g)
				geometry="$2"
				shift 2
				;;
			--title|-T)
				title="$2"
				shift 2
				;;
			--hold)
				hold=1
				shift
				;;
			--disown)
				disown_bg=1
				shift
				;;
			--quiet|-q)
				quiet=1
				shift
				;;
			--)
				shift
				cmd=("$@")
				break
				;;
			*)
				cmd=("$@")
				break
				;;
		esac
	done

	if [[ ${#cmd[@]} -eq 0 ]]
	then
		echo "lscript_term: no command given" >&2
		return 1
	fi

	lscript_ensure_term || {
		echo "lscript_term: install gnome-terminal or xterm" >&2
		return 1
	}

	local run_cmd
	if [[ ${#cmd[@]} -eq 1 ]]
	then
		run_cmd="${cmd[0]}"
	elif [[ ${#cmd[@]} -ge 3 && ( "${cmd[0]}" == "bash" || "${cmd[0]}" == "sh" ) && "${cmd[1]}" == "-c" ]]
	then
		# Preserve an explicit shell command string as-is instead of double-escaping it.
		run_cmd="${cmd[2]}"
	else
		run_cmd=$(printf '%q ' "${cmd[@]}")
		run_cmd=${run_cmd% }
	fi

	if [[ "$hold" -eq 1 ]]
	then
		run_cmd="$run_cmd; exec bash"
	fi

	if command -v gnome-terminal >/dev/null 2>&1
	then
		local -a gt=(--)
		[[ "$quiet" -eq 1 ]] && gt=(-q --)
		[[ -n "$geometry" ]] && gt+=(--geometry "$geometry")
		[[ -n "$title" ]] && gt+=(--title "$title")
		if [[ ${#cmd[@]} -eq 1 && "$cmd[0]" != *" "* ]]
		then
			gt+=("${cmd[@]}")
		else
			gt+=(bash -c "$run_cmd")
		fi
		if [[ "$disown_bg" -eq 1 ]]
		then
			gnome-terminal "${gt[@]}" & disown
		else
			gnome-terminal "${gt[@]}"
		fi
		return 0
	fi

	local -a xt=()
	[[ -n "$geometry" ]] && xt+=(-geometry "$geometry")
	[[ -n "$title" ]] && xt+=(-T "$title")
	[[ "$hold" -eq 1 ]] && xt+=(-hold)
	xt+=(-e bash -c "$run_cmd")
	if [[ "$disown_bg" -eq 1 ]]
	then
		xterm "${xt[@]}" & disown
	else
		xterm "${xt[@]}"
	fi
}

# Back-compat alias used by install.sh
lscript_open_term()
{
	lscript_term -- "$@"
}
