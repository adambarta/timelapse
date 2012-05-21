#!/usr/local/bin/bash

if [[ $# -lt 1 ]];
then
  echo "usage : " $0 " setname"
  exit 1
fi

URL="http://kat-dbes.karoo.kat.ac.za/sets/"$1

SUBJECT='WEEKLY Site Time Lapse'
EMAIL='adam@ska.ac.za rupert@ska.ac.za sharmila@ska.ac.za peter@ska.ac.za marc@ska.ac.za francois@ska.ac.za'
#EMAIL='adam@ska.ac.za sharmila@ska.ac.za'
#EMAIL='adam@ska.ac.za'


#mail -s "$SUBJECT" -t $EMAIL <<EOM
sendmail -t <<EOM
To: $EMAIL
From: noreply@ska.ac.za
Subject: $SUBJECT

Hi,

Please follow this link for the weekly site time laps:

$URL

l8 server!

░█░█░█▀▀░█▀▀░█░█░█░░░█░█░░░█▀▀░▀█▀░▀█▀░█▀▀░░░▀█▀░▀█▀░█▄█░█▀▀░░░█░░░█▀█░█▀█░█▀▀░█▀▀
░█▄█░█▀▀░█▀▀░█▀▄░█░░░░█░░░░▀▀█░░█░░░█░░█▀▀░░░░█░░░█░░█░█░█▀▀░░░█░░░█▀█░█▀▀░▀▀█░█▀▀
░▀░▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░░▀░░░░▀▀▀░▀▀▀░░▀░░▀▀▀░░░░▀░░▀▀▀░▀░▀░▀▀▀░░░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀

EOM
