#!/bin/bash
i=1
while [ $i -le 100 ]
do
if [ ! -d $PWD/A ];then
	mkdir A && cd A
fi
let i++
done
