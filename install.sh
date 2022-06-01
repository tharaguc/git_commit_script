#!/bin/bash

read -p $'\e[33;36;1mCommand name for this script : \e[m' NAME

cp commit.sh ./$NAME

mv $NAME /usr/local/bin/

echo "Move \"$NAME\" into /usr/local/bin/"
echo "------------------------------------------------"
echo "Usage: $> $NAME [files to commit (accept \".\")]"
echo "------------------------------------------------"
echo -e "\033[0;33mYou can always use this command !\033[0;39m"

rm -rf ../git_commit_script