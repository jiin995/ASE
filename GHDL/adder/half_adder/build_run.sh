#!/bin/bash

DIR_NAME=${PWD##*/}

if [ $# == 0 ] ; then

	echo "No input, i find all vhd file that namig with " $DIR_NAME;
	VHD_FILES=( $(ls -al ${DIR_NAME}*.vhd | awk '{split ($0,a," ");print a[9]}') )


else
	INPUT=( "$@" )
	#echo $INPUT
	#LOAD all VHD files in dir
	if [ $1 == 'ALL' ] ; then
		echo "loading all vhd files"
		VHD_FILES=($(ls -al *.vhd | awk '{split ($0,a," ");print a[9]}'))
	else
#load only DIR_NAME.vhd files and files that are passed
		for i in $(seq 1 $#); do
			#echo "valuting " ${INPUT[$i]}
			if [[ ${INPUT[$i-1]} == *.vhd ]] ; then
				if [ -f ${INPUT[$i-1]} ]; then
					echo 'found vhd files' ${INPUT[$i-1]}
					VHD_FILES+=${INPUT[$i-1]}
				else
					echo "vhd file not exist, passing " ${INPUT[$i-1]}
				fi
			else
				echo 'input not valid, passing it ' ${INPUT[$i-1]}
			fi
		done
		VHD_FILES+=( $(ls -al ${DIR_NAME}*.vhd | awk '{split ($0,a," ");print a[9]}') )
	fi

fi

#VHD_FILES=( $(ls -al ${DIR_NAME}*.vhd | awk '{split ($0,a," ");print a[9]}') )


if [ ${#VHD_FILES[@]} != 0 ] ;then
	for i in $(seq 0 ${#VHD_FILES[@]}); do
		echo "Loading in ghdl workspace" ${VHD_FILES[$i-1]}
		ghdl -a  ${VHD_FILES[$i-1]}

		if [ $? != 0 ]; then
			echo -e "\t\e[31mError: \e[39mwhile l loading vhdl file:  " ${VHD_FILES[$i-1]}
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
