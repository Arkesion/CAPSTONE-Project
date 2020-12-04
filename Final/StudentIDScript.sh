#!/bin/bash

# Grabs Student ID
read -p "Enter Student ID: " Student_ID

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
