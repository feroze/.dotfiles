#!/bin/bash

cd ~/$1/

TODAY="$(date +%w)"
WEEKNUM="$(date +%V)"
FILENAME="week-$WEEKNUM.txt" # for dropbox edit
YEAR="$(date +%Y)"

# Year directory doesn't exist
if [ ! -d "$YEAR" ]; then
  mkdir $YEAR
fi

cd $YEAR/

HEADER="$(date +%d-%b-%y)"

if [ ! -f $FILENAME ]; then
  echo "File not found!"
  echo "# Week $WEEKNUM #" >> $FILENAME
  echo "" >> $FILENAME
  echo "## $HEADER ##" >> $FILENAME
  echo "" >> $FILENAME
  echo "" >> $FILENAME

  vim + -c 'startinsert' $FILENAME

else
  FILELASTMODIFIED="$(date -r $FILENAME +%w)"
    #echo "TODAY=$TODAY FILELASTMODIFIED=$FILELASTMODIFIED"

  if [ $TODAY -ne $FILELASTMODIFIED ]; then

    #echo "File was NOT modified today. So append stuff to it."
    echo "" >> $FILENAME
    echo "" >> $FILENAME
    echo "## $HEADER ##" >> $FILENAME
    echo "" >> $FILENAME
    echo "" >> $FILENAME

    vim + -c 'startinsert' $FILENAME
  else
    #echo "File was modified today!"
    echo "" >> $FILENAME
    vim + -c 'startinsert' $FILENAME
  fi
fi


cd - > /dev/null
