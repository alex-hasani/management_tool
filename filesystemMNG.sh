clear
echo -e "\e[47m\e[31mPWD: `pwd`\e[0m"
echo -e "\e[47m\e[31mCurrent User: $USER\e[0m"
echo -e "\e[47m\e[31mThis is FileSystem Manager...\e[0m"

PS3="Select An Item : "

select CHOICE in "System Disk Information" "Mounted Disk Usage" "User Home DIR Usage" "Files With More X Disk Usage" "Delete File's With More X Disk Space" "File Accessed Among X days Ago" "File Modified Among X days Ago" "Back To Main Menu" "Exit"; do
	case $REPLY in
		1)
			lsblk | grep sd
			;;
		2)
			df -lh | grep sd
			;;
		3)
			du -sh /home/$USER
			;;
		4)
			read -p "Enter Size in KiloByte : " findSize
			find / -type f -size +"$findSize"k -exec ls -lh {} \; 2>/dev/null | awk '{print $9":"$5}'>./output/$findSize-fileSize
			echo "List Writed in File With Name : $findSize-fileSize in ./output Folder"
			;;
		5)
			read -p "Enter Size in KiloByte : " deleteSize
			find /home/faradars -type f -size +"$deleteSize"k -exec rm {} \; 2>/dev/null
			echo "List Writed in File With Name : $deleteSize-fileSize in ./output Folder"
			;;
		6)
			read -p "Enter Days (1-60): " atime
			find / -type f -atime -"$atime" > ./output/$atime-atime 2>/dev/null
			echo "List Writed in File With Name : $atime-atime in ./output Folder"
			;;
		7)
			read -p "Enter Days (1-60): " mtime
			find / -type f -mtime -"$mtime" > ./output/$mtime-mtime 2>/dev/null
			echo "List Writed in File With Name : $mtime-mtime in ./output Folder"
			;;
		8)
			./main.sh
			;;
		9)
			clear
			exit 0
			;;
				
		*)
			echo "Incorrect Choice"
			exit
			;;
	esac

done






