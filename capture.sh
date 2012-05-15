#!/bin/bash

#PREFIX=$(pwd)
PREFIX=/home/adam/asc-webcam-site
TODAY=$(date +%F)

if [ -v $1 ];
then
  echo $TODAY $1
fi

exit


if [ ! -d "data/" ]; 
then
  mkdir $PREFIX/data
fi

wget $(cat $PREFIX/url) -O $PREFIX/data/$(date +%s).jpg 2> /dev/null
