#!/bin/bash

clear
echo "Welcome, $USER"
echo
echo "Connected users"
users | tr ' ' '\n' | sort -u 
echo
echo "There are $(echo `users | tr ' ' '\n' | sort -u | wc -l`) users online."
read -p "Do you want to know what they're doing?" yn
case $yn in
      [Yy]* ) w; echo "That is every one on the server and what there doing.";
echo
echo "The user who is using high %cpu"
w | sed '1,2d' | awk   '$7 > maxuid { maxuid=$7; maxline=$0 }; END { print maxuid, maxline }' 
;;

      [Nn}* ) echo;;
esac