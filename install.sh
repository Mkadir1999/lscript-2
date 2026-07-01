#! /bin/bash
clear
printf '\033]2;INSTALLER\a'

NONINTERACTIVE=0
for _arg in "$@"
do
	case "$_arg" in
		--yes|-y|--non-interactive) NONINTERACTIVE=1 ;;
	esac
done
unset _arg

if [[ $EUID -ne 0 ]]
then
	echo -e "lscript must be installed as root. Run: sudo ./install.sh"
	exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [[ -f "$DIR/lib/lscript_term.sh" ]]
then
	# shellcheck source=/dev/null
	source "$DIR/lib/lscript_term.sh"
else
	lscript_term()
	{
		local cmd="$1"
		if command -v gnome-terminal >/dev/null 2>&1
		then
			gnome-terminal -- bash -c "$cmd; exec bash"
		elif command -v xterm >/dev/null 2>&1
		then
			xterm -e bash -c "$cmd; exec bash"
		else
			apt-get -y install xterm 2>/dev/null || true
			xterm -e bash -c "$cmd; exec bash"
		fi
	}
	lscript_open_term()
	{
		lscript_term "$@"
	}
fi

if [[ "$NONINTERACTIVE" -eq 0 ]]
then
	echo -e "Press \e[1;33many key\e[0m to install the script..."
	read -r -n 1
fi
clear

lscript_ensure_term 2>/dev/null || {
	if ! command -v gnome-terminal >/dev/null 2>&1 && ! command -v xterm >/dev/null 2>&1
	then
		apt-get -y install xterm 2>/dev/null || true
		apt-get -y install gnome-terminal 2>/dev/null || true
	fi
}

clear
if [[ "$DIR" != "/root/lscript" ]]
then
	echo -e "You didn't follow the github's simple install instructions.I will try to do it for you..."
	[[ "$NONINTERACTIVE" -eq 0 ]] && sleep 4
	if [[ -d /root/lscript ]]
	then
		rm -r /root/lscript
	fi
	mkdir -p /root/lscript
	cp -r "$DIR"/* /root/lscript
	chmod +x /root/lscript/install.sh
	chmod +x /root/lscript/lib/*.sh 2>/dev/null || true
	if [[ "$NONINTERACTIVE" -eq 1 ]]
	then
		bash /root/lscript/install.sh --yes
	else
		lscript_open_term "bash /root/lscript/install.sh"
	fi
	exit 0
fi

echo -e "Installing lscript..."
sleep 1
echo -e "Fixing permissions"
sleep 2
chmod +x /root/lscript/lh1
chmod +x /root/lscript/lh2
chmod +x /root/lscript/lh3
chmod +x /root/lscript/lh31
chmod +x /root/lscript/l
chmod +x /root/lscript/lh4
chmod +x /root/lscript/lh41
chmod +x /root/lscript/lh21
chmod +x /root/lscript/lh42
chmod +x /root/lscript/lh43
chmod +x /root/lscript/ls/l131.sh
chmod +x /root/lscript/ls/l132.sh
chmod +x /root/lscript/ls/l133.sh
chmod +x /root/lscript/uninstall.sh
chmod +x /root/lscript/lib/*.sh 2>/dev/null || true
clear
echo -e "Copying script to /usr/local/bin/lscript"
sleep 1
mkdir -p /usr/local/bin/lscript
cd /root/lscript
cp /root/lscript/l /usr/local/bin/lscript
cp /root/lscript/lh1 /usr/local/bin/lscript
cp /root/lscript/lh2 /usr/local/bin/lscript
cp /root/lscript/lh3 /usr/local/bin/lscript
cp /root/lscript/lh31 /usr/local/bin/lscript
cp /root/lscript/lh4 /usr/local/bin/lscript
cp /root/lscript/lh41 /usr/local/bin/lscript
cp /root/lscript/lh21 /usr/local/bin/lscript
cp /root/lscript/lh42 /usr/local/bin/lscript
cp /root/lscript/lh43 /usr/local/bin/lscript
clear
apt-get -y install ncurses-dev 2>/dev/null || true
clear
if [[ ! -d /root/handshakes ]]
then
	mkdir -p /root/handshakes/WEP /root/handshakes/deauth 2>/dev/null || mkdir -p /root/handshakes
	echo -e "Made /root/handshakes directory"
else
	mkdir -p /root/handshakes/WEP /root/handshakes/deauth 2>/dev/null
	echo -e "/root/handshakes directory detected.Good."
fi
if [[ ! -d /root/wordlists ]]
then
	mkdir -p /root/wordlists
	echo -e "Made /root/wordlists directory"
else
	echo -e "/root/wordlists directory detected.Good."
fi
mkdir -p /root/lscript/settings /root/lscript/profiles /root/lscript/ks /root/lscript/backups /root/lscript/lib
if [[ ! -f /root/lscript/settings/lscript.conf && -f /root/lscript/settings/lscript.conf.example ]]
then
	cp /root/lscript/settings/lscript.conf.example /root/lscript/settings/lscript.conf
	echo -e "Created default settings/lscript.conf"
fi

if [[ "$NONINTERACTIVE" -eq 1 ]]
then
	if grep -q "bin/lscript" ~/.bashrc 2>/dev/null
	then
		UORI="u"
	else
		UORI="i"
	fi
else
	UORI=""
	while true
	do
		clear
		echo -e "Are you \e[1;33mu\e[0mpdating or \e[1;33mi\e[0mnstalling the script?(\e[1;33mu\e[0m/\e[1;33mi\e[0m): "
		echo -e "Only use 'i' for the first time."
		read -r UORI
		if [[ "$UORI" = "u" || "$UORI" = "i" ]]
		then
			break
		fi
	done
fi

if [[ "$UORI" = "u" ]]
then
	clear
	echo -e "Type 'changelog' to see what's new on this version"
	[[ "$NONINTERACTIVE" -eq 0 ]] && sleep 3
elif [[ "$UORI" = "i" ]]
then
	clear
	if grep -q "bin/lscript" ~/.bashrc 2>/dev/null
	then
		echo -e "PATH already configured in .bashrc (skipping duplicate export)."
		[[ "$NONINTERACTIVE" -eq 0 ]] && sleep 2
	fi
	echo -e "Adding lscript to PATH so you can access it from anywhere"
	export PATH=/usr/local/bin/lscript:$PATH
	if ! grep -q "/usr/local/bin/lscript" ~/.bashrc 2>/dev/null
	then
		echo "export PATH=/usr/local/bin/lscript:\$PATH" >> ~/.bashrc
	fi
	if [[ -f /root/lscript/lib/lscript_utils.sh ]]
	then
		# shellcheck source=/dev/null
		source /root/lscript/lib/lscript_utils.sh
		lscript_install_update_kali_alias
	fi
	[[ "$NONINTERACTIVE" -eq 0 ]] && sleep 1
	clear
fi

clear
echo -e "DONE"
if [[ "$NONINTERACTIVE" -eq 1 ]]
then
	echo -e "Non-interactive install complete. Open a terminal and type: l"
	exit 0
fi
sleep 1
clear
echo -e "Open a NEW terminal and type 'l' to launch the script"
sleep 4
lscript_open_term "l"
exit
