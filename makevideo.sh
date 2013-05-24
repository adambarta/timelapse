#!/usr/local/bin/bash
#/bin/bash

ID=$3

if [[ $# -lt 2 ]];
then
  echo "usage: " $0 " [day|night] [yyyy-mm-dd] [set]"
  exit 1
fi

if [[ $# -lt 3 ]];
then
  ID=
fi

#PREFIX=$(pwd)
PREFIX=/home/adam/asc-webcam-site
DATAPATH=$PREFIX/data$ID/$2/$1
#OUTPUTPATH=$PREFIX/data/$2
OUTPUTPATH=/dev/shm

if [[ ! -d $DATAPATH ]];
then
  echo "error data not avail. try again!"
  exit 1
fi

#mencoder "mf://$DATAPATH/*.jpg" -mf fps=30 -o $OUTPUTPATH/$1-out-$2.avi -ovc lavc -lavcopts vcodec=mjpeg:mbd=1:vbitrate=5000 -vf crop=1280:720:0:0 #,pp=hb/vb/dr/al # ,eq2=1.0:1.4:0.0:0.5
#mencoder "mf://$DATAPATH/*.jpg" -mf fps=30 -o $OUTPUTPATH/$1-out-$2.mp4 -ovc lavc -lavcopts vcodec=mpeg4:mbd=2:trell=yes:v4mv=yes:vbitrate=10000 -vf crop=1280:720:0:0
mencoder "mf://$DATAPATH/*.jpg" -mf fps=30 -o $OUTPUTPATH/$1-out-$ID-$2.mp4 -ovc lavc -lavcopts vcodec=mpeg4:mbd=2:trell=yes:v4mv=yes:vbitrate=10000
#mencoder "mf://$DATAPATH/*.jpg" -mf fps=30 -o $OUTPUTPATH/$1-out-$2.mp4 -ovc x264 -x264encopts bitrate=1000:me=umh:partitions=all:subq=6:frameref=5:8x8dct:bframes=3:b_pyramid:weight_b -vf crop=1280:720:0:0
#mencoder "mf://$DATAPATH/*.jpg" -mf fps=30 -o $OUTPUTPATH/$1-out-$2.mp4 -ovc copy -vf crop=1280:720:0:0E

exit 0
