#!/bin/bash

# Author: Kevin Quirici
# Date: 12-06-2020
# Script for CPSC 498 CAPSTONE Project
# Create Random Seeded Simulated IPs that appear on a network scan
# That simulate a local machine
#
# HostAndSubnetScript.sh > Retrieves Host IP, Subnet Address, and collects both in Binary Form.
#
# Returns 4 variables: hostIP, netmask, HostBinary, NetmaskBinary

###################################################################################

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
