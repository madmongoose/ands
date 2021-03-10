ands-nettool

Script for managing network connections in Linux systems.

Using

In a terminal, run bash ands-nettool.sh (works with user rights, but if you run as root, you get more information).

You will see 5 options to choose from.
 
1. If you want to know about the number of active connections of the required application or PID select "Option 1".
- A list of active network applications will be displayed.
- Type the process name or PID (for example firefox or 23347), press enter and you will get the correct connection list
th of this process and organizations.
2. If you want to get information on all network processes press Option 2;
3. If you want to find out the network names of hosts and their IP addresses (read from right to left in the output, since in fact it is a PTR record) with which your system is currently interacting, press Option 3;
4. If you want to close all connections of a certain process and kill the process, press Option 4 and follow the instructions on the screen (!Attention, all unsaved data will be deleted!).
5. Press Option 5 to exit.

Nettool will be updated and developed in future, new functions will be added.

