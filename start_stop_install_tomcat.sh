#!/usr/bin/env bash
. install_tomcat.sh
select a in start stop install
do
	case $a in 
		start)
		for i in {1..5}
		do
		bash  /usr/local/tomcat${i}/bin/startup.sh
		done
			;;
		stop)
		for i in {1..5}
		do
		bash /usr/local/tomcat${i}/bin/shutdown.sh	
		done
			;;
		install)
		install 
			;;
		uninstall)
			

			;;
		*)			
		exit
			;;
	esac
done
