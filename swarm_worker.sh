#!/bin/bash



#------------------------------------------------------
#|                       swarm_worker.sh              |
#|                                                    |
#------------------------------------------------------

# docker swatm join, change `TOKEN` `IP` `PORT` below
# ssh to MANAGER  and run "docker swarm join-token worker"
docker swarm join --token TOKEN IP:PORT