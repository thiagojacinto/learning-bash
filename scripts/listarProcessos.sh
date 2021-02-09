#!/bin/bash

processList=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])

for proc in $processList
do
  echo $(ps -p $proc -o comm=)
done