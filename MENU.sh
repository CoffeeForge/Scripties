#!/bin/bash
echo "WELCOME TO PETER'S SCRIPTIES!"
PS3='ENTER A NUMBER!'
options=("ADD LCD ALIAS" "TEST YOUR CONNECTION" "TURN OFF THE PC!" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "ADD LCD ALIAS")
            sed -i -e '/function lcd()/d' ~/.bashrc
            echo 'function lcd() { cd "$1" && ls; }' >> ~/.bashrc
            echo "ALIAS ADDED - TAKES EFFECT WHEN TERMINAL IS RESTARTED!"
            ;;
        "TEST YOUR CONNECTION")
            Scripts/ConTest.sh
            ;;
        "TURN OFF THE PC!")
            Scripts/ShutDown.sh -h
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
