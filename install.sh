#!/bin/bash

DIR=`echo $PATH | tr ":" " " | awk '{print$1}'`

read -p "Command name for this script : " NAME

cp commit.sh ./$NAME

mv $NAME $DIR/

echo "Move \"$NAME\" into $DIR/"
echo "------------------------------------------------"
echo "Usage: $> $NAME [files to commit (accept \".\")]"
echo "------------------------------------------------"
echo -e "\033[0;33mYou can always use this command !\033[0;39m"
