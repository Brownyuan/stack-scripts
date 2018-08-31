#!/bin/bash

MOD=$1
CONFIG=$2
SBEXIST=$3

if [ $# != 3 ];then
	echo "Usage: $0 <attrubute>"
	echo " "
	echo "attrubute:"
	echo "module	   module dir name"
	echo "config     configuration file for module"
	echo "true/false shebang exists or not "

	exit 1
fi

combine(){
	if [ $3 == "true" ];then
		cat shebang ${1}/header ${2} ${1}/code > output/${1}.sh
	elif [ $3 == "false" ];then
		cat ${1}/header ${2} ${1}/code > output/${1}.sh
	else
		echo "Wrong attrubute for shebang exists"
		exit 1
	fi
	cat output/${1}.sh
}

combine ${MOD} ${CONFIG} ${SBEXIST}
