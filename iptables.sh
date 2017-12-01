#!/bin/bash
echo "Setting nat rules"
iptables -t nat -A PREROUTING -p tcp --dport ${APP_PORT} -j DNAT --to-destination ${APP_ADDR}:${APP_PORT}
iptables -t nat -A POSTROUTING -j MASQUERADE
echo "NAT OK"
exec "$@"