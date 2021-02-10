#!/bin/bash

processList=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])

for proc in $processList
do
        pname=$(ps -p $proc -o comm=)
        echo $pname
        echo $(date +%F,%H:%M:%S,) >> $pname.log
done