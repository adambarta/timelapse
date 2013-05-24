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
#OUTPUTPATH=$PREFIX/data/$2
OUTPUTPATH=/dev/shm

if [[ ! -d $DATAPATH ]];
then
  echo "error data not avail. try again!"
  exit 1
fi

#mencoder "mf://$DATAPATH/*.jpg" -mf fps=30 -o $OUTPUTPATH/$1-out-$2.avi -ovc lavc -lavcopts vcodec=mjpeg:mbd=1:vbitrate=5000 -vf crop=1280:720:0:0 #,pp=hb/vb/dr/al # ,eq2=1.0:1.4:0.0:0.5
mencoder "mf://$DATAPATH/*.jpg" -mf fps=30 -o $OUTPUTPATH/$1-out-$2.mp4 -ovc lavc -lavcopts vcodec=mpeg4:mbd=2:trell=yes:v4mv=yes:vbitrate=10000 -vf crop=1280:720:0:0
#mencoder "mf://$DATAPATH/*.jpg" -mf fps=30 -o $OUTPUTPATH/$1-out-$2.mp4 -ovc x264 -x264encopts bitrate=1000:me=umh:partitions=all:subq=6:frameref=5:8x8dct:bframes=3:b_pyramid:weight_b -vf crop=1280:720:0:0
#mencoder "mf://$DATAPATH/*.jpg" -mf fps=30 -o $OUTPUTPATH/$1-out-$2.mp4 -ovc copy -vf crop=1280:720:0:0E


#avconv -i set..2012-08-06..2012-08-07..2012-08-08..2012-08-09..2012-08-10..2012-08-11..2012-08-12.mp4 -codec:v libtheora -b:v 5000k -qmin 10 -qmax 42 -maxrate 5000k -bufsize 1000k -threads 4 output.ogv
#avconv -i set..2012-08-06..2012-08-07..2012-08-08..2012-08-09..2012-08-10..2012-08-11..2012-08-12.mp4 -codec:v libtheora -b:v 5000k -qmin 10 -qmax 42 -maxrate 5000k -bufsize 1000k -threads 4 output.ogv

exit 0
