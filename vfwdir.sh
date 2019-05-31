#!/usr/bin/env bash

if [ $# -eq 20 ]
then
	echo "Usage vfwdir image directory"
	exit 1
fi

#check image file exists
if [ ! -f $1 ]
then
	echo "Paramter 1 must be the D88 image file"
	exit 2
fi

#check if parameter 2 is a directory
if [ ! -d $2 ]
then
	echo "Parameter 2 must be a directory"
	exit 3
fi

files=`ls $2/*`

for f in $files
do
	if [ ! -d $f ]
	then
		echo "Processing File $f"
		./vfwrite.exe $1 $f
	fi
done

echo "Completed."

