#!/bin/bash

#Using Seeded Randomization, Choose the Number of Hosts (Within given range) To open.

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
