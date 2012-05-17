#!/usr/local/bin/bash

if [[ $# -lt 1 ]];
then 
  echo "useage: " $0 " [7 day week end date yyy-mm-dd]"
  exit 1
fi

PREFIX=/home/adam/asc-webcam-site
DATAPATH=$PREFIX/data
OUTPUTPATH=$PREFIX/sets

if [[ ! -d $DATAPATH ]];
then
  echo "error data not avail. try again!"
  exit 1
fi

if [[ ! -d $OUTPUTPATH ]];
then
  mkdir -p $OUTPUTPATH
fi

for i in {7..1}
do
  DAY=$(date -d @$[ $(date -d $1 +%s) - 60*60*24*$i ] +%F)

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

#echo $SET
#echo $FN

mencoder -ovc copy -idx -o $OUTPUTPATH/set$FN.avi $SET

exit 0
