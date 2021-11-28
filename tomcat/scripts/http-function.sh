. ../etc/node.lst

SCRIPTNAME=$1
ACTION=$2
APP=$SCRIPTNAME

case "$ACTION" in
  (start|start|reload) ;;
  (*) echo "Please provide allowed input : stop|start|reload" && exit 11 ;;
esac


URL="$URLTOMCAT/$ACTION?path=/$APP"
echo URL : $URL


httpcheckCodeBody() {
set +x
    local url=$1
    local body=$2

    [[ -z "$url" ]] || [[ -z "$body" ]] && echo "Input are not fully provided : httpcheckCodeBody url body" && return 12

    #local http_response=$(curl $TOMCAT_CONNEXION -w "HTTPSTATUS:%{http_code}" --silent "$URL")
    local http_response=$(curl $CURL_OPTS --silent --write-out "HTTPSTATUS:%{http_code}" -X GET $URL)

    local http_status=$(echo $http_response | tr -d '\n' | sed -E 's/.*HTTPSTATUS:([0-9]{3})$/\1/')
    local http_body=$(echo $http_response | sed -E 's/HTTPSTATUS\:[0-9]{3}$//')

    echo http_status : $http_status
    echo http_body : $http_body

    [[ $http_status != 200 ]] && echo http status not 200 && return 13
    [[ $http_body != ${body} ]] && echo http body does not contains $body && return 14

    return 0
}


