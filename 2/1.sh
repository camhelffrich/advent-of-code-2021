#!/bin/bash

input="./input.txt"

hpos=0
depth=0

while read line
do
	direction=$(echo $line | awk '{ print $1 }')
	distance=$(echo $line | awk '{ print $2 }')

	case $direction in

	  forward)
	    (( hpos=$hpos+$distance ))
	    ;;

	  up)
	    (( depth=$depth-$distance ))
	    ;;

	  down)
	    (( depth=$depth+$distance ))
	    ;;

	  *)
	    echo -n "unknown"
	    ;;
	esac
done < "$input"

echo $(( $hpos*$depth ))