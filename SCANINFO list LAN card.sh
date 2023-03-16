#!/bin/bash
#!/usr/bin/ffmpeg
## -----===== Start of bash =====-----
	#printf '\033[8;50;80t'		# will resize the window, if needed.
	printf '\033[8;50;90t'		# will resize the window, if needed.
	sleep 0.50
	## "NEVER remove dual ## in front of lines. Theses are code annotations."
	## "You can test / remove single # for testing purpose."
	echo

echo -------------------------========================-------------------------
	start=$SECONDS
	now=$(date +"%Y-%m-%d_%A_%H:%M:%S")
	red=`tput setaf 1`
	green=`tput setaf 2`
	yellow=`tput setaf 11`
	blue=`tput setaf 12`
	reset=`tput sgr0`
	## All variables 0 or 1
	autoquit=0	# autoquit anyway to script takes LESS than 2 min to complete.
	debug=0		# test debug
	error=0		# test error
	part=0		# don't change this value
	noquit=1	# No quit after all operations.
	random=$RANDOM	# Used for temp folders
	echo "Software lead-in. LostByteSoft ; https://github.com/LostByteSoft"
	echo
	echo "Current time : $now"
	echo "Common variables, you can changes theses variables as you wish to test."
	echo
	echo "Debug data : autoquit=$autoquit debug=$debug error=$error part=$part noquit=$noquit random=$random"

echo -------------------------========================-------------------------
echo These 2 softwares are required but not mandatory to give all LAN data.
	echo


if command -v netstat >/dev/null 2>&1
	then
		echo "netstat installed continue."
		#dpkg -s netstat | grep Version
		echo "${green} ████████████████ OK ████████████████ ${reset}"
		netstat=1
	else
		echo "You don't have ' netstat ' installed."
		echo "Add with : sudo apt-get install netstat"
		echo
		echo "${red}████████████████ Dependency error ████████████████${reset}"
		netstat=0
		echo
	fi

if command -v ethtool >/dev/null 2>&1
	then
		echo "ethtool installed continue."
		#dpkg -s ethtool | grep Version
		echo "${green} ████████████████ OK ████████████████ ${reset}"
		ethtool=1
	else
		echo "You don't have ' ethtool ' installed."
		echo "Add with : sudo apt-get install ethtool"
		echo
		echo "${red}████████████████ Dependency error ████████████████${reset}"
		ethtool=0
		echo
	fi

echo -------------------------========================-------------------------
	echo Version compiled on : Also serves as a version
	echo 2023-02-28
	echo
	## Software name, what is this, version, informations.
	echo Name : "ListLanCard"
	echo What it does ?
	echo "Show all lan card and informations"
	echo
	echo "Informations : (EULA at the end of file, open in text.)"
	echo "By LostByteSoft, no copyright or copyleft. https://github.com/LostByteSoft"
	echo
	echo "Don't hack paid software, free software exists and does the job better."
	echo

echo -------------------------========================-------------------------
	hostname -A
	name=$HOSTNAME
	rm "/dev/shm/ScanInfo_LAN_$name.txt" 2> /dev/null
	echo --------------------======= START =======-------------------- >> /dev/shm/ScanInfo_LAN_$name.txt
	echo "Local name(s); if you have multiples card you will have multiples names here."
	echo "Pc Name:"
	echo "Local name(s); if you have multiples card you will have multiples names here." >> /dev/shm/ScanInfo_LAN_$name.txt
	echo "Pc Name:" >> /dev/shm/ScanInfo_LAN_$name.txt
	echo "	" >> /dev/shm/ScanInfo_LAN_$name.txt
	hostname -A
	hostname -A >> /dev/shm/ScanInfo_LAN_$name.txt
	echo "	" >> /dev/shm/ScanInfo_LAN_$name.txt
	echo
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_LAN_$name.txt

echo -------------------------========================-------------------------
	echo Machine informations:
	echo Machine informations: >> /dev/shm/ScanInfo_LAN_$name.txt
	hostnamectl
	hostnamectl >> /dev/shm/ScanInfo_LAN_$name.txt
	echo "	" >> /dev/shm/ScanInfo_LAN_$name.txt
	echo
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_LAN_$name.txt

echo -------------------------========================-------------------------
	echo "External ip:"
	echo "External ip:" >> /dev/shm/ScanInfo_LAN_$name.txt
	dig @resolver4.opendns.com myip.opendns.com +short
	dig @resolver4.opendns.com myip.opendns.com +short >> /dev/shm/ScanInfo_LAN_$name.txt
	echo "	" >> /dev/shm/ScanInfo_LAN_$name.txt
	echo "Dns server:"
	echo "Dns server:" >> /dev/shm/ScanInfo_LAN_$name.txt
	cat /etc/resolv.conf
	cat /etc/resolv.conf  >> /dev/shm/ScanInfo_LAN_$name.txt
	echo "	" >> /dev/shm/ScanInfo_LAN_$name.txt
	echo
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_LAN_$name.txt

echo -------------------------========================-------------------------
	echo "Root ip:"
	echo "Root ip:" >> /dev/shm/ScanInfo_LAN_$name.txt
	hostname -i
	hostname -i >> /dev/shm/ScanInfo_LAN_$name.txt
	echo "	" >> /dev/shm/ScanInfo_LAN_$name.txt
	echo
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_LAN_$name.txt

echo -------------------------========================-------------------------
	echo "Local ip(s):"
	echo "Local ip(s):" >> /dev/shm/ScanInfo_LAN_$name.txt
	hostname -I
	hostname -I >> /dev/shm/ScanInfo_LAN_$name.txt
	echo "	" >> /dev/shm/ScanInfo_LAN_$name.txt
	
	LAN=$(ip -br l | awk '$1 !~ "lo|vir|wl" { print $1}')
	
	echo "Lacal ip v6:"
	echo "Lacal ip v6:" >> /dev/shm/ScanInfo_LAN_$name.txt
	echo
	echo "	" >> /dev/shm/ScanInfo_LAN_$name.txt
	ip addr show dev $LAN | sed -e's/^.*inet6 \([^ ]*\)\/.*$/\1/;t;d'
	ip addr show dev $LAN | sed -e's/^.*inet6 \([^ ]*\)\/.*$/\1/;t;d' >> /dev/shm/ScanInfo_LAN_$name.txt
	#echo "ip addr show dev $LAN | sed -e's/^.*inet6 \([^ ]*\)\/.*$/\1/;t;d'" >> /dev/shm/ScanInfo_LAN_$name.txt
	echo "	" >> /dev/shm/ScanInfo_LAN_$name.txt
	
	echo Ip v6 address:
	echo Ip v6 address: >> /dev/shm/ScanInfo_LAN_$name.txt
	ip -6 addr
	ip -6 addr >> /dev/shm/ScanInfo_LAN_$name.txt
	echo "	" >> /dev/shm/ScanInfo_LAN_$name.txt
	echo
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_LAN_$name.txt

echo -------------------------========================-------------------------
	echo "MAC adress; if you have multiples card you will have multiples mac here."
	echo MAC adress:
	echo MAC adress: >> /dev/shm/ScanInfo_LAN_$name.txt
	cat /sys/class/net/*/address
	cat /sys/class/net/*/address >> /dev/shm/ScanInfo_LAN_$name.txt
	echo "	" >> /dev/shm/ScanInfo_LAN_$name.txt
	echo
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_LAN_$name.txt

echo -------------------------========================-------------------------
	echo "Gateway + link speed"
	echo "Gateway + link speed" >> /dev/shm/ScanInfo_LAN_$name.txt
	ip route
	ip route >> /dev/shm/ScanInfo_LAN_$name.txt
	echo "	" >> /dev/shm/ScanInfo_LAN_$name.txt

	name1=$(ip -br l | awk '$1 !~ "lo|vir|wl" { print $1}')
	speed1=$(cat /sys/class/net/$name1/speed)

	echo "Speed : $speed1"
	echo "Speed : $speed1" >> /dev/shm/ScanInfo_LAN_$name.txt
	echo "	" >> /dev/shm/ScanInfo_LAN_$name.txt
	echo
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_LAN_$name.txt

echo -------------------------========================-------------------------
echo Kernel Interface table
	echo

if [ "$netstat" -eq 0 ]; then
		echo "Add with : sudo apt-get install netstat for more informations."
		echo "Add with : sudo apt-get install netstat for more informations." >> /dev/shm/ScanInfo_LAN_$name.txt
		echo
		echo "	" >> /dev/shm/ScanInfo_LAN_$name.txt
	else
		echo netstat -i:
		echo netstat -i: >> /dev/shm/ScanInfo_LAN_$name.txt
		netstat -i
		netstat -i >> /dev/shm/ScanInfo_LAN_$name.txt
		echo
		echo "	" >> /dev/shm/ScanInfo_LAN_$name.txt
		echo --------------------===================-------------------- >> /dev/shm/ScanInfo_LAN_$name.txt
		echo
		echo "	" >> /dev/shm/ScanInfo_LAN_$name.txt
	fi
	
	echo "eno1 is the onboard Ethernet (wired) adapter. lo is a loopback device, You can imagine it"
	echo "as a virtual network device that is on all systems, even if they aren't connected to any network."
	echo "	" >> /dev/shm/ScanInfo_LAN_$name.txt
	echo

echo -------------------------========================-------------------------
	echo Ip route:
	echo Ip route: >> /dev/shm/ScanInfo_LAN_$name.txt
	#routerip1=$(ip route show 0.0.0.0/0 dev eno1 | cut -d\  -f3)
	routerip1=$(ip route show 0.0.0.0/0)
	routerip1=$(ip route show 0.0.0.0/0) >> /dev/shm/ScanInfo_LAN_$name.txt
	echo Route 1 : $routerip1
	echo Route 1 : $routerip1 >> /dev/shm/ScanInfo_LAN_$name.txt
	echo "	" >> /dev/shm/ScanInfo_LAN_$name.txt
	echo
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_LAN_$name.txt

echo -------------------------========================-------------------------
	echo "Lan card(s):"
	echo "Lan card(s):" >> /dev/shm/ScanInfo_LAN_$name.txt
	lspci | egrep -i --color 'network|ethernet'
	lspci | egrep -i --color 'network|ethernet' >> /dev/shm/ScanInfo_LAN_$name.txt
	echo "	" >> /dev/shm/ScanInfo_LAN_$name.txt
	echo
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_LAN_$name.txt

echo -------------------------========================-------------------------
	echo "Wake On Lan: (Only wired is monitored here)"
	echo "Wake On Lan: (Only wired is monitored here)" >> /dev/shm/ScanInfo_LAN_$name.txt
	echo
	echo "	" >> /dev/shm/ScanInfo_LAN_$name.txt
	echo "Not working without password"
	echo "Not working without password" >> /dev/shm/ScanInfo_LAN_$name.txt
	
	## to get the lan system name
	lan_inter=$(ip route get 8.8.8.8 | awk -- '{printf $5}')
	echo
	echo "	" >> /dev/shm/ScanInfo_LAN_$name.txt
	echo "Type: sudo ethtool $lan_inter | grep -i wake"
	echo "Type: sudo ethtool $lan_inter | grep -i wake" >> /dev/shm/ScanInfo_LAN_$name.txt
	echo
	echo "	" >> /dev/shm/ScanInfo_LAN_$name.txt
	echo sudo ethtool $LAN | grep -i wake
	echo ethtool $lan_inter | grep -i wake >> /dev/shm/ScanInfo_LAN_$name.txt
	echo
	echo "	" >> /dev/shm/ScanInfo_LAN_$name.txt
	echo sudo gedit /etc/systemd/network/50-wired.link
	echo sudo gedit /etc/systemd/network/50-wired.link >> /dev/shm/ScanInfo_LAN_$name.txt
	echo
	echo "	" >> /dev/shm/ScanInfo_LAN_$name.txt
	cat /etc/systemd/network/50-wired.link
	cat /etc/systemd/network/50-wired.link >> /dev/shm/ScanInfo_LAN_$name.txt
	
	echo
	echo "	" >> /dev/shm/ScanInfo_LAN_$name.txt
	echo --------------------======= END =======-------------------- >> /dev/shm/ScanInfo_LAN_$name.txt

echo -------------------------========================-------------------------
	echo Saving...
	echo To name : $HOME/Desktop/ScanInfo_HARD_$name.txt
	if zenity --no-wrap --question --text="Do you want to save informations on desktop ? (Yes or No (Suggest Yes))\n\n\tIf you choose yes the program will close automatically."
		then
			cp /dev/shm/ScanInfo_LAN_$name.txt /$HOME/Desktop/ScanInfo_LAN_$name.txt
			autoquit=1
			noquit=0
			fi
	rm "/dev/shm/ScanInfo_LAN_$name.txt" 2> /dev/null
echo -------------------------========================-------------------------
## Software lead out
	echo "This script take $(( SECONDS - start )) seconds to complete."
	date=$(date -d@$(( SECONDS - start )) -u +%H:%M:%S)
	echo "Time needed: $date"
	now=$(date +"%Y-%m-%d_%A_%I:%M:%S")
	echo "Current time : $now"
echo -------------------------========================-------------------------
	echo "If a script takes MORE than 120 seconds to complete it will ask"
	echo "you to press ENTER to terminate."
	echo
	echo "If a script takes LESS than 120 seconds to complete it will auto"
	echo "terminate after 10 seconds"
echo -------------------------========================-------------------------
## Software lead out
	echo "Finish... with numbers of actions : $part"
	echo "This script take $(( SECONDS - start )) seconds to complete."
	date=$(date -d@$(( SECONDS - start )) -u +%H:%M:%S)
	echo "Time needed: $date"
	now=$(date +"%Y-%m-%d_%A_%I:%M:%S")
	echo "Current time : $now"
	echo
echo -------------------------========================-------------------------
	echo "If a script takes MORE than 120 seconds to complete it will ask"
	echo "you to press ENTER to terminate."
	echo
	echo "If a script takes LESS than 120 seconds to complete it will auto"
	echo "terminate after 10 seconds"
echo -------------------------========================-------------------------
## Exit, wait or auto-quit.
	if [ "$noquit" -eq "1" ]; then
		echo
		echo "${blue}	█████████████████ NO exit activated ███████████████████${reset}"
		echo
		read -n 1 -s -r -p "Press ENTER key to exit !"
		exit
		fi

	if [ "$autoquit" -eq "1" ]
		then
			echo
			echo "${green}	███████████████ Finish, quit in 3 seconds █████████████████${reset}"
			echo
			sleep 2
			echo
		else
		{
			if [ "$debug" -eq "1" ]; then
				echo
				echo "${blue}		█████ DEBUG WAIT | Program finish. █████${reset}"
				echo
				echo "Debug data : autoquit=$autoquit debug=$debug error=$error part=$part noquit=$noquit random=$random"
				echo
				read -n 1 -s -r -p "Press ENTER key to continue !"
				echo
			fi
		if [ $(( SECONDS - start )) -gt 120 ]
			then
				echo
				echo "Script takes more than 120 seconds to complete."
				echo
				echo "${blue}	█████████████████████ Finish ███████████████████████${reset}"
				echo
				read -n 1 -s -r -p "Press ENTER key to exit !"
				echo
			else
				echo
				echo "Script takes less than 120 seconds to complete."
				echo
				echo "${green}	█████████████████████ Finish ███████████████████████${reset}"
				echo
				echo "Auto-quit in 3 sec. (You can press X)"
				echo
				sleep 3
			fi
		}
		fi
	exit

## -----===== End of bash =====-----

	End-user license agreement (eula)

 	JUST DO WHAT THE F*** YOU WANT WITH THE PUBLIC LICENSE
 	
 	Version 3.1415926532 (January 2022)
 	
 	TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
    	
	Everyone is permitted to copy and distribute verbatim or modified copies of
 	this license document.
 	
 	As is customary and in compliance with current global and interplanetary
 	regulations, the author of these pages disclaims all liability for the
 	consequences of the advice given here, in particular in the event of partial
 	or total destruction of the material, Loss of rights to the manufacturer
 	warranty, electrocution, drowning, divorce, civil war, the effects of radiation
 	due to atomic fission, unexpected tax recalls or encounters with
 	extraterrestrial beings elsewhere.
 	
 	YOU MUST ACCEPT THESES TERMS OR NOTHING WILL HAPPEN.
 	
 	LostByteSoft no copyright or copyleft we are in the center.
 	
 	You can send your request and your Christmas wishes to this address:
 	
 		Père Noël
 		Pôle Nord, Canada
 		H0H 0H0

## -----===== End of file =====-----

