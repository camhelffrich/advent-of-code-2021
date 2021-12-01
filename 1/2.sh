#!/bin/bash

input="./input.txt"
lines=$(cat $input | wc -l)
increases=0
previous=0

for line in $(seq $lines);
do
  window=$(tail -n +$line $input | head -n 3)
  windowArr=($window)
  if [ ${#windowArr[@]} -eq 3 ]; then
    windowVal1=${windowArr[0]}
    windowVal2=${windowArr[1]}
    windowVal3=${windowArr[2]}
    windowValue=$(( $windowVal1 + $windowVal2 + $windowVal3 ))
    
    if [ $windowValue -gt $previous ]; then
      (( increases=$increases+1 ))
    fi
    previous=$windowValue
  fi
done

echo $(( $increases-1 ))

