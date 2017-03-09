#!/bin/bash

cd ~/devlog/

TODAY="$(date +%w)"
WEEKNUM="$(date +%W)"
FILENAME="week-$WEEKNUM.txt"
#echo "${FILENAME}"

HEADER="$(date +%d-%b)"

if [ ! -f $FILENAME ]; then
  echo "File not found!"
  echo "###$HEADER###" >> $FILENAME
  echo "" >> $FILENAME
  echo "" >> $FILENAME

else
  FILELASTMODIFIED="$(date -r $FILENAME +%w)"
    #echo "TODAY=$TODAY FILELASTMODIFIED=$FILELASTMODIFIED"
  
  if [ $TODAY -ne $FILELASTMODIFIED ]; then

    echo "File was NOT modified today. So append stuff to it."
    echo "" >> $FILENAME
    echo "" >> $FILENAME
    echo "###$HEADER###" >> $FILENAME
    echo "" >> $FILENAME
    echo "" >> $FILENAME
  #else
    #echo "File was modified today!"
  fi
fi

vim + -c 'startinsert' $FILENAME

cd -
