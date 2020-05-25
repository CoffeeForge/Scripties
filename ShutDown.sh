#!/bin/bash
#this is a script to shut down/restart the system, mimicing the Windows version

state=""
while getopts ":rst:" opt; do
	case ${opt} in
		t ) if ! [[ "$OPTARG" =~ ^[0-9]+$ ]] 
			then echo "ONLY NUMBERS IN SECONDS!"
			else echo "TO STOP THE TIMER PRESS CONTROL + C!" 
				sleep $OPTARG 
			fi 
			;;
		s ) state="shutdown" echo "SHUTTING DOWN"
			;;
		r ) state="restart" echo "RESTARTING"
			;;
		\? ) echo "HELP"
		     echo "-r : Restarts the computer"
		     echo "-s : Shuts down the computer"
		     echo "-t : Enter the number of seconds you wish to wait"
			;;
		: ) echo "INVALID ARGUMENT!";;
	esac
done
shift $((OPTIND -1))

case $state in
shutdown ) shutdown -s now ;;
restart ) shutdown -r now ;;
esac

