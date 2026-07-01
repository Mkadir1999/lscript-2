#! /bin/bash
function nouninstall
{
	echo -e "I knew you are still lazy :D :D "
	sleep 2
	echo -e "If you want any feature to be added, contact me on FB"
	sleep 2
	echo -e " "
	echo -e "Aris"
	sleep 1
	exit
}
echo -e "Do you really want to uninstall the Lazy script from your system?(y/n)(Enter=no): "
read -r CHUN
if [ "$CHUN" = "y" ]
then
	echo -e "If you have any problems please contact me first."
	echo -e "Do you still wanna get rid of me?(y/n)(Enter=no): "
	read -r CHCHUN
	if [ "$CHCHUN" = "y" ]
	then
		echo -e "Ok, uninstalling everything that has to do with lscript on your system"
		sleep 4
		if [ -d /usr/local/bin/lscript ]; then rm -r /usr/local/bin/lscript; fi
		if [ -d /bin/lscript ]; then rm -r /bin/lscript; fi
		if grep -q "/usr/local/bin/lscript" ~/.bashrc 2>/dev/null
		then
			sed -i 's|export PATH=/usr/local/bin/lscript:$PATH||g' ~/.bashrc
		fi
		if grep -q "/bin/lscript" ~/.bashrc 2>/dev/null
		then
			sed -i 's|export PATH=/bin/lscript:$PATH||g' ~/.bashrc
		fi
		echo -e "Done."
		sleep 1
		echo -e "You need to manually delete the lscript folder from your /root/ directory though..."
		sleep 2
		echo -e "Press any key to exit..."
		read -r
		exit
	else
		nouninstall
	fi
else
	nouninstall
fi
