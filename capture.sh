#!/bin/bash

if [ ! -d "data/" ]; 
then
  mkdir data
fi

wget $(cat url) -O data/$(date +%s).jpg 2> /dev/null
