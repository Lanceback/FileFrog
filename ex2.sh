#!/bin/bash

deploy=0
bored=0

current=$(pwd)"/ex2.sh"
# echo $current

while [ $deploy -eq 0 ]
do
folder=$(ls . | sort --random-sort | head -1)
echo $folder
if   [ -d "${folder}" ]
	then 
	bored=0
	deploy=1
	cd "${folder}"
elif [ -f "${folder}" ]
	then 
	((bored=bored+1))
	if [ $bored -eq 10 ]
		then 
			deploy=1
			cd ../
	fi
fi
done
# Increase this sleep amount to slow FileFrog down
sleep 10
cp $current .
# uncomment line 33 to allow FileFrog to keep jumping
# uncomment line 34 and enter the address of a log file to keep track off where it went
# bash ./ex2.sh
# echo "${current}" >> /
rm "${current}"
