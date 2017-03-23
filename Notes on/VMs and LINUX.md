## Notes on VMs and packages/commands which come in handy.
Note that some (acutally most) points are also generally applicable in LINUX OSes.

### Package and VM Setup related notes
* Installing a simple _GUI_ for your (empty) VM, `LXDE`:  
  `sudo apt-get install lxde-common lxsession openbox xinit lxterminal`  
  To fix the 'resolution' when enlarging the VM window, try `lxrandr` and/or `open-vm-tools-desktop` (VMWare)
* A simple _web-browser_ is the package `chromium-browser`.
* To build a _network view_ one probably need the `networkx` library/package.
* To see the OVSwitch version (SDN specific): `ovs-vswitchd --version` or `ovs-ofctl --version`.

* Setting IP addresses for the interfaces: `sudo dhclient <interface>`

* Install _sublime text 2_:
  `sudo add-apt-repository ppa:webupd8team/sublime-text-2`  
  `sudo apt-get update`  
  `sudo apt-get install sublime-text`  
  Sometimes needed `apt-get install software-properties-common`;  
  If Ubuntu <12.10 `apt-get install python-software-properties`.
* Install the _package control_ via [link](https://packagecontrol.io/installation).  
  Open it via `ctrl + shift + p`
* The Markdown syntax packages is called _Monokai Extended_.

* _DISABLE IPV6_:  
  `sudo apt-get purge network-manager avahi-daemon`  
  `sudo apt-get --purge autoremove`  
  In `/etc/default/grub/` edit such that *GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1 <resttext>"*  
  `sudo update-grub`  
  reboot!

* Install _scapy_:  
  `git clone https://github.com/secdev/scapy`  
  `cd scapy`  
  `sudo python setup.py install`



### General Linux tips
* To _remove packages_ do: `sudo apt-get (--purge) remove <package_name>`.  
  Note: 'purge' 'remove' and '--purge remove' are alike.
* Finding packages (and installs): `dpkg --list | grep <what-you-seek>`
* To see the _linux (kernel) version): `cat /proc/version`.
* **GRUB** = Grand Unified Bootloader, the standard Linux distribution bootmanager.
* The `curl` command transfers data from or to a server using a protocol such as HTTP:   
  `curl -X PUT http://localhost:8080/firewall/.....` sends the 'PUT' command towareds http://...
* Try: `gedit .bash_history /.python_history` (findable via `ls -la`).
* I <3 `sudo poweroff/reboot`.
* Having 'access problems'?  
  Try `ls -l` and let `sudo chown <user> <file(s)>` solve your problems.
* Firewall GIT problems? Try: `git config --global url."https://".insteadOf git//`


### Networking/hacking packages
* For a list of connections at port 6633, do:  
  `sudo netstat -anp | grep 6633`
  `sudo netstat =nlp | grep 6633`
* portscanning is via nmap:  
  `sudo nmap -v <ip-address> -p <port-range (max 65535)>`
* try something with netcat (nc):  
  Connect: `nc -vv localhost 6633`  
  Connect and send a packet: `nc -vv localhost 6633 < <sending>.pkt`  
  Connect and save a packet: `nc -vv localhost 6633 > <recieved>.pkt`
* When doing changes in packages (such as _pyof_) rebuild via (in this example):  
  `sudo python3 setup.py install`
