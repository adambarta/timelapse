#!/bin/bash

mencoder "mf://data/*.jpg" -mf fps=15 -o output.avi -ovc lavc -lavcopts vcodec=mjpeg:mbd=1:vbitrate=5000 -vf crop=1280:720
