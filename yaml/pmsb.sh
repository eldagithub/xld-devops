APP_VERSION=1.0.0
PROFILE=PMSB
profile=pmsb
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
