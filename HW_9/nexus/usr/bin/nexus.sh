#!/bin/bash

sudo apt-get install openjdk-8-jre

wget https://download.sonatype.com/nexus/3/nexus-3.58.1-02-unix.tar.gz

sudo tar -xvzf nexus-3.58.1-02-unix.tar.gz

sudo mv sonatype-work /opt

sudo mv nexus-3* /opt/nexus

if [ $(id -u) -eq 0 ]; then
	username=nexus
	password=nexus
	egrep "^$username" /etc/passwd >/dev/null
	if [ $? -eq 0 ]; then
		echo "$username exists!"
		exit 1
	else
		pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
		useradd -m -p "$pass" "$username"
		[ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
	fi
else
	echo "Only root may add a user to the system."
	exit 2
fi

sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work

sed 's/#INSTALL4J_JAVA_HOME_OVERRIDE=/INSTALL4J_JAVA_HOME_OVERRIDE=/usr/lib/jvm/java-8-openjdk-amd64/' /opt/nexus/bin/nexus

sudo echo "run_as_user="nexus"" >> /opt/nexus/bin/nexus.rc

sudo mv nexus.service /etc/systemd/system/

sudo systemctl start nexus

sudo systemctl status nexus

echo "admin password is: "
sudo cat /opt/sonatype-work/nexus3/admin.password
echo " "
