#!/bin/bash


# Author: Kevin Quirici
# Date: 12-06-2020
# Script for CPSC 498 CAPSTONE Project
# Create Random Seeded Simulated IPs that appear on a network scan
# That simulate a local machine
#
# HostNumberScript.sh: Creates a Seeded Random Number with the sum of digits in Student ID, and chooses the number of hosts to open within the range.
#
# Returns 2 variables: Random_Student_Sum, Num_Hosts

#######################################################################

RANDOM=$Sum_Of_ID
Random_Student_Sum=$RANDOM
echo Random: $Random_Student_Sum

# Get Number of Hosts
Num_Hosts=$Random_Student_Sum
while [ "$Num_Hosts" -gt "$Max_Hosts" -o "$Num_Hosts" -lt "$Min_Hosts" ]
do
	if [ $Num_Hosts -gt $Max_Hosts ]
	then
		Num_Hosts=$(( $Num_Hosts / 10 ))
	elif [ $Num_Hosts -lt $Min_Hosts ]
	then
		Num_Hosts=$(( $Num_Hosts * 5 ))
	fi
	# echo Random Hosts Current: $Num_Hosts
done

# echo Host Number: $Num_Hosts
# echo $Min_Hosts "<" $Num_Hosts "<" $Max_Hosts
