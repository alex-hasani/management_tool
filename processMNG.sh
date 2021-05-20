clear
echo -e "\e[47m\e[31mRunning Locally: `date`\e[0m"
echo -e "\e[47m\e[31mCurrent User: $USER\e[0m"
echo -e "\e[47m\e[31mThis is Process Manager...\e[0m"

PS3="Select An Item : "

select CHOICE in "Top 5 CPU% Usage" "Process More Than X CPU Usage" "Process More Than X Memory Usage" "Zombie Process" "Top 10 Processes" "Kill Process" "Back To Main Menu" "Exit";do
	
	case $REPLY in
		1)
			echo -e "\e[31m$CHOICE:\e[0m\n"i
			top -b -n 1 | head -n 12 | tail -n 6
			;;
		2)
			read -p "Enter Your CPU Usage In % (Like 10.0) : " cpuUsage
			echo '  PID   USER    PR   NI VIRT    RES    SHR   S  %CPU %MEM  TIME+ COMMAND'
			top -b -n 1|sed '1,6d'|awk -v cpu=$cpuUsage '{if($9>=cpu)print $0}'
			;;
		3)
			read -p "Enter Your Memory Usage In % (Like 10.0) : " memoryUsage
			echo '  PID   USER    PR   NI VIRT    RES    SHR   S  %CPU %MEM  TIME+ COMMAND'
			top -b -n 1|sed '1,6d'|awk -v mem=$memoryUsage '{if($10>=mem)print $0}'
			;;
		4)
			echo "The Zombie Process Count is: " 
			ps aux | awk {`print $8`} | grep -c Z
			;;
		5)
			ps aux | head
			;;
		6)
			read -p "Enter Process ID :" pid
			kill -9 $pid 2>/dev/null
			if [ $? -ne 0 ]
			then 
				echo "PID NOT FOUND"
			else
				echo "Process $pid Killed..."
			fi
			;;
		7)	
			./main.sh
			break
			;;
		8)
			clear
			#echo $CHOICE |tr [a-z] [A-Z]
			exit 0
			;;	
		
		*)
			echo "Incorrect Choice"
			break
			;;
	esac

done

