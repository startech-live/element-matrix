export CERT_FILE=/etc/certs/..
export PKEY_FILE=/etc/certs/..
export HOST_IP=
export COTURN_PASS=

echo """listening-port=3478
tls-listening-port=5349
listening-ip=$HOST_IP
external-ip=$HOST_IP
min-port=63000
max-port=63059
use-auth-secret
static-auth-secret=$COTURN_PASS

realm=$MY_DOMAIN_COT
user-quota=12
total-quota=1200
no-tcp-relay

cert=$CERT_FILE
# TLS private key file
pkey=$PKEY_FILE

stdout
no-cli

denied-peer-ip=10.0.0.0-10.255.255.255
denied-peer-ip=192.168.0.0-192.168.255.255
denied-peer-ip=172.16.0.0-172.31.255.255
""" > coturn/turnserver.conf

echo """## Turn ##
turn_uris: [ \"turn:$MY_DOMAIN_COT?transport=tcp\", \"turns:$MY_DOMAIN_COT?transport=tcp\" ]
turn_shared_secret: \"$COTURN_PASS\"
turn_user_lifetime: 86400000
turn_allow_guests: true
""" >> synapse/homeserver.yaml