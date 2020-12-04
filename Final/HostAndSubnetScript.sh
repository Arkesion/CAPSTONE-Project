#!/bin/bash

# get host IP
hostIP=$(hostname -I)

#get subnet
netmask=$(ifconfig "eth0" | awk '/netmask/{ print $4;}')

#converts ip from decimal to binary format.
function convip()
{
    CONV=({0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1})


    ip=""
    for byte in `echo ${1} | tr "." " "`; do
        ip="${ip}${CONV[${byte}]}"
    done
    echo ${ip}
}

HostBinary=`convip "${hostIP}"`

NetmaskBinary=`convip "${netmask}"`
