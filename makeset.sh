#!/usr/local/bin/bash

TODAY=$1

if [[ $# -lt 1 ]];
then 
  TODAY=$(date +%F)
fi

PREFIX=/home/adam/asc-webcam-site
DATAPATH=$PREFIX/data
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
    
    if [[ ! -e $DATAPATH/$DAY/day-out-$DAY.avi ]];
    then
      $PREFIX/makevideo.sh day $DAY
      if [ $? -ne 0 ]
      then
	echo "Error with makevideo for " $DAY
        exit 1
      fi
    fi
	
    SET=$SET" "$DATAPATH/$DAY/day-out*.avi
    FN=$FN..$DAY
  fi

done

SET=${SET:1}

mencoder -ovc copy -idx -o $OUTPUTPATH/set$FN.avi $SET

#rm -v $SET

$PREFIX/mail.sh $FN.avi

exit 0
