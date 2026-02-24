#! /bin/bash

filename=$(date "+%Y-%m-%d_%H-%M-%S").org
touch $filename
cp "$filename" ~/org/"$filename" 
rm "$filename"
