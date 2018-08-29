#!/bin/bash



#------------------------------------------------------
#|                 sskcp-server-deploy.sh             |
#|                                                    |
#------------------------------------------------------

# Deploy sskcp-server on docker swarm manager
#Replace `COMPFILENAME[1-n]` below

COMP=("COMPFILENAME1" "COMPFILENAME2" "COMPFILENAME3" "COMPFILENAMEn")

for i in ${COMP[@]}; do

	docker stack deploy	-c /${i}.yml $i 

done

