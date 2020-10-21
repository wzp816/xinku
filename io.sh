#!/bin/bash
free -h | awk '/Mem/{printf "总:"$2 "\n" "余:"$4"\n"}'
size=`free -h | awk '/Mem/{printf "总:"$2 "\n" "余:"$4"\n"}' | awk -F: '/余/{print $2}'`
read -p " 请输入循环次数:" num
file=/tmp/tmp
for i in `seq $num`
do
dd if=/dev/urandom of=$file  count=1 bs=1G

rm -rf $file
done
