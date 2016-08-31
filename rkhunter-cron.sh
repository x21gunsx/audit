#!/bin/sh
 (
 rkhunter --versioncheck
 rkhunter --update
 rkhunter -c --cronjob 
 ) | mail -s 'rkhunter Daily Check' carter.robinson@clearcapital.com
