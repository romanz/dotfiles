#!/bin/bash
cd $(dirname $0)/files
for src in $(ls -a)
do
	if [ -f $src ]
	then
		dst=$HOME/$src
		mv $dst $dst~
		ln -s $PWD/$src $dst
		echo "installed $dst"
	fi
done
