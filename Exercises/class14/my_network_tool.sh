#!/bin/bash
#colors
red="\e[38;2;220;20;60m"
orange="\e[38;2;255;140;0m"
lGreen="\e[38;2;0;255;127m"
#Tracerroute function
traceRoute () {
 read -p "Please insert the URL or IP address of the destination: " destination
 sleep 2
 echo "Starting Traceroute to $destination"
 echo ""
 traceroute $destination
 echo ""
 sleep 2
 echo "Returning to Main Menu"
 main_menu
}
#routing table function
 routingTable () {
  echo "Showing routing table"
  echo ""
  sleep 2
  netstat -rn
  sleep 2
  echo "Returing to Main Menu"
  echo ""
  sleep 1
  main_menu
}
#Nmap function
 nmap_scan() {
   read -p "Insert target IP address: " ipaddress
   echo "This will scan all ports do you wish to continue ? y/n"
   read userchoice
   if [ "$userchoice" = "y" ]; then
     nmap $ipaddress
     echo ""
     echo "Returning to Main Menu"
     echo ""
     main_menu
   else
    echo "Returning to Main Menu..."
    sleep 2
    main_menu
   fi;
}
#ping function
ping_pong () {
    read -p "Insert target IP address: " ipaddress
    read -p "How many packets you want to send ? " numberofpackets       #TO DO: If user wish to save the output into a file
    echo "starting ICMP sequence"
    echo ""
    sleep 2
    ping $ipaddress -c $numberofpackets
    sleep 2
    echo ""
    echo "Returning to Main Menu"
    echo ""
    sleep 2
    main_menu   
}  
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
echo -e "${orange}|${lGreen}5).Traceroute to host              ${orange}|"
echo -e "${orange}|                                   |"
echo -e "${orange}|${lGreen}6).Exit                            ${orange}|"
echo -e "${orange}|-----------------------------------|${lGreen}"
read -p "Chose a option: " menuchoice

case "$menuchoice" in
  1)#ifconfig
  echo -e "${red}Are you sure you wish to continue ? y/n${lGreen}"   #Check if user wants to proceed with action
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
    ping_pong
  else
    echo "Returning to Main Menu..."
    sleep 2
    main_menu
  fi;
  ;;
  3)#Nmap
 echo -e "${red}Are you sure you wish to continue ? y/n${lGreen}"   #Check if user wants to prossed with action
  read userchoice
  if [ "$userchoice" = "y" ]; then
    nmap_scan
  else
    echo "Returning to Main Menu..."
    sleep 2
    main_menu
  fi;
  ;;
  4)#Routing table
  echo -e "${red}Are you sure you wish to continue ? y/n${lGreen}"   #Check if user wants to prossed with action
    read userchoice
  if [ "$userchoice" = "y" ]; then
    routingTable
  else
    echo "Returning to Main Menu..."
    sleep 2
    main_menu
  fi;
  ;;
 5)#Traceroute
  echo -e "${red}Are you sure you wish to continue ? y/n${lGreen}"   #Check if user wants to prossed with action
    read userchoice
  if [ "$userchoice" = "y" ]; then
    traceRoute
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
    exit 0
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
