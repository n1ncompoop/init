#Write a script which displays only the login, UID and Path of each entry of the /etc/passwd file.
awk -F: '{print $1, $3. $6}' /etc/passwd