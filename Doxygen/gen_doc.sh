#!/bin/bash

#Eseguimi nella cartella dei file VHDL e creo la documentazione
#Ricorda di cambiare il path di DOXYGEN_FILE

DIR_NAME=${PWD##*/}
DOXYGEN_FILES="/home/jiin995/ASE_WorkSpace/Doxygen"

if [ $1 == "clear" ]; then 
    rm -dr latex
    #rm -dr html
    rm -f Doxyfile
    exit
fi

if [ ! -f Doxyfile ]; then 
    echo "Doxyfile not exist"
    doxygen -g 
    sed -i "s/PROJECT_NAME           = \"My Project\"/PROJECT_NAME = \"$DIR_NAME\"/g" Doxyfile
    sed -i "s|LATEX_HEADER           =|LATEX_HEADER           = \"$DOXYGEN_FILES/header.tex\"|g" Doxyfile
    sed -i "s|GENERATE_HTML          = YES|GENERATE_HTML          = NO|g" Doxyfile
    
fi

doxygen Doxyfile
cd latex && make pdf && cd ../