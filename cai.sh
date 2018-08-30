#!/bin/bash
while :
do
read -p ""
clear
blue=$[RANDOM%16+1]
while :
do
red1=$[RANDOM%33+1]
red2=$[RANDOM%33+1]
red3=$[RANDOM%33+1]
red4=$[RANDOM%33+1]
red5=$[RANDOM%33+1]
red6=$[RANDOM%33+1]
if [ $red1 -ne  $red2 -a $red1 -ne $red3 -a $red1 -ne $red4 -a $red1 -ne $red5 -a $red1 -ne $red6 -a $red2 -ne $red3 -a $red2 -ne $red4 -a $red2 -ne $red5 -a $red2 -ne $red6 -a $red3 -ne $red4 -a $red3 -ne $red5 -a $red3 -ne $red6 -a $red4 -ne $red5 -a $red4 -ne $red6 -a $red5 -ne $red6 ];then
if [ $red1 -gt $red2 ];then
tmp=$red1
red1=$red2
red2=$tmp
fi
if [ $red1 -gt $red3 ];then
tmp=$red1
red1=$red3
red3=$tmp
fi
if [ $red1 -gt $red4 ];then
tmp=$red1
red1=$red4
red4=$tmp
fi
if [ $red1 -gt $red2 ];then
tmp=$red1
red1=$red2
red2=$tmp
fi
if [ $red1 -gt $red5 ];then
tmp=$red1
red1=$red5
red5=$tmp
fi
if [ $red1 -gt $red6 ];then
tmp=$red1
red1=$red6
red6=$tmp
fi
if [ $red2 -gt $red3 ];then
tmp=$red2
red2=$red3
red3=$tmp
fi
if [ $red2 -gt $red4 ];then
tmp=$red2
red2=$red4
red4=$tmp
fi
if [ $red2 -gt $red5 ];then
tmp=$red2
red2=$red5
red5=$tmp
fi
if [ $red2 -gt $red6 ];then
tmp=$red2
red2=$red6
red6=$tmp
fi
if [ $red3 -gt $red4 ];then
tmp=$red3
red3=$red4
red4=$tmp
fi
if [ $red3 -gt $red5 ];then
tmp=$red3
red3=$red5
red5=$tmp
fi
if [ $red3 -gt $red6 ];then
tmp=$red3
red3=$red6
red6=$tmp
fi
if [ $red4 -gt $red5 ];then
tmp=$red4
red4=$red5
red5=$tmp
fi
if [ $red4 -gt $red6 ];then
tmp=$red4
red4=$red6
red6=$tmp
fi
if [ $red5 -gt $red6 ];then
tmp=$red5
red5=$red6
red6=$tmp
fi
echo " $red1"" $red2"" $red3"" $red4"" $red5"" $red6"
break
fi
done
echo -n " $blue"
echo
done

