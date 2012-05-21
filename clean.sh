#!/usr/local/bin/bash

PREFIX=/home/adam/asc-webcam-site
DATAPATH=$PREFIX/data

for dir in $(ls $DATAPATH)
do
  FILE=$DATAPATH/$dir/day-out*.avi
  echo "Removing: "$FILE
  rm -v $FILE
done

