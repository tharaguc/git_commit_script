#!/bin/bash

for x in $@
do
	echo "========================="
	echo -e "\033[0;36mgit add $x\033[0;39m"
	echo "========================="
	git add $x
done

echo "---------"
git status
echo "---------"

read -p $'\e[33;46;1mDo you want to commit? (y/n)\e[m ' YN


COMMITOK="n"

if [ "$YN" = "y" ]; then
	while [ "$COMMITOK" != "y" ]
	do
		if [ "$COMMITOK" == "e" ];then
			git reset HEAD
			exit
		fi
		echo "========================="
		read -p $'\e[33;36;1mCommit message : \e[m' MSG
		echo -e ">> \033[0;35mgit commit -m \"$MSG\"\033[0;39m"
		read -p $'\e[33;46;1mOK? (y/n/e)\e[m ' COMMITOK
	done
	echo ">>>>>>>>>>>>>>>>>>>>>>"
	git commit -m "$MSG"
	echo ">>>>>>>>>>>>>>>>>>>>>>"
else
	git reset HEAD
	exit
fi

read -p $'\e[33;46;1mDo you want to push? (y/n)\e[m ' YN2

if [ "$YN2" = "y" ]; then
	git remote -v
	read -p $'\e[33;36;1mrepo & branch >> git push : \e[m' ARG
	echo "========================="
	echo -e "\033[0;36mgit push $ARG\033[0;39m"
	git push $ARG
	echo "========================="
else
	exit
fi