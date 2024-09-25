#!/bin/bash

x=$(which ansible)

if [ -z $x ]; then
	./f2.sh
	./f3.sh
else
	./f3.sh
fi
