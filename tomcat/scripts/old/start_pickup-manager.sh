#!/bin/bash
#NOT NEED TO CUSTOM
#Generic script based only script name :
#action_application-name.sh
#action : stop|start|reload
#application-name : application name without "_"


cd "$(dirname "$0")"

. ./http-function.sh $(basename -s .sh -- "$0")


httpcheckCodeBody $URL OK*

