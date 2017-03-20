filter out stuff (RYU-POX VM)
	of and (!of13.echo_reply.length > 0 and !of13.echo_request.length > 0)

filter out stuff (SDNHUB VM)
	openflow_v4 and openflow_v4.type != ofpt_echo_reply and openflow_v4.type != ofpt_echo_request

filter out stuff (SDNHUB VM ODL)
openflow_v4 and openflow_v4.type != ofpt_multipart_request and openflow_v4.type != ofpt_multipart_reply



OTHER NOTE
PYTHONPATH=. ./bin/ryu-manager ./ryu/app/simple_switch_13.py --verbose --ctl-privkey /etc/openvswitch/ctl-privkey.pem  --ctl-cert /var/openvswitch/ctl-cert.pem --ca-certs /var/lib/openvswitch/pki/switchca/cacert.pem
