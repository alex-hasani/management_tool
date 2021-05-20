clear
PS3="Select An Item : "
echo -e "\e[47m\e[31mPWD : `pwd`\e[0m"
echo -e "\e[47m\e[31mCurrent User : $USER\e[0m"
echo -e "\e[47m\e[31mThis is Package Manager... \e[0m"

select CHOICE in "Update Repository List" "Installed Package Info" "Repair Package Manager" "Back To Main Menu" "Exit";
do
	case $REPLY in
		1)
			sudo apt-get update
			;;
		2)
			read -p "Enter Package Name : " pkgName
			sudo apt-cache show $pkgName > ./output/$pkgName-info
			echo "Package Information Writed in File : $pkgName"-info" in ./output Folder"
			;;
		3)
			sudo apt-get install -f
			;;
		4)
			./main.sh
			;;
		5)
			echo "Exit.."
			exit
			;;
		*)
			echo "Incorrect Choice..."
			break
			;;
	esac
done
