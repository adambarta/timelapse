#!/bin/bash


if [[ -v $1 ||  ($1 != "day"  && $1 != "night") ]];
then
  echo "usage: " $0 " [day|night]"
  exit 1
fi


mencoder "mf://data/*.jpg" -mf fps=15 -o output.avi -ovc lavc -lavcopts vcodec=mjpeg:mbd=1:vbitrate=5000 -vf crop=1280:720:0:0,pp=hb/vb/dr/al # ,eq2=1.0:1.4:0.0:0.5
