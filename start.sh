#!/bin/bash
echo "Starting openconnect"
if [ $VPN_USER ]; then
echo "${VPN_PASS}" | /usr/sbin/openconnect -u ${VPN_USER} ${VPN_OPT} ${VPN_SRV}
else
echo "${VPN_PASS}" | /usr/sbin/openconnect ${VPN_OPT} ${VPN_SRV}
fi