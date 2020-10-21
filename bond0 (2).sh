#!/bin/bash
install(){
cd /etc/sysconfig/network-scripts/
ifcfg_names=(`ls -l | awk '/ifcfg/{print $NF}'`)
for ((i=1;i<=${#ifcfg_names[@]};i++));do
h=${ifcfg_names[$i-1]}
echo $i $h
done
read -p "Please select a network card serial number , default ${ifcfg_names[0]} :" net1
[ -z ${net1} ] && net1=1
ifcfg_name1=${ifcfg_names[$net1-1]}
#echo $ifcfg_name1  

for ((i=1;i<=${#ifcfg_names[@]};i++));do
h=${ifcfg_names[$i-1]}
echo $i $h
done
read -p "Please select a network card serial number , default ${ifcfg_names[1]} :" net2
[ -z ${net2} ] && net2=2
ifcfg_name2=${ifcfg_names[$net2-1]}
#echo $ifcfg_name2

#read -p "ifcfg1 name:" ifcfg_name1
#read -p "ifcfg2 name:" ifcfg_name2

ifcfg1=/etc/sysconfig/network-scripts/${ifcfg_name1}
cp ${ifcfg1} /etc/sysconfig/network-scripts/.${ifcfg_name1}.bak
sed -i  -e 's/dhcp/none/' -e 's/ONBOOT=no/ONBOOT=yes/' ${ifcfg1}
sed -i  '$a MASTER=bond0' ${ifcfg1} 
sed -i '$a SLAVE=yes'    ${ifcfg1} 
sed -i  '$a USERCTL=no'   ${ifcfg1} 

ifcfg2=/etc/sysconfig/network-scripts/${ifcfg_name2}
cp ${ifcfg2} /etc/sysconfig/network-scripts/.${ifcfg_name2}.bak
sed -i  -e 's/dhcp/none/' -e 's/ONBOOT=no/ONBOOT=yes/' ${ifcfg2}
sed -i  '$a MASTER=bond0' ${ifcfg2}
sed -i '$a SLAVE=yes'    ${ifcfg2}
sed -i  '$a USERCTL=no'   ${ifcfg2}

read -p "please enter ip:" ip
read -p "please enter netmask:" netmask
read -p "please enter gateway:" gateway

cat > /etc/sysconfig/network-scripts/ifcfg-bond0 << EOF 
DEVICE=bond0
ONBOOT=yes
BOOTPROTO=none
USERCTL=no
IPADDR=${ip}
NETMASK=${netmask}
GATEWAY=${gateway}
TYPE=bonding
BONDING_OPTS='mode=0 miimon=100'
EOF

read -p "Save all configurations y/n:" conf
[ -z $[conf] ] && conf=n
case ${conf} in
n|N)
rm -rf /etc/sysconfig/network-scripts/ifcfg-bond*
mv -f  /etc/sysconfig/network-scripts/.${ifcfg_name1}.bak ${ifcfg1}
mv -f  /etc/sysconfig/network-scripts/.${ifcfg_name2}.bak ${ifcfg2}
echo "Configuration failed"
exit 1
;; 
Y|y)
echo "Configuration is successful"
exit 0
;;
*)
rm -rf /etc/sysconfig/network-scripts/ifcfg-bond*
mv -f  /etc/sysconfig/network-scripts/.${ifcfg_name1}.bak ${ifcfg1}
mv -f  /etc/sysconfig/network-scripts/.${ifcfg_name2}.bak ${ifcfg2}
echo "Configuration failed"
exit 1
;;
esac
}

install
