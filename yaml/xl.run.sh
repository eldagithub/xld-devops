Applications/%QSVC%/%PROFILE%/%SERVICE%
Environments/%POOL%/%QSVC%/%ENV%/%POOL%_%QSVC%_%ENV%_%PROFILE%_ENV
Infrastructure/%POOL%/%QSVC%/%ENV%/host-vm-%PROFILE%-%server%/%profile%.tomcat



QSVC=QORESERVICE
qsvc=qoreservice
POOL=SGS
pool=sgs
ENV=DEV
envenv=dev
home=/Users/s2ipgm/$qsvc/$pool/$envenv
server=is2ivb1011

xl apply  -f qsvc-xebialabs.yaml --values appversion=$APP_VERSION,QSVC=$QSVC,POOL=$POOL,ENV=$ENV,home=$home,server=$server,PROFILE=$PROFILE,profile=$profile,SERVICE=$SERVICE,service=$service,tomcatnode=$tomcatnode,porthttp=$porthttp,porthttps=$porthttps

APP_VERSION=1.0.0
PROFILE=PMSA
profile=pmsa
tomcatnode=tdcom$profile
porthttp=8080
porthttps=8081

SERVICE=ISSUEDEVICE-$PROFILE
service=issue-device-$profile
xl apply  -f profile-xebialabs.yaml --values appversion=$APP_VERSION,QSVC=$QSVC,POOL=$POOL,ENV=$ENV,home=$home,PROFILE=$PROFILE,profile=$profile,server=$server,SERVICE=$SERVICE,service=$service,tomcatnode=$tomcatnode,porthttp=$porthttp,porthttps=$porthttps

mkdir -p /Users/s2ipgm/$qsvc/$pool/$envenv/$profile/parm
mkdir -p /Users/s2ipgm/$qsvc/$pool/$envenv/$profile/lib
mkdir -p /Users/s2ipgm/$qsvc/$pool/$envenv/$profile/scripts
mkdir -p /Users/s2ipgm/$qsvc/$pool/$envenv/$profile/$tomcatnode/webapps


xl apply  -f profile-application-parm.yaml  --values appversion=$APP_VERSION,QSVC=$QSVC,PROFILE=$PROFILE,profile=$profile
xl apply  -f profile-application-lib.yaml  --values appversion=$APP_VERSION,QSVC=$QSVC,PROFILE=$PROFILE,profile=$profile
xl apply  -f profile-application-scripts.yaml  --values appversion=$APP_VERSION,QSVC=$QSVC,PROFILE=$PROFILE,profile=$profile


for fic in aaa bbb ccc ddd eee fff ggg; do echo $fic;

SERVICE=ISSUEDEVICE-$PROFILE-$fic
service=issue-device-$profile-$fic
xl apply  -f application.yaml  --values appversion=$APP_VERSION,QSVC=$QSVC,PROFILE=$PROFILE,profile=$profile,SERVICE=$SERVICE,service=$service
xl apply  -f deployment.yaml  --values appversion=$APP_VERSION,QSVC=$QSVC,POOL=$POOL,ENV=$ENV,PROFILE=$PROFILE,profile=$profile,SERVICE=$SERVICE,service=$service

done



xl preview  -f profile-deployment.yaml --values appversion=$APP_VERSION,QSVC=$QSVC,POOL=$POOL,ENV=$ENV,home=$home,server=$server,PROFILE=$PROFILE,profile=$profile,SERVICE=$SERVICE,service=$service,tomcatnode=$tomcatnode,porthttp=$porthttp,porthttps=$porthttps
xl apply  -f profile-deployment.yaml --values appversion=$APP_VERSION,QSVC=$QSVC,POOL=$POOL,ENV=$ENV,home=$home,server=$server,PROFILE=$PROFILE,profile=$profile,SERVICE=$SERVICE,service=$service,tomcatnode=$tomcatnode,porthttp=$porthttp,porthttps=$porthttps

        qsvc.home: !value home
        qsvc.profile.name: !value profile
        qsvc.profile.home: !value home
        qsvc.profile.start: !format "%home%/scripts/start.sh"
        qsvc.profile.stop: !format "%home%/scripts/stop.sh"
        qsvc.profile.adminapp.reload: !format "%home%/scripts/adminapp.sh reload "
        qsvc.profile.adminapp.check: !format "%home%/scripts/adminapp.sh check "
        qsvc.profile.tomcat.name: !value tomcatnode
        qsvc.profile.tomcat.port.http: !value porthttp
        qsvc.profile.tomcat.port.https: !value porthttps




SERVICE=CUSTOMERAGREEMENT
service=customer-agreement
war=./war/customer-agreement-3.1.3.war
xl apply  -f application.yaml --values appversion=$APP_VERSION,QSVC=$QSVC,POOL=$POOL,ENV=$ENV,home=$home,server=$server,PROFILE=$PROFILE,profile=$profile,SERVICE=$SERVICE,service=$service,tomcatnode=$tomcatnode,porthttp=$porthttp,porthttps=$porthttps


xl apply  -f xebialabs.yaml --values appversion=$APP_VERSION,title=$APP_VERSION
xl preview  -f deployment.yaml --values appversion=$APP_VERSION
xl apply  -f deployment.yaml --values appversion=$APP_VERSION
