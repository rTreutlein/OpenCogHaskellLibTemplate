#!/bin/bash

stack build

libname=$(stack query | awk 'NR==2' | sed 's/://g'| sed 's/ //g')
libver=$(stack query | awk 'NR==4' | sed 's/version: //g' | sed "s/'//g" | sed "s/ //g")

sudo rm /usr/local/lib/opencog/"lib$libname-$libver.so"

LIB=$(find . -name "*$libname*.so" | awk 'NR==1')

sudo mv $LIB "/usr/local/lib/opencog/lib$libname-$libver.so"
