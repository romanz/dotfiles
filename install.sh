#!/bin/bash

cd $(dirname $0)/files
for src in *
do
	if [ -f $src ] 
	then
		dst=$HOME/.$src
		if [ -f $dst ]
		then
			mv $dst $dst~
		fi
		ln -s $PWD/$src $dst
		echo "installed .$src"
	fi
done
