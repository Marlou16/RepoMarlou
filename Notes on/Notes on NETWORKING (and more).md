### Points on Networking protocols
* `TCP/UDP` is located in the _transportlayer_, while `IP` resides in the _networklayer_.
* `TCP` runs connection-oriented, thus first a connection is established.
* `IP` runs in connectionless mode.
* The architecture of `IP` supports the collaboration of switches and routers.
* The _maximum_ transferable unit (`MTU`) of a IP packet is 2^16-1 = 65535 bytes.
* Known _IP protocols_ are `TCP` (=6), `UDP` (=17) and `ICMP` (=1);
  In other words, protocols like TCP,UDP and ICMP make use of IP packets.
* `NAT` = network address translation;  
  Every office gets one or a couple of addressess as _shared IP address_. The server thinks that a lot of computers have the same IP adress, and mutually information is exchanged using unique addresses which are hold private. This way, one cannot reach local hosts via the Internet.
* `ARP` = address resolution protocol;  
  It is the translation of IP address to (physical) MAC address. ARP is officially a datalinklayer protocol.
* `DHCP` = dynamic host configuration protocol;  
  A computer recieves his IP address in a dynamic fashion from a DHCP server. This works with UDP packets.
* `LLDP` = Link Layer Discovery Protocol.
* TCP connection are full duplex and point-to-point; they are not to use for multi- and broadcasting.
* _sockets_ are a combination of a IP address and (16-bit) portnumber to identify machines.
* In _URL's_, we find the parameters behind the "?" symbol, separated by "&".


### Notes on Networking terms and (external) principles
* Unlike a physical Ethernet switch, a _virtual switch_ (such as OVSwitch) is realized in software, 
  typically in a hypervisor running on a general-purpose compuer.
* Virtual Extensible LAN (**VXLAN**)
  is a proposed encapsulation protocol for running an overlay network on existing L3 infrastructure.
  VXLAN will make it easier to scale out a cloud computing environment while logically isolatingapps and tenants. The primary goal of VXLAN is to extend the virtual LAN address space. 'Millions of isolated L2 VXLANs can co-exist on a common L3 infrastructure'.
  As with VLANs, only VMs within the same logical network can communicate with each other.
* **VTEP** = VXLAN Tunnel Endpoint
* The most compelling benefit of VMs is _server consolidation_;
  a virtual server that hosts multiple VMs can easily reach 50-80% utilization. The net result is that more VMs can be hosted on fewer physical servers, translating into lower costs for hardware acquisition, maintenance,  and energy and cooling system usage.
* **REST** = Representational State transfer;  
  REST is a architectural style, the so-called architecture of the web. `HTTP` follows REST.
* **URI/URL** = Uniform Resource Identifier / Locator;  
  A URL is a subset from a URI, and identifies a resource and also provides the means of locating the resource by describing the way to access it. 
* **API** = Application programming interface;  
  An API is an interface presented by sofware that provides the capability to collect information from or make a change to an underlying set of resources.
  If your switch or router has an API, it means that the vendor has put into place some kind of mechanism where you can send it commands through more automated means than a CLI.
* **DMZ** = demilitarized zone;  
  In computer networks, a demilitarized zone is a physical or logical sub-network that separates an internal local area network (LAN) from other untrusted parts, usally the Internet.


### Notes on "Networking" Software
* **Docker** is kind of like a virtual machine.
  But, instead of creating a whole virtual OS, it lets applications take advantage of the same linux kernel as the system is running on. Docker is 'Container as a Service' (CaaS). Containers let developers package up an application with all of the necessary parts, such s libraries and other elements it is dependent upon, and then ship it all out as one package.
* **ServiceNow** offers everything-as-a-service cloud computing, including platform-as-a-service, enterprise service management sofware.
* **Puppet** is used for configuration management, as part of _network automation_.
* **Elastic(Search)** is a software program to search and analyze large datasets at the same time. 
  Here, the focus relies on distributed servers, where they search on metadata level.
* A **blockchain** is a distributed database which manages a growing list of data-items which are protected against manipulation (i.e. after registration, editing isn't possible anymore).
  Inside the system we keep having data-exchanges and verification, which is done via consensus.
  A blockchain contains blocks and blockheaders. The block contain the data, the headers state when and in which order blocks are registered and contain a reference towards the previous block, in which way a chain is created. The reference is in fact a hash of the header of the previous block.
  In the world of SDN _SecureChain_ is a solution that introduces security gateway into SDN, whilst creating a forensically auditable and uncahgeable log of events.
  With _Authenticain_ it is possible to manage a private network of smart devices that are mutally authenticated and verified.


### Notes on VM interfacing
**HOST-ONLY**:
* Virtual machines can talk to each other (and the host) as if they are connected through a physical Ethernet switch.
* They are not(!) connected to a physical networking interface, thus the VMs cannot talk to the outside world.
* A new software interface is created which appears next to existing network interfaces.
**NAT**:
* A VM with NAT enabled acts much like a real computer that connects to the Internet through a router.
* The 'router' is the hypervisor (i.e. VirtualBox) network engine, which maps traffic from and to the VM transparently.
* In the hypervisor, the router is placed between each VM and the host; this maximizes the security because by default VMs cannot talk to each other.
* In NAT mode, the VM is invisible and unreachable from the outside network, much like a private network behing a router.


#### [BONUS] The 'looping' problem:
Transparant bridging of L2/Ethernet networks doesn't work with loops; ARP does broadcast, flooding by default, learning switches don't get what to do with the same MAC on multiple ports (potentially learn themselves) and Ethernet framse don't have TTL like IP does. A variant of STP (~=spanning tree protocol) (removing links to remove loops) could solve this, throwing away network bandwidth.