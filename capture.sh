#!/bin/bash

#some cool date arithmetic to get yesterday date -d @$[ $(date +%s) - 60*60*24] +%F 
#cool trick with find find . -name "*jpg" -mtime -1

PREFIX=$(pwd)
#PREFIX=/home/adam/asc-webcam-site
TODAY=$(date +%F)

if [[ -v $1 ||  ($1 != "day"  && $1 != "night") ]];
then
  echo "usage: " $0 " [day|night]"
  exit 1
fi

DATAPATH=$PREFIX/data/$TODAY/$1

if [ ! -d $DATAPATH ]; 
then
  mkdir -p $DATAPATH
fi

wget $(cat $PREFIX/url) -O $DATAPATH/$(date +%s).jpg 2> /dev/null
