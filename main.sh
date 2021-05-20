clear
echo -e "\e[47m\e[31mRunning Locally: `date`\e[0m"
echo -e "\e[47m\e[31mCurrent user: $USER\e[0m"
echo -e "\e[1mWelcome To Linux Manager\e[0m\n\nYour Options Are: 
1.Process Managment
2.FileSystem Managment
3.Package Managment
4.About
\n\e[36mPlease Select An Item :\e[0m"
read arg

case $arg in
	1)
		./processMNG.sh
		;;
	2)
		./filesystemMNG.sh
		;;
	3)
		./packageMNG.sh
		;;
	4)
		echo -e "\n\nThis app is developedn By Alex Hasani."
		echo -e "Enjoy it...\n\n"
		;;
	*)
		echo "Incorrect Item Is Selected..."
esac

echo "GoodBye..."

