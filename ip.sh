name="`ifconfig | awk -F:  'NR == 1{print $1}'`"
netmasks=(
255.255.255.0
255.255.255.255
255.255.0.0
255.0.0.0
)
read -p " ipaddr default 192.168.190.2:" ips
[ -z "$ips" ] && ips=192.168.190.2
ip=${ips}


read -p " gateway  default 192.168.190.2:" gws
[ -z "$gws" ] && gws=192.168.190.2
gw=${gws}


for (( i=1;i<=${#netmasks[@]};i++)); do
	h=${netmasks[$i-1]}
echo $i $h
done
read -p "netmask  default ${netmasks[0]}:" zw
[ -z "$zw" ] && zw=1
#expr ${zw} + 1 &>/dev/null

netmask=${netmasks[$zw-1]}

read -p " ip dir default is </etc/sysconfig/network-scripts/>:" ipdir
[ -z $ipdir ] && ipdir=/etc/sysconfig/network-scripts/
[ !  -d $ipdir ] && mkdir $ipdir 

read -p "确定更改y/n：" se
[ -z $se ] && se="n"
case $se in
"n")
kill -9 $$
;;
esac

cat > ${ipdir}/ifcfg-${name} <<eof
TYPE="Ethernet"
PROXY_METHOD="none"
BROWSER_ONLY="no"
BOOTPROTO="none"
NAME="$name"
DEVICE="$name"
ONBOOT="yes"
IPADDR=${ip}
GATEWAY=${gw}
NETMASK=${netmask}
eof
