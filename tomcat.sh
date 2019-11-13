#!/bin/sh
cd

if ! java -version ; then
    yum -y  install java-1.8.0-openjdk-devel.x86_64
fi

tar -zxf apache-tomcat-8.0.30.tar.gz

read -p "input shiligeshu:" num

for i in `seq ${num}`
do

[ ! -d /usr/local/tomcat${i} ] && mkdir /usr/local/tomcat${i}
          
cp -a /root/apache-tomcat-8.0.30/* /usr/local/tomcat${i}/
          
sed -i '1iexport CATALINA_HOME=/usr/local/tomcat'${i}''  /usr/local/tomcat${i}/bin/shutdown.sh /usr/local/tomcat${i}/bin/startup.sh
        
sed -i -e 's/8080/'808${i}'/g' -e 's/8005/800'$i'/g' /usr/local/tomcat${i}/conf/server.xml
             
cd /usr/local/tomcat${i}/bin

./startup.sh
    
done
