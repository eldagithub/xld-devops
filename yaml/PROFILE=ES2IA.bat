PROFILE=ES2IA
profile=es2ia
SERVICE=CUSTOMERPROFILE
service=cutsomerprofile
home=/Users/s2ipgm/qoresvc/optima/dev
tomcatnode=tdcom$profile
porthttp=8080
porthttps=8081




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



