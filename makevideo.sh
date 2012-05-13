#!/bin/bash

 mencoder "mf://data/*.jpg" -mf fps=1 -o output.avi -ovc lavc -lavcopts vcodec=mpeg4
