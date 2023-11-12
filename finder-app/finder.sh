#!/usr/bin/bash

if [ $# -ne 2 ]; then
  echo "Number of arguments not equal 2";
  exit 1;
fi;

filesdir=$1;
searchstr=$2;

if [ ! -d "$filesdir"  ]; then
  echo "There is no directory with name\n: $filesdir"
fi;


filescount=0;
wordscount=0;


for file in $(find $filesdir -type f); 
do
  count=$(grep -c "$searchstr" $file);
  
  if [ $count -ne 0 ]; then
    filescount=$(($filescount+1));
    wordscount=$(($wordscount+$count));
  fi; 
done;

echo "The number of files are ${filescount} and the number of matching lines are ${wordscount}";
