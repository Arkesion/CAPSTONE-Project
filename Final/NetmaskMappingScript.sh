#!/bin/bash

# Author: Kevin Quirici
# Date: 12-06-2020
# Script for CPSC 498 CAPSTONE Project
# Create Random Seeded Simulated IPs that appear on a network scan
# That simulate a local machine
#
# NetmaskMappingScript.sh: Selects and Isolates the Range of the Netmask (How many ones and zeros) for use in creating Simulated IP Addresses
#
# Returns 3 variables: NumZerosInNetmask, NumOnesInNetmask, Max_Range

#######################################################################

NumZerosInNetmask="$(awk -F"0" '{print NF-1}' <<< "${NetmaskBinary}")"
# echo Number of Zeroes in Netmask/Number of Bits Available: $NumZerosInNetmask
NumOnesInNetmask=$(( 32-$NumZerosInNetmask ))
# echo Number of Ones in Netmask: $NumOnesInNetmask

Max_Range=$(( 2**$NumZerosInNetmask ))

# echo Max Range: $Max_Range
