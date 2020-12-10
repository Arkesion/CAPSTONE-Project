#!/bin/bash

# Author: Kevin Quirici
# Date: 12-06-2020
# Script for CPSC 498 CAPSTONE Project
# Create Random Seeded Simulated IPs that appear on a network scan
# That simulate a local machine
#
# MasterScript.sh > Master Script that calls the other required scripts in
# Order to run the full program.

#######################################################################

# HostAndSubnetScript.sh
# Grabs the Host IP and Netmask, converting both into binary
# Returns 4 variables: hostIP, netmask, HostBinary, NetmaskBinary

export hostIP
export netmask
export HostBinary
export NetmaskBinary

source HostAndSubnetScript.sh

echo Host IP: $hostIP
echo Netmask IP: $netmask
echo Host Binary: $HostBinary
echo Netmask Binary: $NetmaskBinary
echo

#######################################################################
# HostRangeScript.sh
# Asks user for Minimum and Maximum Number of Hosts to open
# Returns 2 variables: Min_Hosts, Max_Host

export Min_Hosts
export Max_Hosts

source HostRangeScript.sh

echo Min Hosts: $Min_Hosts
echo Max Hosts: $Max_Hosts
echo

#######################################################################
# StudentIDScript.sh
# Asks for Student ID, and Sums the Digits
# Returns 2 variables: Student_ID, Sum_Of_ID

export Student_ID
export Sum_Of_ID

source StudentIDScript.sh

# Commented out because it creates some confusion if reading.
echo Student ID: $Student_ID
echo Sum of Student ID: $Sum_Of_ID
echo

########################################################################
# HostNumberScript.sh
# Using the seeded value of the Sum of a Students ID, chooses a random number
# Within the range of Minimum and Maximum Hosts, to determine how many to open
# Returns 2 variables: Random_Student_Sum, Num_Hosts

export Random_Student_Sum
export Num_Hosts

source HostNumberScript.sh

echo Host Number: $Min_Hosts "<=" $Num_Hosts "<=" $Max_Hosts
echo

########################################################################
# NetmaskMappingScript.sh
# Finds the Ones and Zeros of the Netmask and the maximum range of ip addresses availalbe
# Returns 3 variables: NumZerosInNetmask, NumOnesInNetmask, Max_Range

export NumZerosInNetmask
export NumOnesInNetmask
export Max_Range

source NetmaskMappingScript.sh

echo Number of Zeroes in Netmask/Number of Bits Available: $NumZerosInNetmask
echo Number of Ones in Netmask: $NumOnesInNetmask
echo Max Range: $Max_Range
echo

########################################################################
# CreateIPScript.sh
# Using all information and variables given, Creates Num_Hosts amount of IP Addresses,
# and makes random IP Addresses given the seed.
# Then, calls iptables command to open simulated machines for each address, opening them to
# Create Simulated Machines
# Returns 0 variables

# For professor/grading machine-
# Inputing a "--grade" flag into will create a list of outputs of the random IPs, for testing.

# Check for --grade flag
if [ "$1" == "--grade" ]; then
	echo "Grade Flag Accepted"
	source CreateIPScript.sh --grade
else
	source CreateIPScript.sh
fi

