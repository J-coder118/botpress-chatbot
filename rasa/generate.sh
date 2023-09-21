#!/bin/sh
DIR="$( cd "$( dirname "$0" )" && pwd )"
if [ $# = 0 ]
then
    echo "Usage : "$0" CONTRY_CODE [ARG...]"
    exit
else
    echo "Generating "$1" model ... Please wait !"
    python3 $DIR/load_fastText.py $DIR/vectors/$1/$1.vec $1
    mkdir -p $DIR/models/
    python3 -m spacy package $DIR/vectors/$1/ $DIR/models/
    cd $DIR/models/$1_model-0.0.0
    python3 setup.py sdist
    mv $DIR/models/$1_model-0.0.0/dist/$1_model-0.0.0.tar.gz $DIR/models/$1.tar.gz
    rm -Rf $DIR/models/$1_model-0.0.0/
    # rm -Rf $DIR/vectors/$1/
fi
