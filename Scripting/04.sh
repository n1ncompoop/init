#Write a script which monitors the modifications made to the /etc/crontab file 
#and sends an e-mail to root if the file is modified. 
#Create a scheduled task to run this script everyday at midnight

CRSTR='0 0 * * *  $(pwd)/04.sh'
MD5SUM='cat /root/crontabsum'
NEWSUM='md5sum /etc/crontab | cut -d " " -f 1'

if grep -q "$CRSTR" /etc/crontab; then
	echo "crontab_check is ready"
else
	echo "$CRSTR" >> /etc/crontab
fi

if [ "$MD5SUM" != "$NEWSUM" ]
then
	md5sum /etc/crontab | cut -d " " -f 1 > /root/crontabsum
    echo "Crontab changed" | mail -s "Crontab was modified" root
fi