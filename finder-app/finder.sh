#!/bin/sh

filesdir=$1
searchstr=$2

if [ -z $filesdir ]
then
	echo "Directory must be specified"
	exit 1
elif [ -z $searchstr ]
then
        echo "String must be specified"
        exit 1
fi

if [ ! -d $filesdir ]
then
	echo "\"$filesdir\" is not a directory"
	exit 1
fi

filecount=$(find $filesdir -type f  2> /dev/null | wc -l)
linecount=$(grep -r $searchstr $filesdir/* 2> /dev/null | wc -l)

echo "The number of files are $filecount and the number of matching lines are $linecount"
