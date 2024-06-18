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
	echo Name : "ListLanCard"
	echo What it does ?
	echo "Show all HDD free space and informations"
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
	rm "/dev/shm/ScanInfo_HDD_$name.txt" 2> /dev/null
	echo --------------------======= START =======-------------------- >> /dev/shm/ScanInfo_HDD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HDD_$name.txt
	echo "Show all HDD free space and informations" >> /dev/shm/ScanInfo_HDD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HDD_$name.txt
	echo
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_HDD_$name.txt
	echo "Pc Name:"  >> /dev/shm/ScanInfo_HDD_$name.txt
	hostname -A >> /dev/shm/ScanInfo_HDD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HDD_$name.txt
	echo
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_HDD_$name.txt

echo -------------------------========================-------------------------
	echo Machine informations:
	echo Machine informations: >> /dev/shm/ScanInfo_LAN_$name.txt
	hostnamectl
	hostnamectl >> /dev/shm/ScanInfo_HARD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HARD_$name.txt
	echo
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_HARD_$name.txt

echo -------------------------========================-------------------------
	echo Name , save and mountpoint.
	echo Name , save and mountpoint. >> /dev/shm/ScanInfo_HDD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HDD_$name.txt
	
	lsblk
	lsblk >> /dev/shm/ScanInfo_HDD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HDD_$name.txt
	echo
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_HDD_$name.txt

echo -------------------------========================-------------------------
	echo ls -lF /dev/disk/by-id/
	echo "ls -lF /dev/disk/by-id/" >> /dev/shm/ScanInfo_HDD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HDD_$name.txt
	echo
	ls -lF /dev/disk/by-id/
	ls -lF /dev/disk/by-id/ >> /dev/shm/ScanInfo_HDD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HDD_$name.txt
	echo
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_HDD_$name.txt

echo -------------------------========================-------------------------
	echo "Capacity by disk :"
	echo "Capacity by disk :" >> /dev/shm/ScanInfo_HDD_$name.txt
	echo
	echo "	" >> /dev/shm/ScanInfo_HDD_$name.txt
	echo Manual Capacity sda
	echo Capacity sda >> /dev/shm/ScanInfo_HDD_$name.txt
	lsblk -b --output SIZE -n -d /dev/sda
	echo "lsblk -b --output SIZE -n -d /dev/sda" >> /dev/shm/ScanInfo_HDD_$name.txt
	lsblk -b --output SIZE -n -d /dev/sda  >> /dev/shm/ScanInfo_HDD_$name.txt
	echo
	echo "	" >> /dev/shm/ScanInfo_HDD_$name.txt
	echo Manual Capacity sdb
	echo Capacity sdb >> /dev/shm/ScanInfo_HDD_$name.txt
	lsblk -b --output SIZE -n -d /dev/sdb
	echo
	echo "	" >> /dev/shm/ScanInfo_HDD_$name.txt
	echo "lsblk -b --output SIZE -n -d /dev/sdb" >> /dev/shm/ScanInfo_HDD_$name.txt
	lsblk -b --output SIZE -n -d /dev/sdb >> /dev/shm/ScanInfo_HDD_$name.txt
	echo
	echo "	" >> /dev/shm/ScanInfo_HDD_$name.txt
	echo "Each disk Automatic (sda to sdz):"
	for i in /dev/sd[a-z]; do lsblk -b --output SIZE -n -d "$i"; done
	echo
	echo "	" >> /dev/shm/ScanInfo_HDD_$name.txt
	echo --------------=============-------------- >> /dev/shm/ScanInfo_HDD_$name.txt
	echo Nvme disk :
	echo Echo Nvme disk : >> /dev/shm/ScanInfo_HDD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HDD_$name.txt
	echo "Each disk Automatic (nvme0n1 to nvme0n9):"
	for i in /dev/nvme1n[0-9]; do lsblk -b --output SIZE -n -d "$i"; done
	echo
	echo "	" >> /dev/shm/ScanInfo_HDD_$name.txt
	echo "Each disk Automatic (nvme1n0 to nvme1n9):"
	for i in /dev/nvme1n[0-9]; do lsblk -b --output SIZE -n -d "$i"; done
	echo
	echo "	" >> /dev/shm/ScanInfo_HDD_$name.txt
	echo "Each disk Automatic (nvme0n1p0 to nvme0n1p9):"
	for i in /dev/nvme0n1p[0-9]; do lsblk -b --output SIZE -n -d "$i"; done
	echo
	echo "	" >> /dev/shm/ScanInfo_HDD_$name.txt
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_HDD_$name.txt

echo -------------------------========================-------------------------
	echo "sensors temp :"
	echo "sensors temp :" >> /dev/shm/ScanInfo_HDD_$name.txt
	sensors
	sensors >> /dev/shm/ScanInfo_HDD_$name.txt
	echo
	echo "	" >> /dev/shm/ScanInfo_HDD_$name.txt
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_HDD_$name.txt

echo -------------------------========================-------------------------
	echo "sudo hwinfo --disk --listmd (Need sudo passowd)"
	echo "sudo hwinfo --disk --listmd (Need sudo passowd)" >> /dev/shm/ScanInfo_HDD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HDD_$name.txt

	#sudo hwinfo --disk --listmd
	echo type : hwinfo --disk --listmd
	echo sudo hwinfo --disk --listmd >> /dev/shm/ScanInfo_HDD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HDD_$name.txt
	echo
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_HDD_$name.txt

echo -------------------------========================-------------------------
	echo "Total capacity of HDD present in the system: (Mb)"
	echo "Total capacity of HDD present in the system: (Mb)" >> /dev/shm/ScanInfo_HDD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HDD_$name.txt
	echo
	df | grep '^/dev/' | awk '{s+=$2} END {print s/1048576}'
	df | grep '^/dev/' | awk '{s+=$2} END {print s/1048576}' >> /dev/shm/ScanInfo_HDD_$name.txt
	echo
	echo "	" >> /dev/shm/ScanInfo_HDD_$name.txt
	df -h -t ext4
	df -h -t ext4 >> /dev/shm/ScanInfo_HDD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HDD_$name.txt
	echo
	echo --------------------===================-------------------- >> /dev/shm/ScanInfo_HDD_$name.txt

echo -------------------------========================-------------------------
	echo "Hdd temp : (Need sudo passowd)"
	echo "Hdd temp : (Need sudo passowd)" : >> /dev/shm/ScanInfo_HDD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HDD_$name.txt
	## Need hddtemp
	echo "type for i in /dev/sd[a-z]; do sudo hddtemp "$i"; done"
	echo "type for i in /dev/sd[a-z]; do sudo hddtemp "$i"; done" >> /dev/shm/ScanInfo_HDD_$name.txt
	#for i in /dev/sd[a-z]; do sudo hddtemp "$i"; done
	#for i in /dev/sd[a-z]; do sudo hddtemp "$i"; done >> /dev/shm/ScanInfo_HDD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HDD_$name.txt
	echo "for i in /dev/nvme0n1p[0-9]; do sudo hddtemp "$i"; done"
	echo "for i in /dev/nvme0n1p[0-9]; do sudo hddtemp "$i"; done" >> /dev/shm/ScanInfo_HDD_$name.txt
	#for i in /dev/nvme0n1p[0-9]; do sudo hddtemp "$i"; done
	#for i in /dev/nvme0n1p[0-9]; do sudo hddtemp "$i"; done >> /dev/shm/ScanInfo_HDD_$name.txt
	echo "	" >> /dev/shm/ScanInfo_HDD_$name.txt
	echo
	echo --------------------======= END =======-------------------- >> /dev/shm/ScanInfo_HDD_$name.txt

echo -------------------------========================-------------------------
	echo Saving...
	echo To name : /$HOME/Desktop/ScanInfo_HARD_$name.txt
	if zenity --no-wrap --question --text="Do you want to save informations on desktop ? (Yes or No (Suggest Yes))\n\n\tIf you choose yes the program will close automatically."
		then
			cp /dev/shm/ScanInfo_HDD_$name.txt /$HOME/Desktop/ScanInfo_HDD_$name.txt
			autoquit=1
			noquit=0
			fi
	rm "/dev/shm/ScanInfo_HDD_$name.txt" 2> /dev/null
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
