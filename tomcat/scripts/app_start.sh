#!/bin/bash
cd "$(dirname "$0")"

. ./http-function.sh
. ../etc/node.lst

#APP="pickup-manager"

ACTION="start"
APP2="$(echo $(basename -s .sh -- "$0") | sed 's/$ACTION//')"
echo app2 : $APP2

echo name :$(basename -s .sh -- "$0") 



URL="$URLTOMCAT/$ACTION?path=/$APP"
httpcheckCodeBody $URL OK*

