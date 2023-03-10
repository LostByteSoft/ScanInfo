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
	echo Version compiled on : Also serves as a version
	echo 2023-02-28
	echo
	## Software name, what is this, version, informations.
	echo Name : "Hardware infos"
	echo What it does ?
	echo "Show hardware and informations"
	echo
	echo "Informations : (EULA at the end of file, open in text.)"
	echo "By LostByteSoft, no copyright or copyleft. https://github.com/LostByteSoft"
	echo
	echo "Don't hack paid software, free software exists and does the job better."
	echo

echo -------------------------========================-------------------------
	echo "Local name(s); if you have multiples card you will have multiples names here."
	echo "Pc Name:"
	hostname -A
	name=$HOSTNAME
	rm "/dev/shm/ScanInfo_HARD_$name.txt" 2> /dev/null
	echo --------------------======= START =======-------------------- >> /dev/shm/ScanInfo_HARD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HARD_$name.txt
	echo "Show hardware and informations" >> /dev/shm/ScanInfo_HARD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HARD_$name.txt
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_HARD_$name.txt
	echo "Pc Name:"  >> /dev/shm/ScanInfo_HARD_$name.txt
	hostname -A >> /dev/shm/ScanInfo_HARD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HARD_$name.txt
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_HARD_$name.txt

echo -------------------------========================-------------------------
	hostnamectl
	hostnamectl >> /dev/shm/ScanInfo_HARD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HARD_$name.txt
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_HARD_$name.txt
	
echo -------------------------========================-------------------------
	echo "Cpu infos :"
	echo "Cpu infos :" >> /dev/shm/ScanInfo_HARD_$name.txt
	cat /proc/cpuinfo | grep 'vendor' | uniq		#view vendor name
	cat /proc/cpuinfo | grep 'model name' | uniq		#display model name
	cat /proc/cpuinfo | grep processor | wc -l		#count the number of processing units
	cat /proc/cpuinfo | grep 'core id'			#show individual cores
	cat /proc/cpuinfo | grep 'vendor' | uniq >> /dev/shm/ScanInfo_HARD_$name.txt
	cat /proc/cpuinfo | grep 'model name' | uniq >> /dev/shm/ScanInfo_HARD_$name.txt
	cat /proc/cpuinfo | grep processor | wc -l >> /dev/shm/ScanInfo_HARD_$name.txt
	cat /proc/cpuinfo | grep 'core id' >> /dev/shm/ScanInfo_HARD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HARD_$name.txt
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_HARD_$name.txt
	echo "Cpu infos complete :"
	echo "Cpu infos complete :" >> /dev/shm/ScanInfo_HARD_$name.txt
	lscpu >> /dev/shm/ScanInfo_HARD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HARD_$name.txt
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_HARD_$name.txt

echo -------------------------========================-------------------------
	echo "Memory infos:"
	echo "Memory infos:" >> /dev/shm/ScanInfo_HARD_$name.txt
	free -m
	free -m >> /dev/shm/ScanInfo_HARD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HARD_$name.txt
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_HARD_$name.txt
	
echo -------------------------========================-------------------------
	echo "Gpu infos:"
	echo "Gpu infos:" >> /dev/shm/ScanInfo_HARD_$name.txt
	glxinfo | grep "Device"
	glxinfo | grep "Device" >> /dev/shm/ScanInfo_HARD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HARD_$name.txt
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_HARD_$name.txt
	lspci  -v -s  $(lspci | grep ' VGA ' | cut -d" " -f 1)
	lspci  -v -s  $(lspci | grep ' VGA ' | cut -d" " -f 1) >> /dev/shm/ScanInfo_HARD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HARD_$name.txt
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_HARD_$name.txt

echo -------------------------========================-------------------------
	echo "Hard Drives :"
	echo "Hard Drives :" >> /dev/shm/ScanInfo_HARD_$name.txt
	df -h
	df -h >> /dev/shm/ScanInfo_HARD_$name.txt
	echo "Hdd(s) info:"
	echo "Hdd(s) info:" >> /dev/shm/ScanInfo_HARD_$name.txt
	df -h -t ext4
	df -h -t ext4 >> /dev/shm/ScanInfo_HARD_$name.txt
	echo "Mount point:"
	echo "Mount point:" >> /dev/shm/ScanInfo_HARD_$name.txt
	lsblk
	lsblk  >> /dev/shm/ScanInfo_HARD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HARD_$name.txt
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_HARD_$name.txt

echo -------------------------========================-------------------------
	echo "Monitor display :"
	echo "Monitor display :" >> /dev/shm/ScanInfo_HARD_$name.txt
	ls /sys/class/drm/*/edid | xargs -i{} sh -c "echo {}; parse-edid < {}"
	ls /sys/class/drm/*/edid | xargs -i{} sh -c "echo {}; parse-edid < {}" >> /dev/shm/ScanInfo_HARD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HARD_$name.txt
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_HARD_$name.txt

echo -------------------------========================-------------------------
	echo "Usb hub/infos/devices :"
	echo "Usb hub/infos/devices :" >> /dev/shm/ScanInfo_HARD_$name.txt
	lsusb
	lsusb >> /dev/shm/ScanInfo_HARD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HARD_$name.txt
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_HARD_$name.txt

echo -------------------------========================-------------------------
	echo "sensors temp :"
	echo "sensors temp :" >> /dev/shm/ScanInfo_HARD_$name.txt
	sensors
	sensors >> /dev/shm/ScanInfo_HARD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HARD_$name.txt
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_HARD_$name.txt

echo -------------------------========================-------------------------
	echo "Lan card(s):"
	echo "Lan card(s):" >> /dev/shm/ScanInfo_HARD_$name.txt
	lspci | egrep -i --color 'network|ethernet'
	lspci | egrep -i --color 'network|ethernet' >> /dev/shm/ScanInfo_HARD_$name.txt
	echo MAC adress:
	echo MAC adress: >> /dev/shm/ScanInfo_HARD_$name.txt
	cat /sys/class/net/*/address
	cat /sys/class/net/*/address >> /dev/shm/ScanInfo_HARD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HARD_$name.txt
	echo --------------------======= END =======-------------------- >> /dev/shm/ScanInfo_HARD_$name.txt

echo -------------------------========================-------------------------
	echo Saving...
	if zenity --no-wrap --question --text="Do you want to save informations on desktop ? (Yes or No (Suggest Yes))\n\n\tIf you choose yes the program will close automatically."
		then
			cp /dev/shm/ScanInfo_HARD_$name.txt /$HOME/Desktop/ScanInfo_HARD_$name.txt
			autoquit=1
			noquit=0
			fi
	rm "/dev/shm/ScanInfo_HARD_$name.txt" 2> /dev/null
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
