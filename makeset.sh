#!/usr/local/bin/bash

EXT=mp4

TODAY=$1
ID=$2

if [[ $# -lt 2 ]];
then 
  TODAY=$(date +%F)
  ID=
fi

PREFIX=/home/adam/asc-webcam-site
DATAPATH=$PREFIX/data$ID
TEMPPATH=/dev/shm
OUTPUTPATH=$PREFIX/sets

if [[ ! -d $DATAPATH ]];
then
  echo "error data not avail. try again after some captures!"
  exit 1
fi

if [[ ! -d $OUTPUTPATH ]];
then
  mkdir -p $OUTPUTPATH
fi

for i in {6..0}
do
  DAY=$(date -d @$[ $(date -d $TODAY +%s) - 60*60*24*$i ] +%F)

  if [[ -d $DATAPATH/$DAY ]];
  then  
    
    if [[ ! -e $TEMPPATH/day-out-$ID-$DAY.$EXT ]];
    then
      $PREFIX/makevideo.sh day $DAY $ID
      if [ $? -ne 0 ]
      then
	echo "Error with makevideo for " $DAY " " $ID
        exit 1
      fi
    fi
	
    SET=$SET" "$TEMPPATH/day-out-$ID-$DAY.$EXT
    FN=$FN..$DAY
  fi

done

SET=${SET:1}

mencoder -ovc copy -idx -o $OUTPUTPATH/set-$ID-$FN.$EXT $SET

rm -v $SET

$PREFIX/youtube/drive_up.py $OUTPUTPATH/set-$ID-$FN.$EXT
#$PREFIX/mail.sh set$FN.$EXT

exit 0
