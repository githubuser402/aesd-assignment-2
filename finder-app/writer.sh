#!/bin/bash

if [ $# -ne 2 ]; then
  exit 1;
fi;

writefile=$1;
writestr=$2;

if [ -d $writefile ]; then
  exit 1;
fi;


mkdir -p $(dirname $writefile); # creating directories to avoid error response from touch 
touch "$writefile";

if [ $? -ne 0 ]; then
  exit 1;
fi;

echo $writestr > $writefile;

