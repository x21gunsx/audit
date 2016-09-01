# Audit Project
This is the code I've worked on with regards to ansible
The code in this repo consists of a script that will setup:
Auditing user TTY and root commands with auditd on Ubuntu
It will go out via sudo apt-get (with_items) and install packages
The packages in this project include:
-auditd
-fail2ban
-chkrootkit
-Rkhunter
It will setup local config files for each of the packages
via cron jobs or local configs
Chkrootkit and Rkhunter are scheduled to run
There are two host files one thats from the /etc/ansible and then one from the /etc (local hosts)
You can also see that after executing the command "aulast --bad" that the bad attempts via SSH were logged by Auditdaemon. 
Then lastly you can see the Kali Linux machine that was Pen tested as banned from the local virtual machine after it tried to bruteforce its way in via HYRDA GTK.
