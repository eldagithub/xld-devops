APP_VERSION=x.y.z
PROFILE=WDXB
profile=wdxb
SERVICE=CUSTOMERAGREEMENT
service=customer-agreement-service
warfile=./war/customer-agreement-3.1.3.war

xl apply  -f xebialabs.yaml --values appversion=$APP_VERSION,title=$APP_VERSION,PROFILE=$PROFILE,profile=$profile,SERVICE=$SERVICE,service=$service,warfile=$warfile
xl preview  -f deployment.yaml --values appversion=$APP_VERSION,PROFILE=$PROFILE,profile=$profile,SERVICE=$SERVICE,service=$service,warfile=$warfile
xl apply  -f deployment.yaml --values appversion=$APP_VERSION,PROFILE=$PROFILE,profile=$profile,SERVICE=$SERVICE,service=$service,warfile=$warfile



SERVICE=CUSTOMERAGREEMENT
service=customer-agreement
war=./war/customer-agreement-3.1.3.war
xl apply  -f application.yaml --values appversion=$APP_VERSION,title=$APP_VERSION,PROFILE=$PROFILE,profile=$profile,SERVICE=$SERVICE,service=$service,warfile=$warfile


xl apply  -f xebialabs.yaml --values appversion=$APP_VERSION,title=$APP_VERSION
xl preview  -f deployment.yaml --values appversion=$APP_VERSION
xl apply  -f deployment.yaml --values appversion=$APP_VERSION
