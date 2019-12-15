#!/bin/bash

ARGUMENT_COUNT=$#

if [ ARGUMENT_COUNT -ne 2 ]; then
	echo "Invalid Number of Arguments"
	exit 1
	fi

LINK=$1
FOLDER=$2

REPO=$1$2
git clone $REPO
SUCCESS=$?

if [ $SUCCESS -ne 0 ]; then
	echo "Something went wrong"
	exit 1
	fi


cd $FOLDER

for ((i=0;i<=5;i++))
do
	#echo "String $i"
	DIRECTORY="Lab$i"
	mkdir -p $DIRECTORY
	cd $DIRECTORY
	touch README
	if [ $i -eq 0 ]; then
		echo "This is Writing into Lab0 README Only" >> README
		fi
	cd ..
done


git add *
git commit -m "Setup through Bash Script"
git push -u origin master

exit 1
fi 