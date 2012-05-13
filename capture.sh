#!/bin/bash

PREFIX=$(pwd)

if [ ! -d "data/" ]; 
then
  mkdir $PREFIX/data
fi

wget $(cat $PREFIX/url) -O $PREFIX/data/$(date +%s).jpg 2> /dev/null
