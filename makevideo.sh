#!/bin/bash

mencoder "mf://data/*.jpg" -mf fps=24 -o output.avi -ovc lavc -lavcopts vcodec=mjpeg:mbd=1:vbitrate=5000 -vf crop=1280:720:0:0,pp=hb/vb/dr/al
