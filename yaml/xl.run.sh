APP_VERSION=1.m.n
home=/Users/s2ipgm/qoresvc/optima/dev
PROFILE=ES2IA
profile=es2ia
tomcatnode=tdcom$profile
porthttp=8080
porthttps=8081

SERVICE=ISSUEDEVICE
service=issue-device-service




xl apply  -f xebialabs.yaml --values appversion=$APP_VERSION,home=$home,PROFILE=$PROFILE,profile=$profile,SERVICE=$SERVICE,service=$service,tomcatnode=$tomcatnode,porthttp=$porthttp,porthttps=$porthttps
xl preview  -f deployment.yaml --values appversion=$APP_VERSION,home=$home,PROFILE=$PROFILE,profile=$profile,SERVICE=$SERVICE,service=$service,tomcatnode=$tomcatnode,porthttp=$porthttp,porthttps=$porthttps
xl apply  -f deployment.yaml --values appversion=$APP_VERSION,home=$home,PROFILE=$PROFILE,profile=$profile,SERVICE=$SERVICE,service=$service,tomcatnode=$tomcatnode,porthttp=$porthttp,porthttps=$porthttps



SERVICE=CUSTOMERAGREEMENT
service=customer-agreement
war=./war/customer-agreement-3.1.3.war
xl apply  -f application.yaml --values appversion=$APP_VERSION,home=$home,PROFILE=$PROFILE,profile=$profile,SERVICE=$SERVICE,service=$service,tomcatnode=$tomcatnode,porthttp=$porthttp,porthttps=$porthttps


xl apply  -f xebialabs.yaml --values appversion=$APP_VERSION,title=$APP_VERSION
xl preview  -f deployment.yaml --values appversion=$APP_VERSION
xl apply  -f deployment.yaml --values appversion=$APP_VERSION
