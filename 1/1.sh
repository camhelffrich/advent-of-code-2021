#!/bin/bash

input="./input.txt"
previous=0
increases=0

while read line
do
  if [ $line -gt $previous ]; then
  	(( increases=$increases+1 ))
  fi
  previous=$line
done < "$input"

# minus 1 to account for first line
echo  $(( $increases-1 ))