#! /bin/bash
cd ~ 2>/dev/null || cd
if [[ ! -d ~/dns2proxy ]]
then
	echo -e "dns2proxy not found. Install it via the tools menu."
	exit 1
fi
cd ~/dns2proxy
python3 dns2proxy.py
read -r
