#!/bin/bash

MOD=$1
CONFIGPATH=$2

combine(){
	cat shebang ${1}/header ${2}/config ${1}/${MOD} > ${1}.sh
	cat ${1}.sh
}

combine ${MOD} ${CONFIGPATH} 
