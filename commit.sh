#!/bin/bash

for x in $@
do
	echo "========================="
	echo "git add $x"
	echo "========================="
	git add $x
done

git status

read -p "Do you want to commit? (y/n) " YN

COMMITOK="n"

if [ "$YN" = "y" ]; then
	while [ "$COMMITOK" != "y" ]
	do
		echo "========================="
		read -p "Commit message :" MSG
		echo "git commit -m \"$MSG\""
		read -p "OK? (y/n) " COMMITOK
	done
	echo ">>>>>>>>>>>>>>>>>>>>>>"
	git commit -m "$MSG"
	echo ">>>>>>>>>>>>>>>>>>>>>>"
else
	exit
fi

read -p "Do you want to push? (y/n) " YN2

if [ "$YN2" = "y" ]; then
	read -p "git push " ARG
	echo "========================="
	echo "git push $ARG"
	git push $ARG
	echo "========================="
else
	exit
fi