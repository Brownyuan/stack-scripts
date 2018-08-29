#!/bin/bash



#------------------------------------------------------
#|                 dns-proxy.sh                       |
#|                                                    |
#------------------------------------------------------

# dns-proxy deployment
# Replace `MYWAN` `MYPORTRANGE` below
WAN="MYWAN"
PORTR="MYPORTRANGE"  # example 16345:16355
VERSION="0.0.3"
wget https://github.com/meninasx86/dns-proxy/releases/download/${VERSION}/dns-proxy-${VERSION}.zip
unzip dns-proxy-${VERSION}.zip
cd dns-proxy
./ctl start $WAN $PORTR 
