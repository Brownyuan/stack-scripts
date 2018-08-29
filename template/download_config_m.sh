#!/bin/bash

#------------------------------------------------------
#|                download_config_m.sh                |
#|                                                    |
#------------------------------------------------------

# This script downloads an asset from latest or specific Github release of a
# private repo. Feel free to extract more of the variables into command line
# parameters.
#
# PREREQUISITES
#
# curl, wget, jq
#
# If your version/tag doesn't match, the script will exit with error.



# Update attributes
# Replace `MYTOKEN` `MYREPO` `MYVERSION` below
TOKEN="MYTOKEN"   # token for downloading released package of private repositories
REPO="MYREPO"
VERSION="MYVERSION"   # tag name or the word "latest"
COMPOSEFILE="sskcp_compose-0.0.2.zip"
CONFFILE="sskcp_conf-0.0.2.zip"
GITHUB="https://api.github.com"


function gh_curl() {
  curl -H "Authorization: token $TOKEN" \
       -H "Accept: application/vnd.github.v3.raw" \
       $@
}


function verify_ver(){
ver=$1
FI=$2
if [ "$ver" = "latest" ]; then
  # Github should return the latest release first.
  parser=".[0].assets | map(select(.name == \"$FI\"))[0].id"
else
  echo $ver
  parser=". | map(select(.tag_name == \"$ver\"))[0].assets | map(select(.name == \"$FI\"))[0].id"
fi;

asset_id=`gh_curl -s $GITHUB/repos/$REPO/releases | jq "$parser"`
if [ "$asset_id" = "null" ]; then
  echo "ERROR: version not found $ver"
  exit 1
fi;
}

function get_conf(){
	FI=$1
	echo $asset_id
	wget -q --auth-no-challenge --header='Accept:application/octet-stream' \
  		https://$TOKEN:@api.github.com/repos/$REPO/releases/assets/$asset_id \
		-O $FI
	echo "----------------------------------------"
    echo "|            list pwd                  |"
    echo "----------------------------------------"
    ls $PWD
}

function mv_conf(){
	FL=$1
    mv $FL /
    unzip -d / /$FL
    echo "----------------------------------------"
    echo "|            list pwd                  |"
    echo "----------------------------------------"
    ls $PWD 
    echo "----------------------------------------"
    echo "|            list /                    |"
    echo "----------------------------------------"   
    ls /
}

verify_ver $VERSION $COMPOSEFILE
get_conf $COMPOSEFILE
mv_conf $COMPOSEFILE

verify_ver $VERSION $CONFFILE
get_conf $CONFFILE
mv_conf $CONFFILE




