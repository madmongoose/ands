#!/bin/bash

clear

PS3='Please enter your choice: '
options=(
"Option 1 (Check number connections of the select Program/PID)"
"Option 2 (Check number connections of all network process)"
"Option 3 (List connections DNS names and PTR records)"
"Option 4 (List network connections and kill select Program/PID)"
"Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Option 1 (Check number connections of the select Program/PID)")
        echo "you chose choice $REPLY which is $opt"
            echo _______________________________
            ss -tunp | awk 'NR>1 {print $7}' | cut -c 9- | sed 's/((//;s/))//'
            echo _______________________________
            echo "Type program name or PID (All current running programs/pid are displayed above)"
            read proc
            if [ -z "$proc" ]
            then
                echo "Wrong input, try again!"
            else [ -n $proc ]
                netstat -tunapl | grep $proc | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort | grep -oP '(\d+\.){3}\d+' | while read IP ; do whois $IP | awk -F':' '/^Organization/ || /^Netname/ || /^netname/ {print $0}' ; done | sort | uniq -c | while read COUNT ; do echo "Connections: $COUNT" ; done | awk '{print $0};{s += $2} END {print "Total Connections:" " " s}'
            fi
            ;;
        "Option 2 (Check number connections of all network process)")
            echo "you chose choice $REPLY which is $opt"
            netstat -tunapl | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort | grep -oP '(\d+\.){3}\d+' | while read IP ; do whois $IP | awk -F':' '/^Organization/ || /^Netname/ || /^netname/ {print $0}' ; done | sort | uniq -c | while read COUNT ; do echo "Connections: $COUNT" ; done | awk '{print $0};{s += $2} END {print "Total Connections:" " " s}'
            ;;
        "Option 3 (List connections DNS names and PTR records)")
            echo "you chose choice $REPLY which is $opt"
            ss -tup | grep firefox | awk '{print $6}' | cut -d: -f1 | sort | uniq -c | sort | grep -oP '(\d+\.){3}\d+' | while read IP ; do nslookup $IP ; done | grep name | sed 's/name =//'
            ;;
        "Option 4 (List network connections and kill select Program/PID)")
            echo "you chose choice $REPLY which is $opt"
            echo _______________________________
            ss -tunp | awk 'NR>1 {print $7}' | cut -c 9- | sed 's/((//;s/))//'
            echo _______________________________
            echo "Type program name or PID (All current running programs/pid are displayed above)"
            read proc
            if [ -z $proc ]
        then
        echo "Wrong input, try again!"
        else [ -n $proc ]
        ss -tunp | grep $proc | awk '{ print } END { print "Total Connections:" " " NR }'
        fi
            echo "Do you want close all connections of the select Program/PID and kill them whithout save data (y/n)?"
            read ans
            if [[ $ans == 'y' ]]
            then
        pkill $proc
        fi
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

