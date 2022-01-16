mkdir -p {{qsvc.profile.home}}/scripts
mkdir -p {{qsvc.profile.home}}/etc
mkdir -p {{qsvc.profile.home}}/parm
mkdir -p {{qsvc.profile.home}}/lib

mv apache-tomcat-9.0.56.tar.gz.lst apache-tomcat-9.0.56.tar.gz  
tar zxvf apache-tomcat-9.0.56.tar.gz 

mv apache-tomcat-9.0.56 {{qsvc.profile.tomcat.instance}}
cd {{qsvc.profile.tomcat.instance}}/conf
rm context.xml
ln -s ../../etc/context.xml context.xml

rm tomcat-users.xml
ln -s ../../etc/tomcat-users.xml tomcat-users.xml

cd ../../
mv {{qsvc.profile.tomcat.instance}} {{qsvc.profile.home}}

