#!/bin/bash

for x in $@
do
	echo "========================="
	echo -e "\033[0;36mgit add $x\033[0;39m"
	echo "========================="
	git add $x
done

echo "---"
git status | grep "\t"
echo "---"

read -p $'\e[33;46;1mDo you want to commit? (y/n) \e[m' YN


COMMITOK="n"

if [ "$YN" = "y" ]; then
	while [ "$COMMITOK" != "y" ]
	do
		echo "========================="
		read -p $'\e[33;36;1mCommit message : \e[m' MSG
		echo -e ">> \033[0;36mgit commit -m \"$MSG\"\033[0;39m"
		read -p "OK? (y/n) " COMMITOK
	done
	echo ">>>>>>>>>>>>>>>>>>>>>>"
	git commit -m "$MSG"
	echo ">>>>>>>>>>>>>>>>>>>>>>"
else
	git reset HEAD
	exit
fi

read -p $'\e[33;46;1mDo you want to push? (y/n) \e[m' YN2

if [ "$YN2" = "y" ]; then
	read -p $'\e[33;36;1mrepo & branch >> git push : \e[m' ARG
	echo "========================="
	echo -e "\033[0;36mgit push $ARG\033[0;39m"
	git push $ARG
	echo "========================="
else
	exit
fi