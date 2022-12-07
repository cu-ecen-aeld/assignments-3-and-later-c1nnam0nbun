#!/bin/bash

writefile=$1
writestr=$2

if [ -z $writefile ]
then
        echo "File name must be specified"
        exit 1
elif [ -z $writestr ]
then
        echo "String must be specified"
        exit 1
fi

dir=$(dirname $writefile)

mkdir -p $dir
echo $writestr > $writefile

if [ $? -ne 0 ]
then
	echo "Failed to create file"
	exit 1
fi
