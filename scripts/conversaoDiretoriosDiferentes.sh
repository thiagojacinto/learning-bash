#!/bin/bash

convert_file(){
  local file_path=$1
  local file_name=$(ls $file_path | awk -F. '{ print $1 }')

  convert $file_name.jpg $file_name.png
  echo $file_name "was converted to PNG"
}

read_dir(){
cd $1
for item in * do
  local item_path=$(find /workspimagens-novos-livros -name $item)
  if [ -d $item_path ]
  then
    echo $item_path "is a directory"
    read_dir $item_path
  else
    #convert file to PNG
    echo $item_path "is a file"
    convert_file $item_path
  fi
done
}

read_dir $1 2>/workspace/errors.txt
if [ $? -eq 0 ] 
then 
        echo "Conversion was successful."
else 
        echo "Ops, something wrong happen. We might chekout more information at errors.txt"
fi