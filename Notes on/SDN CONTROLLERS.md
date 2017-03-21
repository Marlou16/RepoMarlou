## Notes on SDN controllers
Usefull commands and installation tips. Also something about TLS configuration :)

### RYU
* Installing Ryu is possible via:  
  `git clone git://github.com/osrg/ryu.git`  
  `cd ryu`
  `python ./setup.py install`
* Getting the version:
  `~/ryu/bin/ryu-manager --version`
* Running RYU with SSL/TLS (after (standardly) configured):  
  `PYTHONPATH=. ./bin/ryu-manager ./ryu/app/simple_switch_13.py --verbose --ctl-privkey /etc/openvswitch/ctl-privkey.pem  --ctl-cert /var/openvswitch/ctl-cert.pem --ca-certs /var/lib/openvswitch/pki/switchca/cacert.pem`
* Running Ryu with debug output is with the option `--verbose`
* You can set the controller listening port via `--ofp-tcp-listen-port <portnumber>`
* For the Ryu GUI application, see [link](ryu.readthedocs.io/en/latest/gui.html),  
  `PYTHONPATH=. ./bin/ryu run --observe-links ryu/app.gui_top.....`  
  Note that here only the LLDP messages (<dl_type=0x88cc>) arrive at the controller. 


### ONOS
* Running ONOS on the clean VM of Ficky:  
  `source ~/onos/tools/dev/bash_profile`  
  `ok clean`
* Reaching the GUI via:  `http://localhost:8181/onos/ui/index.html` [onos/rocks]
* ONOS has focused on the service providers' needs, which landed it a role as a local controller for AT&T.


### OpenDaylight (ODL)
* Speedup your compliations: `mvn install -DskipTests -DskipIT -nsu`
* Finding the controller run (Karaf) file:  (SDNHUB version)
  `SDNHub_Opendaylight_Tutorial/distribution/opendaylight-karaf/target/assembly/bin/karaf`
* Reaching the GUI via:  `http://localhost:8181/index.html#/topology` [admin/admin]
  If unsure, use `http:list | grep dlux`.
* problems with the pom.xml (or related)? See the ODL tutorial and Try:  
  `wget -q -O - https://raw.githubusercontent.com/opendaylight/odlparent/master/settings.xml > ~/.m2/setting.xml`
* Important features for a clean ODL build `odl-restconf` `odl-l2switch-switch` `odl-mdsal-apidocs` `odl-dlux-all`
* ODL was created to be the Linux of networking:  
  One platform to have a very long life and enable people to build a wide range of solutions to solve a wide range of problems. 
  AT&T is using the ODL controller as its basis for its global SDN controller.


### HPE VAN:
* After installation (see installation guide), it starts up at VM startup.
* Change or check the service: `sudo service [sdnc/sdna] [status/start/stop]`
* Reaching the GUI via:  `https://localhost:8443/sdn/ui/app/index` [sdn/skyline]


### Encountered Software / packages
* **OSGi** (Open Service Gateway Initiative) is a platform which is used at the backend of i.e. OpenDaylight.
  It allows dynamically loading bundles and packaged jar files, and binding bundles together for information exchange.
* **Karaf** is a small OSGi based runtime which provides a lightweight container for loading different modules.
* Concretely as example:  
  ONOS is written in Java and uses OSGi for functionality management, where the individual features are loaded using Karaf.
* _POM_ in pom.xml = Project Object Model.
  This file uses **Maven** to script dependencies between bundles and also to describe which bundles to load on start.


### TLS stuff!
These commands are only usefull after the generation of certificates. (example [link](http://ryu.readthedocs.io/en/latest/tls.html))

* Configure openvswitch SSL:  
  `sudo ovs-vsctl set-sll /etc/openvswitch/sc-privkey.pem /etc/openvswitch/sc-cert.pem /var/lib/openvswitch/pki/controllerca/cacert.pem`
* Run Ryu Simple Switch with SSL:  
  `./ryu/bin/ryu-manager ./ryu/ryu/app/simple_switch_13.py --ctl-privkey /etc/openvswitch/ctl-privkey.pem --ctl-cert /etc/openvswitch/ctl-cert.pem --ca-certs /var/lib/openvswitch/pki/switchca/cacert.pem --verbose`
* Run total hybrid impersonator over SSL:  
  `sudo python3 imp_hybrid.py 192.168.253.130 6633 --privkey /etc/openvswitch/sc-privkey.pem --cert /etc/openvswitch/sc-cert.pem --cacert /var/lib/openvswitch/pki/controllerca/cacert.pem`
