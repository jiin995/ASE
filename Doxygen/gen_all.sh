#!/bin/bash

DIRS=($(ls -df */))
PWD=$(pwd)

for i in  $(seq 1 ${#DIRS[@]}); do
    DIR_ISE=${DIRS[$i-1]}"ISE"
    DIRS1=($(ls -df $DIR_ISE/*))
    for j in $(seq 1 ${#DIRS1[@]}); do 
        DIR=${DIR1[$j-1]}
        echo "Copio e eseguo lo script in  $DIR"
            cp gen_doc.sh $DIR
        cd $DIR
        bash gen_doc.sh
        bash gen_doc.sh clear
        cd $PWD
    done
done
