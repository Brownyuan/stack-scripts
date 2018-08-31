# StackScripts

StackScripts used in Linode and Vultr 


### StackScripts

##### Basic scripts

```
./gen.sh basic basic/config false
```

##### Download configiguration

* Download docker compose and sskcp_config for swarm manager

```
 ./gen.sh download_conf_m  download_conf_m/config false
```

* Download sskcp_config for swarm worker

```
./gen.sh download_conf_w  download_conf_w/config false
```

##### Swarm worker

```
./gen.sh swarm_worker swarm_worker/config false
```

##### ss-kcp-server 

```
./gen.sh sskcp_server_deploy sskcp_server_deploy/config false
```


##### dns-proxy

```
./gen.sh dns_proxy dns_proxy/config false
```


