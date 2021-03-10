Scripts for automatically upgrade from Debian 7 to 10 version

Connect to the target via ssh under the root account;
Type or copy\past command "wget https://raw.githubusercontent.com/madmongoose/ands/main/dupg-ssh.sh" without quotes;
Enter the command "sh dnds-upg-ssh.sh" without quotes.
The target machine will reboot several times during installation. After installation, the script will automatically create an "ands" user with root rights and password "1234567", set the hostname ands-dev-03, ip address 192.168.100.200, and install the minimum set of software.

If target has't ssh server.

Connect to the target machine locally under the root account;
Enter the command "wget https://raw.githubusercontent.com/madmongoose/ands/main/ands-dupg-ssh.sh" without quotes;
Enter the command "sh dupg-local.sh" without quotes.
