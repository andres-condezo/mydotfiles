#!/bin/bash

folder="./compilers/"
if [[ ! -d $folder   ]]; then
	mkdir $folder
fi
entry=$(echo "$1" | sed 's/\(\w\)\(\.c\)/\1/g')
	cc -o $entry $1
mv $entry $folder
./$folder/$entry
