### _Linux Commands_

* connect to a remote server via SSH

```
ssh <user_name>@<ip_address> 
```

* list all directory contents, including hidden files, in long format

```
ls -al 
```

* create an empty file or update the timestamp of an existing file

```
touch <file_name> 
```

* create 10 files with filenames starting from 1 to 10

```
touch <file_name>{1..10} 
```

* create a file with a future date

```
touch -d tomorrow <file_name> 
```

* store text in a file, overwriting the file if it exists

```
echo "text" > <file_name> 
```

* securely delete a file by overwriting its contents

```
shred <file_name> 
```

* display the current username

```
whoami 
```

* add a new user

```
sudo useradd <new_user_nam
```

* change the password for a user

```
sudo passwd <user_name> 
```

* display a brief description of the 'finger' command

```
whatis finger 
```

* show the path of the 'finger' command

```
which finger 
```

* locate the binary, source, and manual page files for the 'finger' command

```
whereis finger 
```

* download a file or data from a URL

```
wget <url> 
```

* download a file or data from a URL

```
curl <url> 
```

* download and save data to a file

```
curl <url> > <file_name> 
```

* compress a file into a zip archive

```
zip <zip_file_name>.zip <filename_to'''_be_zippe
```

* extract files from a zip archive

```
unzip <filename> 
```

* view the contents of a file one page at a time

```
less <file_name> 
```

* display the beginning of a file

```
head <filename> 
```

* display the end of a file

```
tail <filename> 
```

* compare two files byte by byte

```
cmp <file1> <file2> 
```

* show the differences between two files

```
diff <file1> <file2> 
```

* sort the contents of a file in alphabetical order

```
cat <file_name> | sort 
```

* find files by name in a directory

```
sudo find <directory_to_search> -na'''me "<filename
```

* find all hidden files

```
sudo find . -type f -na'''me ".
```

* find all empty files

```
find . -type f -empty 
```

* find all files with execute permissions for all users

```
find . -perm /a=x 
```

* make a file executable

```
chmod +x <file_name> 
```

* change the ownership of a file

```
chown <username> <filename> 
```

* display network configuration (deprecated, use 'ip' instead)

```
ifconfig 
```

* display IP addresses and network interfaces

```
ipaddress 
```

* use 'awk' to get only a particular column from the result

```
awk '{print $9}' 
```

* display DNS resolver configuration

```
cat /etc/resolv.conf 
```

* show the status of the DNS resolver

```
resolvectl status 
```

* send ICMP ECHO_REQUEST to network hosts

```
ping <website_url> 
```

* send a specific number of ICMP ECHO_REQUEST packets

```
ping -c <number_of_ping> <website_url> 
```

* send ICMP ECHO_REQUEST packets with a specific size

```
ping -s <size_of_packets> <website_url> 
```

* print the route packets take to the network host

```
traceroute <website_url> 
```

* display network connections, routing tables, interface statistics, masquerade connections, and multicast

```
netstat -tulpn memberships
```

* display socket statistics

```
ss -tulpn 
```

* print all system information

```
uname -a 
```

* display a calendar

```
cal 
```

* display the amount of free and used memory in the system

```
free 
```

* display disk space usage in human-readable format

```
df -H 
```

* display information about all running processes

```
ps -aux 
```

* display tasks and system resource usage

```
top 
```

* interactive process viewer

```
htop 
```

* forcefully terminate a process by its ID

```
kill -9 <process_id> 
```

* terminate processes based on a pattern

```
pkill -f <file_name> 
```