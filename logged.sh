#!/bin/bash
if [ $# -eq 1 ]; then
   sleept=$1
   i=0
   while [ $i -le 0 ]
   do
	clear
	echo "Welcome, $USER"
	echo
	echo "Connected users"
	users | tr ' ' '\n' | sort -u
	echo
	echo "There are $(echo `users | tr ' ' '\n' | sort -u | wc -l`) users online."
	sleep $sleept
   done
else

       clear
       echo "Welcome, $USER"
       echo
       echo "Connected users"
       users | tr ' ' '\n' | sort -u
       echo
       echo "There are $(echo `users | tr ' ' '\n' | sort -u | wc -l`) users o\
nline."
	sleep 5	

fi