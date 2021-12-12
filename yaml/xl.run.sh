QSVC=QORESVC4
qsvc=qoresvc4
POOL=NEXTRELEASE4
pool=nextrelease4
ENV=SIM4
envenv=sim4
home=/Users/s2ipgm/$qsvc/$pool/$envenv
server=is2ive1011

xl apply  -f qsvc-xebialabs.yaml --values appversion=$APP_VERSION,QSVC=$QSVC,POOL=$POOL,ENV=$ENV,home=$home,server=$server,PROFILE=$PROFILE,profile=$profile,SERVICE=$SERVICE,service=$service,tomcatnode=$tomcatnode,porthttp=$porthttp,porthttps=$porthttps

APP_VERSION=88.m.n
PROFILE=RDM4
profile=rdm4
tomcatnode=tdcom$profile
porthttp=8080
porthttps=8081

SERVICE=ISSUEDEVICE-$PROFILE
service=issue-device-$profile

xl apply  -f profile-xebialabs.yaml --values appversion=$APP_VERSION,QSVC=$QSVC,POOL=$POOL,ENV=$ENV,home=$home,server=$server,PROFILE=$PROFILE,profile=$profile,SERVICE=$SERVICE,service=$service,tomcatnode=$tomcatnode,porthttp=$porthttp,porthttps=$porthttps



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
