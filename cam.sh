#!/bin/bash
#color
white="\033[1;37m"
red="\033[1;31m"
green="\033[1;32m"
#if [[ $EUID -ne 0 ]]; then
#   
#   clear
#   echo ""
#   echo "<<< Kamu harus dalam keadaan root!>>>" 
 #  echo ""
  # exit 1
#fi

main(){
   clear
   echo -e "$white================="
   cekapache2
   cekmysql
   echo '================='
   echo "0. Exit"
   echo ""
   read  -p "Pilih  Service : " service
   if [[ $service == 1 ]]
   then 
	 menuapache2
   elif [[ $service == 2 ]] 
   then	
	   menumysql
   elif [[ $service == 0 ]] 
   then
	echo "Bye!"
	exit 0
	clear
	#echo "Bye!"	
   else 
  	 main
   fi	 
}
menumysql(){
   echo "
==============
  Mysql 
============== 
  1. Hidupkan
  2. Matikan
  3. Restart
  0. Exit"
   echo ""
   read  -p "Pilih  : " service
   if [[ $service == 1 ]]
   then 
	 sudo service mysql start
	main
   elif [[ $service == 2 ]]
   then 
	sudo service mysql stop
	main
   elif [[ $service == 3 ]]
   then 
	sudo service mysql restart
	main
   elif [[ $service == 0 ]]
   then
	clear
	echo "  bye!" 
	exit 0
	
   else 
	echo -e "$red inputan salah!"
	read -p  " Masukan Salah!Tekan enter untuk kembali"
	main
   fi	 
}
menuapache2(){
   echo " 
  1. Hidupkan
  2. Matikan
  3. Restart
  4. Exit"
   echo ""
   read  -p "Pilih  : " service
   if [[ $service == 1 ]]
   then 
	 sudo service apache2 start
	main
   elif [[ $service == 2 ]]
   then 
	sudo service apache2 stop
	main
   elif [[ $service == 3 ]]
   then 
	sudo service apache2 restart
	main
   else 
	echo -e "$red inputan salah!"
	read -p  " Masukan Salah!Tekan enter untuk kembali"
	main
   fi	 
}

cekapache2(){
 service=apache2
 if ps ax | grep -v grep | grep $service > /dev/null
  then
    echo -e "1. $white$service : $green On $white"
 else
    echo -e "1. $white$service : $red Off $white"
 fi
}

cekmysql(){
 service=mysql
 if ps ax | grep -v grep | grep $service > /dev/null
  then
    echo -e "2. $service   : $green On $white"
 else
    echo -e "2. $service   : $red Off $white"
 fi
}


main
