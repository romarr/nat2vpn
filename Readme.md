# NAT TO VPN

## Usage
### Create attachable network
To use this container with swarm, run a single vpn2nat container in an attachable overlay network
> docker network create --driver=overlay --attachable vpn  

Without swarm mode  

> docker network create --attachable vpn

Note: Use a specific subnet to avoid routing conflicts
> docker network create --driver=overlay --attachable --subnet 192.168.200.0/24 vpn

### Run container in privileged mode
> docker run -d --name nat2vpn --net vpn --privileged \\\
-e VPN_PASS="vpn_password" -e VPN_OPT="vpn_opt_cmd" -e VPN_SRV="vpn_srv_ip" \\\
-e APP_PORT="dest_app_port" -e APP_ADDR="dest_app_addr" romsys/nat2vpn

## Exemple
Now you can access your NATed service through your nat2vpn container  
With a rails *database.yml*
> distantdb:  
    adapter: postgresql  
    host: nat2vpn  
    database: mydistantdb  
