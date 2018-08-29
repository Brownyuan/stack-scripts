#!/bin/bash



#------------------------------------------------------
#|                       swarm_worker.sh              |
#|                                                    |
#------------------------------------------------------

# docker swatm join, replace `TOKEN` `IP` `PORT` below
# ssh to MANAGER  and run "docker swarm join-token worker" to get token, IP and PORT
TOKEN="MYTOKEN"
IP="MYIP"
PORT="MYPORT"
docker swarm join --token $TOKEN $IP:$PORT
