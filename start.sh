#!/bin/bash
echo "Starting openconnect"
echo "${VPN_PASS}" | /usr/sbin/openconnect ${VPN_OPT} ${VPN_SRV}