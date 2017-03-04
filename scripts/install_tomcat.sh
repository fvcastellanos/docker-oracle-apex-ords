#!/bin/bash

cd /files
tar -xzf tomcat-8.0.11.tar.gz
mv /files/apache-tomcat-8.0.11 /tomcat
cd /scripts
sed -i -e 's/password="secret"/password="'$PASSWORD'"/g' tomcat-users.xml
mv tomcat-users.xml /tomcat/conf
mv tomcat8 /etc/init.d/tomcat
chmod 755 /etc/init.d/tomcat
update-rc.d tomcat defaults  80 01
