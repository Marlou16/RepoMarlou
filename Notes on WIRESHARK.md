### WIRESHARK filtering for OpenFlow (1.3)

* in the _Mininet VM_ running the _RYU_ controller:  
`of and (!of13.echo_reply.length > 0 and !of13.echo_request.length > 0)`
* in the _SDNHUB VM_ running the _RYU_ controller:  
`openflow_v4 and openflow_v4.type != ofpt_echo_reply and openflow_v4.type != ofpt_echo_request`
* in the _SDNHUB VM_ running the _ODL_ controller (or others with multipart messages):  
`openflow_v4 and openflow_v4.type != ofpt_multipart_request and openflow_v4.type != ofpt_multipart_reply`


### Random Tips
* The layout is to set via `Edit` -> `Preferences`
* **Debug as** Is to find via right click on a packet.
