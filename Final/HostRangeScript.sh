#!/bin/bash

# Author: Kevin Quirici
# Date: 12-06-2020
# Script for CPSC 498 CAPSTONE Project
# Create Random Seeded Simulated IPs that appear on a network scan
# That simulate a local machine
#
# HostRangeScript.sh: Asks user for input on the minimum and maximum
# hosts allowed for current assignment
#
# Returns 2 variables: Min_Hosts, Max_Host

#########################################################################

# Get Host Min and Max Number
read -p "Minimum Number of Hosts: " Min_Hosts
while  ! [[ "$Min_Hosts" =~ ^[0-9]+$ ]] ; do
	echo "Please input a number"
	read -p "Minimum Number of Hosts: " Min_Hosts
done

read -p "Maximum Number of Hosts: " Max_Hosts
while  ! [[ "$Max_Hosts" =~ ^[0-9]+$ ]] ; do
	echo "Please input a number"
	read -p "Maximum Number of Hosts: " Max_Hosts
done

while [ "$Max_Hosts" -lt "$Min_Hosts" ] ; do
	echo "Max Hosts must be larger than Min Hosts"
	read -p "Maximum Number of Hosts: " Max_Hosts
done


# echo Min Hosts: $Min_Hosts
# echo Max Hosts: $Max_Hosts
