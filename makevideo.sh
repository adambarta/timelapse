#!/usr/local/bin/bash
#/bin/bash

if [[ $# -lt 2 ]];
then
  echo "usage: " $0 " [day|night] [yyyy-mm-dd]"
  exit 1
fi

#PREFIX=$(pwd)
PREFIX=/home/adam/asc-webcam-site
DATAPATH=$PREFIX/data/$2/$1
OUTPUTPATH=$PREFIX/data/$2

if [[ ! -d $DATAPATH ]];
then
  echo "error data not avail. try again!"
  exit 1
fi


mencoder "mf://$DATAPATH/*.jpg" -mf fps=15 -o $OUTPUTPATH/$1-out-$2.avi -ovc lavc -lavcopts vcodec=mjpeg:mbd=1:vbitrate=5000 -vf crop=1280:720:0:0 #,pp=hb/vb/dr/al # ,eq2=1.0:1.4:0.0:0.5
