#!/bin/bash
# |This script will setup Auditd to do the following:        |
# |                                                          |
# |Auditing user TTY and root commands with auditd on Ubuntu |
# |__________________________________________________________|
#
#Setup and enable auditd
#MUST REBOOT Auditd AFTER SETUP
#
#FUNCTIONALITIES:
#
#* Auditing user TTY
#    aureport --tty
#
#* Auditing root commands (real Uid)
#      Ausearch -ue 0 # all root commands
#      Ausearch -ua 1000 # all commands by auid=1000
#

sed -i '/pam_tty_audit.so/d' /etc/pam.d/sshd
echo 'session required pam_tty_audit.so enable=*' >> /etc/pam.d/sshd

grep -- '-a exit,always -F arch=b64 -F euid=0 -S execve' \
    /etc/audit/audit.rules > /dev/null || {
    cat >> /etc/audit/audit.rules <<EOF
-a exit,always -F arch=b64 -F euid=0 -S execve
-a exit,always -F arch-b32 -F euid=0 -S execve
EOF
}

echo 'Setup complete. Please reboot!'
