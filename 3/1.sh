#!/bin/bash
# set -x

input="./input.txt"
gamma=0
epsilon=0

bitArr=(0 0 0 0 0 0 0 0 0 0 0 0)

while read line; do
	bitCount=0

	while read -n1 bit; do
		if [ $bit = 0 ]; then
			(( bitArr[$bitCount]-- ))
		else
			(( bitArr[$bitCount]++ ))
		fi

		(( bitCount=$bitCount+1 ))
	done < <(echo -n "$line")	
done < "$input"

gamma=""
epsilon=""
for i in ${!bitArr[@]}; do
	if [[ ${bitArr[$i]} < 0 ]]; then
		gamma+="0"
		epsilon+="1"
	else
		gamma+="1"
		epsilon+="0"
	fi
done


echo "gamma binary: $gamma"
echo "gamma decimal: $((2#$gamma ))"
echo "epsilon binary: $epsilon"
echo "epsilon decimal: $((2#$epsilon ))"
echo "answer: $(( $((2#$gamma ))*$((2#$epsilon )) ))"
