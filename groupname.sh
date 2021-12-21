#!/bin/bash

file=''
f_opt=0
git=''

while [[ -n "$1" ]] 
do
	case $1 in
	-f) if [[ $f_opt -eq 0 ]] 
		then
			f_opt=1
			# shift
			file=$2
			shift
		fi ;;
	*) git=$1
	       break	;;
esac
shift
done


if [[ $file == '' ]]
then
	file='/etc/group,git'
fi

if [[ $git == '' ]]
then
	echo 'git not setted';
	exit 2
fi

str=$(grep -w $git $file)

if [[ $str == '' ]]
then
	echo 'git not found'
	exit 1
fi

list_of_users=${str/*:*:}

echo "/////////////////////////////////"
echo "$str"
echo "/////////////////////////////////"
