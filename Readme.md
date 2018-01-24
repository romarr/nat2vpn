# NAT TO VPN 

## Usage
### Create attachable network
To use this container with swarm, run a single vpn2nat container in an attachable overlay network
```bash
docker network create --driver=overlay --attachable vpn
```

Without swarm mode  

```bash
docker network create --attachable vpn
```

Note: Use a specific subnet to avoid routing conflicts
```bash
docker network create --driver=overlay --attachable --subnet 192.168.200.0/24 vpn
```

### Run container in privileged mode
```bash
docker run -d --name nat2vpn --net vpn --privileged \
-e VPN_USER="" -e VPN_PASS="" -e VPN_OPT="" \
-e APP_PORT="" -e APP_ADDR="" -e VPN_SRV="" romsys/nat2vpn
```

```bash
VPN_USER = VPN Username *
VPN_PASS = VPN Password
VPN_OPT = Optinnal commands *
APP_PORT = Port to translate *
APP_ADDR = Ip to translate *
VPN_SERV = VPN Server address
*: optionnal
```

## Exemple
Now you can access your NATed service through your nat2vpn container  
With a rails *database.yml*
```yml
distantdb:  
    adapter: postgresql  
    host: nat2vpn  
    database: mydistantdb  
```