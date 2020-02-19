#!/bin/bash
ls -1 *.ttf | \
while read file
do
    newFile=`echo $file | tr -d ",'" | sed "s% %-%g" | sed "s%_%-%g"`
    if [ ! -e $newFile ]
    then
      echo "mv '$file' $newFile"
      echo "mv '$file' $newFile" | bash
    fi  
done
