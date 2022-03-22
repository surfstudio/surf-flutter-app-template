#! /bin/bash

pathToDTOFolder=$1
nameOfTheUmbrella=$2

fileNames=()

filter=".g.dart"

# remove old umbrella file
# to exclude it from file reading (the simplest way)

rm -f $nameOfTheUmbrella

# Read all files from directory with DTO models
# and save their names (with extensions) into `fileNames` array

for file in ${pathToDTOFolder}/*
do
    nameAndExt=${file##*/}
    if [[ "$nameAndExt" != *"$filter"* ]]; then
        fileNames+=($nameAndExt)
    fi
done

# write new umbrella

for value in ${fileNames[@]}
do
    name=${value%.*}
    echo "export '$value';" >> $nameOfTheUmbrella
done