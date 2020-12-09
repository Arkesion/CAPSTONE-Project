#!/bin/bash

# Author: Kevin Quirici
# Date: 12-06-2020
# Script for CPSC 498 CAPSTONE Project
# Create Random Seeded Simulated IPs that appear on a network scan
# That simulate a local machine
#
# StudentIDScript.sh: Asks for Student ID, saves it and sums the digits up.
#
# Returns 2 variables: Student_ID, Sum_Of_ID

#########################################################################

# Grabs Student ID
read -p "Enter Student ID: " Student_ID
while  ! [[ "$Student_ID" =~ ^[0-9]+$ ]] || [[ "$Student_ID" -le 0 ]] ; do
	echo "Please input a Positive Whole Number"
	read -p "Minimum Number of Hosts: " Student_ID
done

# Removes any leading zeros
Student_ID=$(echo $Student_ID | sed 's/^0*//')

echo
echo Student ID: $Student_ID
echo

# Sums up number of digits in Student ID
Sum_Of_ID=0
while [ $Student_ID -gt 0 ]
do
	remainder=$(( $Student_ID % 10 ))
	Student_ID=$(( $Student_ID / 10 ))
	Sum_Of_ID=$(( $Sum_Of_ID + $remainder ))
done

echo Sum of Student ID: $Sum_Of_ID
