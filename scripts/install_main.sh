#!/bin/bash

exec >> >(tee -ai /docker_log.txt)
exec 2>&1

apt-get update && apt-get install -y unzip vim curl

#
echo "--------------------------------------------------"
echo "Installing SSH...................................."
./install_ssh.sh
#
#
echo "--------------------------------------------------"
echo "Installing JAVA..................................."
./install_java.sh
#
#
echo "--------------------------------------------------"
echo "Installing TOMCAT................................."
./install_tomcat.sh
#
#
echo "--------------------------------------------------"
echo "Installing ORACLE XE.............................."
./install_oracle.sh
#
#
echo "--------------------------------------------------"
echo "Installing ORACLE APEX............................"
./install_apex.sh
#
#
echo "--------------------------------------------------"
echo "Installing ORACLE APEX............................"
./install_ords.sh
#
#
echo "--------------------------------------------------"
echo "Clean............................................."
echo "Removing temp files"
rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* /files
rm -rf /u01/app/oracle/apex /u01/ords/ords.war
echo "apt-get clean"
apt-get clean
echo "--------------------------------------------------"
echo "DONE.............................................."
