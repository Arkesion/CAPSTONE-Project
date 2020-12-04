#!/bin/bash

# Making Random IPs!

NewIP_LeftMost=${HostBinary:0:$NumOnesInNetmask}
echo Left Side of IP: $NewIP_LeftMost


function toBinary() {
	local n bit
	for (( n=$1 ; n>0 ; n >>= 1 )); do bit="$(( n&1 ))$bit"; done
	printf "%s\n" "$bit"
}

echo Host IP: $hostIP

for ((i=1; i<=$Num_Hosts; i++))
do
	Seed=$(( $Random_Student_Sum + $i ))
	RANDOM=$Seed

	Rand1=$RANDOM
	RANDOM=$Rand1
	Rand2=$RANDOM

	Rand1Bin=`toBinary "${Rand1}"`
	Rand2Bin=`toBinary "${Rand2}"`
	RandBinCat="$Rand1Bin$Rand2Bin"

	NewIP_RightMost=${RandBinCat: -$NumZerosInNetmask}
	NewIPBin="$NewIP_LeftMost$NewIP_RightMost"

	NewIP="$((2#${NewIPBin:0:8})).$((2#${NewIPBin:8:8})).$((2#${NewIPBin:16:8})).$((2#${NewIPBin:24:8}))"

	echo New IP: $NewIP >> GeneratedAddresses.txt


	# Ladies and Gentlemen, The IPTables Code!!!!!
	sudo iptables -t nat -A OUTPUT -d $NewIP -j DNAT --to-destination $hostIP
done
