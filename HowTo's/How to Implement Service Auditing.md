To audit network services that are running on your system, use the ss command to list all the TCP and UDP ports that are in use on a server. An example command that shows the program name, PID, and addresses being used for listening for TCP and UDP traffic is:

sudo ss -plunt
The p, l, u, n, and t options work as follows:

p shows the specific process using a given socket.
l shows only sockets that are actively listening for connections.
u includes UDP sockets (in addition to TCP sockets).
n shows numerical traffic values.
t includes TCP sockets (in addition to UDP sockets).