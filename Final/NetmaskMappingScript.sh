#!/bin/bash

# Find ones and Zeroes of The Netmask
# echo Netmask Binary: $NetmaskBinary

NumZerosInNetmask="$(awk -F"0" '{print NF-1}' <<< "${NetmaskBinary}")"
# echo Number of Zeroes in Netmask/Number of Bits Available: $NumZerosInNetmask
NumOnesInNetmask=$(( 32-$NumZerosInNetmask ))
# echo Number of Ones in Netmask: $NumOnesInNetmask

Max_Range=$(( 2**$NumZerosInNetmask ))

# echo Max Range: $Max_Range
