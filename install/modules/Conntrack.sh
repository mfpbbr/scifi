 
#!/bin/bash
# Easy Life SCIFI
#
# Configuration Tool for an Easy Life
# Version 20140318
#
# Conntrack module
#
# Cosme Faria Corrêa
# John Doe
# ...
#
#set -xv        

clear

cat <<-EOF
  =========================================
  |           Easy Life for SCIFI         |
  =========================================
                  Conntrack Module

  This module will:
  1) Install repo for Conntrack
  2) Install packets for Conntrack
  3) Setup Conntrack
  4) Setup Conntrack logrotate
  5) Start

  Press <Enter> key

EOF

read

#1 Install repo for conntrack
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/security:netfilter/RHEL_6/security:netfilter.repo

#2 Install conntrack
yum install libnetfilter_conntrack3 -y
yum install conntrack-tools -y

#3 Setup Conntrack
cp -p $ModDir/Conntrack/conntrack /etc/init.d/


#4 Setup logrotate
rm /etc/logrotate.d/conntrack
cp -p $ModDir/Conntrack/conntrack.logrotate /etc/logrotate.d/conntrack

#5 start
chkconfig conntrack on


echo Press <Enter> to exit
read
