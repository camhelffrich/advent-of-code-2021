#!/bin/bash

input="./input.txt"

hpos=0
depth=0
aim=0

while read line
do
	direction=$(echo $line | awk '{ print $1 }')
	distance=$(echo $line | awk '{ print $2 }')

	case $direction in

	  forward)
	    (( hpos=$hpos+$distance ))

	    aimX=$(( $aim*$distance ))
	    (( depth=$depth+$aimX ))
	    ;;

	  up)
	    (( aim=$aim-$distance ))
	    ;;

	  down)
	    (( aim=$aim+$distance ))
	    ;;

	  *)
	    echo -n "unknown"
	    ;;
	esac
done < "$input"

echo $(( $hpos*$depth ))