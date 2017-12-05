#!/bin/sh
	clear
	ver="1.0"
	printf "**			Automated Mac Updater v. $ver 	  **\n"
	printf "   		           developed by Gualty    \n"
	printf "   		         http://github.com/Gualty    \n"

	if [ "$1" = "-v" ]; then
		echo "\nmacupdate.sh v. $ver\n"
		exit 0
	fi
	mas >/dev/null 2>&1 || { echo "I require mas but it's not installed.\n\nFollow instructions on https://github.com/mas-cli/mas\nThen execute macupdater.sh again.\n\n" >&2; exit 1; }
	# The options menu
	printf "\nWhat do you want to update?\n\n"

	printf "1) Update All (Apps & macOS)\n"
	printf "2) Update Apps\n"
	printf "3) Update macOS\n"
	printf "4) Quit\n"
	printf "Choise: "
	read choice
	# Execute the right operation based on the choice of the user
	case "$choice" in
		1) printf "\nUpdating macOS\n";softwareupdate -ia;printf "\nUpdating Apps\n";mas upgrade;printf "\nUpdate complete!\n";;
		2) printf "\nUpdating Apps\n";mas upgrade;printf "\nUpdate complete!\n";;
		3) printf "\nUpdating macOS\n";softwareupdate -ia;printf "\nUpdate complete!\n";;
		4) echo "\nBye bye =)\n"; exit 0;;
		0) echo "\nBye bye =)\n"; exit 0;;
		q) echo "\nBye bye =)\n"; exit 0;;
		quit) echo "\nBye bye =)\n"; exit 0;;
		*) echo "\nNot valid command\nPress any key to continue";read tasto;$0 $1 $2 $3 $4 $5;;
	esac
