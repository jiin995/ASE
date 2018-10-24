#!/bin/bash

DIR_NAME=${PWD##*/}

if [ $# == 0 ] ; then

	echo "No input, i find all vhd file that namig with " $DIR_NAME;
	VHD_FILES=( $(ls -al $DIRNAME*.vhd | awk '{split ($0,a," ");print a[9]}') )
fi

if [ ${#VHD_FILES[@]} != 0 ] ;then
	for i in $(seq 1 ${#VHD_FILES[@]}); do
		echo "Loading in ghdl workspace" ${VHD_FILES[$i-1]}
		ghdl -a  ${VHD_FILES[$i-1]}

		if [ $? != 0 ]; then
			echo -e "\t\e[31mError: \e[39mwhile loading vhdl file:  " ${VHD_FILES[$i-1]}
			echo "Abort all operations"

			ghdl --clean
			rm -f work-obj93.cf
			exit
		fi
	done

	echo "VHD Files are completely loaded"
	ghdl -e ${DIR_NAME}_testbench
	ghdl -r ${DIR_NAME}_testbench --vcd=${DIR_NAME}.vcd

        echo "Done. Running gtkwave"

	gtkwave ${DIR_NAME}.vcd
else
	echo "No vhdl files"
fi
