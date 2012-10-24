#!/usr/local/bin/bash

if [[ $# -lt 1 ]];
then
  echo "usage : " $0 " setname"
  exit 1
fi

URL="http://kat-dbes.karoo.kat.ac.za/sets/"$1

SUBJECT='WEEKLY Site Time Lapse'
#EMAIL='adam@ska.ac.za rupert@ska.ac.za sharmila@ska.ac.za peter@ska.ac.za marc@ska.ac.za francois@ska.ac.za audrey@ska.ac.za jasper@ska.ac.za'
EMAIL='adam@ska.ac.za rupert@ska.ac.za sharmila@ska.ac.za marc@ska.ac.za peter@ska.ac.za andrew@ska.ac.za francois@ska.ac.za jmanley@ska.ac.za shanly@ska.ac.za ruby@ska.ac.za phil@ska.ac.za henno@ska.ac.za richarms@ska.ac.za'
#EMAIL='adam@ska.ac.za sharmila@ska.ac.za'
#EMAIL='adam@ska.ac.za'
#EMAIL='adam@kat-dbes'


#mail -s "$SUBJECT" -t $EMAIL <<EOM
/usr/sbin/sendmail -t <<EOM
bcc: $EMAIL
From: time-lapse@ska.ac.za
Subject: $SUBJECT

Hi,

Please follow this link for the weekly site time lapse:

$URL

░█░█░█▀▀░█▀▀░█░█░█░░░█░█░░░█▀▀░▀█▀░▀█▀░█▀▀░░░▀█▀░▀█▀░█▄█░█▀▀░░░█░░░█▀█░█▀█░█▀▀░█▀▀
░█▄█░█▀▀░█▀▀░█▀▄░█░░░░█░░░░▀▀█░░█░░░█░░█▀▀░░░░█░░░█░░█░█░█▀▀░░░█░░░█▀█░█▀▀░▀▀█░█▀▀
░▀░▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░░▀░░░░▀▀▀░▀▀▀░░▀░░▀▀▀░░░░▀░░▀▀▀░▀░▀░▀▀▀░░░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀

EOM
