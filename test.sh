#!/bin/bash

echo "Number of directories to create: "
read num_dirs

echo "Number of files to create in each directory: "
read num_files

for ((i=1; i<=num_dirs; i++))
do
    mkdir dir$i
    for ((j=1; j<=num_files; j++))
    do
        touch dir$i/file$j.txt
    done
done