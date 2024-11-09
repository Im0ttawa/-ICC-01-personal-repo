#!/bin/bash

#colors
red="\e[38;2;220;20;60m"
orange="\e[38;2;255;140;0m"
lGreen="\e[38;2;0;255;127m"

#menu banner with color costumization just for not be pale and vague :D
main_menu () {
echo -e "${orange}|-----------------------------------|"
echo -e "${orange}|${lGreen}~ Welcome to your network toolbox ~${orange}|"
echo -e "${orange}|${lGreen}~~~~~~~~~~~~~~~~8> made by ottawa ~${orange}|"
echo -e "${orange}|-----------------------------------|"
echo -e "${orange}|${lGreen}1).Check network interface info    ${orange}|" 
echo -e "${orange}|${lGreen}2).Ping a host                     ${orange}|"
echo -e "${orange}|${lGreen}3).Port scan with Nmap             ${orange}|"
echo -e "${orange}|${lGreen}4).Display routing table           ${orange}|"
echo -e "${orange}|${lGreen}5).Tracerroute to host             ${orange}|"
echo -e "${orange}|                                   |"
echo -e "${orange}|${lGreen}6).Exit                            ${orange}|"
echo -e "${orange}|-----------------------------------|${lGreen}"
read menuchoice

case "$menuchoice" in
  1)#ifconfig
  echo -e "${red}Are you sure you wish to continue ? y/n${lGreen}"   #Check if user wants to prossed with action
  read userchoice

  if [ "$userchoice" = "y" ]; then     #if statement to recive the user input and take action
    echo ""
    sleep 1
    ifconfig
    echo "Returning to Main Menu"
    sleep 2
    main_menu
  else
    echo "Returning to Main Menu..."
    sleep 2
    main_menu
  fi;
  ;;
  2) #Ping
  echo -e "${red}Are you sure you wish to continue ? y/n${lGreen}"   #Check if user wants to prossed with action
  read userchoice

  if [ "$userchoice" = "y" ]; then     #if statement to recive the user input and take action
    echo "Insert target IP address"
     read ipaddress
    echo "How many packets you want to send ?"          #TO DO: If user wish to save the output into a file
     read numberofpackets
    echo "starting ICMP sequence"
    echo ""
    sleep 2
    ping ${ipaddress} -c $numberofpackets
    echo ""
    echo "Returning to main_menu"
    main_menu
  else
    echo "Returning to Main Menu..."
    sleep 2
    main_menu
  fi;
  ;;
  6) #Exit toolbox
    echo -e "${red} Do you wish to close the toolbox ? y/n${lGreen}"
    read userchoice
  if [ "$userchoice" = "y" ]; then
    echo "Closing the toolbox bye :D"
    sleep 1
  else
   echo "Returning to Main Menu"
   sleep 1
   main_menu
  fi;
  ;;
  *)  #stupid user verifier
    echo -e "${lGreen}Please only use the numbers from ${orange}1 ${lGreen}to ${orange}6${lGreen} to chose a option"
    sleep 2
    echo "Returning to Main Menu"
    sleep 2
    main_menu
  ;;
esac
} 
main_menu
