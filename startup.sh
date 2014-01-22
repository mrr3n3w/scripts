#!/bin/bash
USERS=$(echo `users | tr ' ' '\n' | sort -u | wc -l`)
LOCATION=$(echo `last $USER | head -1 | cut -d ' ' -f14`)
if [ $LOCATION -eq 10.*.*.* ]; then
    LOCATION="Inside Desktop"
elif [ $LOCATION -eq 142.*.*.* ]; then
    LOCATION="Inside WIFI"
else
    LOCATION="Outside"
fi

clear
if [ `date | cut -d ' ' -f4 | cut -d ':' -f1` -lt 12 ]; then
   echo "Good Morning, $USER"
   echo "===================="
   echo
   echo "Current Users online:"
   users | tr -s ' ' '\n | sort -u'
   echo
   echo "There are $USERS users online"
   echo "Current date & time: $(echo `date`)"
   echo "Last login for $USER was: $(echo `last $USER | head -1 | cut -d ' ' -f15-20`) from $LOCATION"
   echo
elif [ `date |cut -d ' ' -f4 | cut -d ':' -f1` -lt 17 ]; then
    echo "Good Afternoon, $USER"
    echo "======================"
    echo
    echo "Current Users online:"
    users | tr -s ' ' '\n | sort -u'
    echo
    echo "There are $USERS users online"
    echo "Current date & time: $(echo `date`)"
    echo "Last login for $USER was: $(echo `last $USER | head -1 | cut -d ' ' -f15-20`) from $LOCATION"
    echo
elif [ `date | cut -d ' ' -f4 | cut -d ':' -f1` -gt 17 ]; then
    echo "Good Evening, $USER"
    echo "===================="
    echo
    echo "Current Users online:"
    users | tr -s ' ' '\n | sort -u'
    echo
    echo "There are $USERS users online"
    echo "Current date & time: $(echo `date`)"
    echo "Last login for $USER was: $(echo `last $USER | head -1 | cut -d ' ' -f15-20`) from $LOCATION"
    echo
fi
