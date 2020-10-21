#!/bin/sh
#tomcat_tar包要在root家目录下
#安装的tomcatweb端口是从8081-808*
#安装的tomcat停止端口是从8001-800*
#安装的目录是在/usr/local/tomcat*
install(){
cd

if ! java -version ; then
    yum -y  install java-1.8.0-openjdk-devel.x86_64
fi

tar -zxf apache-tomcat-8.0.30.tar.gz

read -p "input shiligeshu:" num

for i in `seq ${num}`
do

[  -d /usr/local/tomcat${i} ] && echo "tomcat instaalled" && exit 
[ ! -d /usr/local/tomcat${i} ] && mkdir /usr/local/tomcat${i} 


cp -a /root/apache-tomcat-8.0.30/* /usr/local/tomcat${i}/

sed -i '1iexport CATALINA_HOME=/usr/local/tomcat'${i}''  /usr/local/tomcat${i}/bin/shutdown.sh /usr/local/tomcat${i}/bin/startup.sh

sed -i -e 's/8080/'808${i}'/g' -e 's/8005/800'$i'/g' /usr/local/tomcat${i}/conf/server.xml

cd /usr/local/tomcat${i}/bin

./startup.sh

done
}

select a in start stop install uninstall
do
	case $a in 
		start)
		dir=`ls /usr/local/ | awk '/^tomcat/'`
		for i in ${dir}
		do
		bash  /usr/local/${i}/bin/startup.sh
		done
			;;
		stop)
		dir=`ls /usr/local/ | awk '/^tomcat/'`
		for i in ${dir}
		do
		bash /usr/local/${i}/bin/shutdown.sh	
		done
			;;
		install)
		install 
			;;
		uninstall)
		dir=`ls /usr/local/ | awk '/^tomcat/'`
		for i in ${dir}
		do
			bash /usr/local/${i}/bin/shutdown.sh
		done
		rm -rf /usr/local/tomcat*
		[ $? -eq 0 ] && echo "uninstall ok"
			;;
		*)			
		exit
			;;
	esac
done
