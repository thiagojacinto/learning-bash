#!/bin/bash

if [ ! -d logs ]
then
        mkdir logs
fi

listar(){
processList=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])

for proc in $processList
do
        pname=$(ps -p $proc -o comm=)
        psize=$(ps -p $proc -o size | grep [0-9])
        echo -n $(date +%F,%H:%M:%S,) >> logs/$pname.log
        echo "$(bc <<< "scale=2;$psize/1024")MB" >> logs/$pname.log

done
}

listar 2>>Errors.log
if [ $? -eq 0 ]
then
        echo "Success! Verify /logs to see the results"
else
        echo "Ops, an Error has been found. Verify Errors.log for more information."
fi