APP_VERSION=1.0.0
PROFILE=PMSB
profile=pmsb
tomcatnode=tdcom$profile
porthttp=8080
porthttps=8081

SERVICE=ISSUEDEVICE-$PROFILE
service=issue-device-$profile

xl apply  -f profile-application-parm.yaml  --values appversion=$APP_VERSION,QSVC=$QSVC,PROFILE=$PROFILE,profile=$profile
xl apply  -f profile-application-lib.yaml  --values appversion=$APP_VERSION,QSVC=$QSVC,PROFILE=$PROFILE,profile=$profile
xl apply  -f profile-application-scripts.yaml  --values appversion=$APP_VERSION,QSVC=$QSVC,PROFILE=$PROFILE,profile=$profile

xl apply  -f profile-xebialabs.yaml --values appversion=$APP_VERSION,QSVC=$QSVC,POOL=$POOL,ENV=$ENV,home=$home,PROFILE=$PROFILE,profile=$profile,server=$server,SERVICE=$SERVICE,service=$service,tomcatnode=$tomcatnode,porthttp=$porthttp,porthttps=$porthttps


mkdir -p /Users/s2ipgm/$qsvc/$pool/$envenv/$profile/parm
mkdir -p /Users/s2ipgm/$qsvc/$pool/$envenv/$profile/lib
mkdir -p /Users/s2ipgm/$qsvc/$pool/$envenv/$profile/scripts
mkdir -p /Users/s2ipgm/$qsvc/$pool/$envenv/$profile/$tomcatnode/webapps


for fic in hhh iii kkk lll mmm; do echo $fic;
SERVICE=ISSUEDEVICE-$PROFILE-$fic
service=issue-device-$profile-$fic
xl apply  -f application.yaml  --values appversion=$APP_VERSION,QSVC=$QSVC,PROFILE=$PROFILE,profile=$profile,SERVICE=$SERVICE,service=$service

done