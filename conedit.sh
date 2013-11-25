#!/bin/bash
#yolo

i=0
echo "Configuration Editor"
while [ $i -lt 21 ];
do
    echo -n "="
    let i=i+1
done
# I found this to be the easiest way to take out the lines with # and also the blank lines. 
# However this saves all files temp, temp1 and temp2
# My program on exit will delete all the files it creates
cat $1 > temp
sed /#/d temp > temp1
cat temp1 > temp
sed /^$/d temp > temp2
cat temp2 > temp

echo
echo    "Select a choice: "
echo    "v - View parameteres and settings"
echo    "e - Edit a parameter"
echo    "d - Delete a parameter"
echo    "q - Quit "
echo    "m - Menu"
echo

while [ "$vedqm" != "q" ];
  do
    echo
    echo -n "Choice: " 
    read vedqm 
    echo 

  	case $vedqm in

   		[vV]* ) cat temp 2>/dev/null;;

   		[eE]* ) echo -n "What parameter would you like to edit? "; read edit; grep $edit temp;
      if [ $? -ne 0 ]
      then
        echo "Error: No such parameter"
      else
        grep $edit temp | cut -d '=' -f2 > value; 
        echo -n "Change current value of $edit (`cat value`) to : "; read valuen; sed s/`cat value`/$valuen/ temp > temp1; 
        cat temp1 > temp;
        fi;;
    	[dD]* ) echo -n "Name of parameter to delete: " ;  read rm;  grep $rm temp;
      if [ $? -ne 0 ]
      then
        echo "Error: No such parameter"
      else
             sed /$rm/d temp > temp1; cat temp1 > temp;
           fi;;

    	[qQ]* ) echo -n "Would you like to save settings?"; read yn;
               #this isn't necessary but it allows the user to save there work in the editor if they want to 
              case $yn in 

                [yY]* ) cat temp > $1; rm temp temp1 temp2; break;; 

                [nN]* ) rm temp temp1 temp2; break;;

                * ) echo "- Invaild Choice";;

              esac;;
              #This also inst necessary but it allows the user to see the main menu again if they need it
    	[mM]* ) echo "Select a choice: "; 
              echo "v - View parameteres and settings"; 
              echo "e - Edit a parameter"; 
              echo "d - Delete a parameter"; 
              echo "q - Quit "; 
              echo "m - Menu"; 
              echo;;
      
      * ) echo "- Invaild Choice";;
	   esac
  done