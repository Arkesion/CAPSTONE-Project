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
while  ! [[ "$Min_Hosts" =~ ^[0-9]+$ ]] || [[ "$Min_Hosts" -le 0 ]] ; do
	echo "Please input a Positive Whole Number"
	read -p "Minimum Number of Hosts: " Min_Hosts
done
Min_Hosts=$(echo $Min_Hosts | sed 's/^0*//')

read -p "Maximum Number of Hosts: " Max_Hosts
while  ! [[ "$Max_Hosts" =~ ^[0-9]+$ ]] || [[ "$Max_Hosts" -lt "$Min_Hosts" ]] ; do
	if ! [[ "$Max_Hosts" =~ ^[0-9]+$ ]]
	then
		echo "Please input a Positive Whole Number"
	else
		echo "Max Hosts must be larger than Min Hosts"
	fi
	read -p "Maximum Number of Hosts: " Max_Hosts
done
Max_Hosts=$(echo $Max_Hosts | sed 's/^0*//')

# echo Min Hosts: $Min_Hosts
# echo Max Hosts: $Max_Hosts
