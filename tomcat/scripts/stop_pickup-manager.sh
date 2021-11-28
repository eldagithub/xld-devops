#!/bin/bash
#NOT NEED TO CUSTOM
#Generic script based only script name :
#action_application-name.sh
#action : stop|start|reload
#application-name : application name without "_"


cd "$(dirname "$0")"

. ./http-function.sh
. ../etc/node.lst


SCRIPTNAME=$(basename -s .sh -- "$0")
ACTION=${SCRIPTNAME%_*}
APP=$(echo $SCRIPTNAME | sed "s/${ACTION}_//")

URL="$URLTOMCAT/$ACTION?path=/$APP"
echo URL : $URL

httpcheckCodeBody $URL OK*

