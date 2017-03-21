## Notes on MININET
Mostly with commands which come in handy (such as `ovs-ofctl` commands).
Important is to see that you should not use spaces!

* Try `sudo mn -h`
* Run a general MININET topology:  
`sudo mn --topo single,4 --controller remote,ip=127.0.0.1,port=6633 --switch ovsk,protocols=OpenFlow13 --mac`
* Usefull mininet commandos: `nodes` `net` `dump`
* You can break or fix a link via `link <startnode> <endnode> down/up`

* _iperf_ via the xterminals of two hosts:  
  @h2 `iperf -s -u -p 5555 -i 1`  
  @h1 `iperf -c 10.0.0.2 -p 5555 -u -b 100M -t 10`

* For a list of connections at port 6633, do (in an external terminal):  
  `netstat -anp | grep 6633`

* xterm 'c0' gives a terminal on the 'localhost'/VM, because a socket-connection in Wireshark gives this IP address as the source.


### OFCTL and OVSCTL:
The `ovs-ofctl` program is a command line tool for monitoring and administering OpenFlow Switches.
It can also show the current state of an OF switch, including features, configuration and table entries.
the `ovs-vsctl` program configures ovs-switchd(8) by providing a high-level interface to its configuration database.

* Add a flow towards the controller:  
  `s1 ovs-ofctl -O OpenFlow13 add-flow tcp:127.0.0.1:6634 priority=1,action=output:controller`
* Add a group (and supporting flow towareds group) to a switch:  
  `sh ovs-ofctl -O OpenFlow13 add-group s1 group_id=32,type=all,bucket=output:2,bucket=output:1`  
  `sh ovs-ofctl -O OpenFlow13 add-flow s1 in_port=3,actions=group:32`
* More information from the switch is via `dump-[flows, groups, ports]`
* For a connection status update: `ovs-vsctl show`