# StackScripts

StackScripts used in Linode and Vultr 


### StackScripts

##### Basic scripts

* System upgrade
* Install docker-ce, iftop, tree...
* Set timezone to HK


##### Swarm manager

* Basic scripts + swarm init

```
cat template/basic.sh swarm_manager.sh > combine.sh

```

##### Swarm worker

* Basic scripts + swarm join

```
cat template/basic.sh template/swarm_worker.sh > combine.sh

```


##### ss-kcp-server 

* Basic scripts + swarm init + ss-kcp-server(sskcp_conf and docker-compse.yml)

```
cat template/basic.sh template/swarm_manager.sh template/download_config_m.sh template/sskcp_server_deploy.sh > combine.sh

```

* Basic scripts + swarm join + ss-kcp-server(docker-compose.yml)

```
cat template/basic.sh template/swarm_worker.sh template/download_config_w.sh > combine.sh

```


##### ss-kcp-server + dns-proxy

* Basic scripts + swarm init + ss-kcp-server(sskcp_conf and docker-compse.yml) + dns-proxy

```
cat template/basic.sh template/swarm_manager.sh template/download_config_m.sh template/sskcp_server_deploy.sh template/dns_proxy.sh > combine.sh

```


* Basic scripts + swarm join + ss-kcp-server(docker-compose.yml) + dns-proxy

```
cat template/basic.sh template/swarm_worker.sh template/download_config_w.sh template/dns_proxy.sh > combine.sh

```




