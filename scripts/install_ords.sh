#!/bin/bash
#PASSWORD=${1:-secret}

unzip -o /files/ords.3.0.9.348.07.16.zip -d /u01/ords

sed -i -E 's:secret:'$PASSWORD':g' ords_unlock_account.sql
sqlplus -S sys/$PASSWORD@XE as sysdba @ords_unlock_account.sql < /dev/null

sed -i -E 's:secret:'$PASSWORD':g' ords_params.properties
cp -rf ords_params.properties /u01/ords/params
cd /u01/ords
java -jar ords.war configdir /u01
java -jar ords.war install simple

# solution for the problem with timezone
#dpkg-reconfigure tzdata
echo "Europe/Warsaw" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

cp -rf /u01/ords/ords.war /tomcat/webapps/
cp -rf /u01/app/oracle/apex/images /tomcat/webapps/i
