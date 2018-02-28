#!/bin/bash

# Rename files by replacing a string in the original file name with a new string.
# E.g.
# replace-string-in-file-name.sh . - _


CONTAINER_DIR=$1
SEARCH_STR=$2
REPLACE_WITH_STR=$3

if [ ! $CONTAINER_DIR ] || [ ! $SEARCH_STR ] || [ ! $REPLACE_WITH_STR ] 
then
  read -p "Container dir ? " CONTAINER_DIR
  read -p "Search string ? " SEARCH_STR
  read -p "Replace with string ? " REPLACE_WITH_STR
fi

TOOLS_DIR=$PWD

for FILE in $CONTAINER_DIR/*
do
    #echo $FILE

    if [ -d $FILE ]
    then

        $TOOLS_DIR/replace-string-in-file-content.sh $FILE $SEARCH_STR $REPLACE_WITH_STR

    else

        if [ -f $FILE ]
        then

            sed -i .bak 's/'"$SEARCH_STR"'/'"$REPLACE_WITH_STR"'/g' $FILE

            if [ -f $FILE.bak ]
            then
                rm $FILE.bak
            fi

        fi

    fi

done

