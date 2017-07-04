#!/bin/bash

if [ -z "$1" ]
then
	echo "please input param is (start,stop,log)"
	exit
fi

arg=$1

echo “Paramer is: ” $arg

case $arg in
	stop)
	 echo "stop tomcat........"
         sh /opt/tomcat-activiti/bin/shutdown.sh
	 ;;
	start)
	 echo "start tomcat........"
         sh /opt/tomcat-activiti/bin/startup.sh
	 ;;
 	log)
 	 echo "tomcat log ......."
         tail -f  /opt/tomcat-activiti/logs/catalina.out
	 ;;
 	*)
	 echo "goodbye"
	 ;;
esac

#if [ arg=="stop" ]
#then
#	echo "stop tomcat........"
#	sh /opt/tomcat-activiti/bin/shutdown.sh 
#fi

#if [ arg=="start" ]
#then
#	echo "start tomcat........"
#	sh /opt/tomcat-activiti/bin/startup.sh
#fi

#if [ arg=="log" ]
#then
#	echo "tomcat log ......."
#	tail -f  /opt/tomcat-activiti/logs/catalina.out 
#fi
