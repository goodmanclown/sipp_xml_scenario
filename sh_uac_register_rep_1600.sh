#!/bin/bash

#define loop
loop=1

while [ $loop -le 2 ]
do

#../sipp -sn uac -i 10.100.120.54 -p $1 10.100.125.71:5060 -r 1600 -rp 1s -m 1600 -inf $2 -sf uac_register.xml 
../sipp -sn uac -i $1 -p $2 $3:5060 -r $4 -rp 1s -m $4 -inf $5 -sf uac_register.xml 

# check the time the iteration is completed
date

# loop=`expr $loop + 1`

echo $loop

sleep 15

../sipp -sn uac -i $1 -p $2 $3:5060 -r $4 -rp 1s -m $4 -inf $5 -sf uac_deregister.xml 

sleep 15

done

