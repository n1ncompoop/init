#Write a script which monitors the modifications made to the /etc/crontab file 
#and sends an e-mail to root if the file is modified. 
#Create a scheduled task to run this script everyday at midnight

MD5SUM='cat /root/crontabsum'
NEWSUM='md5sum /etc/crontab | cut -d " " -f 1'

if [ "$MD5SUM" != "$NEWSUM" ]
then
	md5sum /etc/crontab | cut -d " " -f 1 > /root/crontabsum
	mail -s "The file crontab was modified" root@localhost.com < /etc/crontab
fi

 0 0    0 * 0-6   root    sh /root/crontab_check.sh