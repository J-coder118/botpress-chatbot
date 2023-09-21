#!/bin/sh
DIR="$( cd "$( dirname "$0" )" && pwd )"
if [ $# = 0 ]
then
    echo "Usage : "$0" CONTRY_CODE VECTORS_LINK [ARG...]"
    exit
else
    echo "Downloading "$1" vectors from FastText ... Please wait !"
    mkdir -p $DIR/vectors/$1
    wget -O $DIR/vectors/$1/$1.vec.gz $2
    echo "Extracting downloaded vectors ... Please wait !"
    gzip -d $DIR/vectors/$1/$1.vec.gz
fi
