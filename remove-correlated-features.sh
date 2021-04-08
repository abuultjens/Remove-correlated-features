#!/bin/bash

INFILE=${1}
OUTFILE=${2}

N_SPLIT=10

# generate random prefix for all tmp files
RAND_1=`echo $((1 + RANDOM % 100))`
RAND_2=`echo $((100 + RANDOM % 200))`
RAND_3=`echo $((200 + RANDOM % 300))`
RAND=`echo "${RAND_1}${RAND_2}${RAND_3}"`

mkdir ${RAND}

# get all uniq patterns
tail -n +2 ${INFILE} | cut -f 2- -d ',' | sort | uniq > ${RAND}_uniq_tmp.csv

FOFN=${RAND}_uniq_tmp.csv

# write header
head -1 ${INFILE} > ${OUTFILE}

#---------------------------
# set up parallel

# get number of taxa in fofn
N_TAXA=`wc -l ${FOFN} | awk '{print $1}'`

# split fofn
split -d -l ${N_SPLIT} ${FOFN} ${RAND}/FOFN_${RAND}_

# make group fofn
ls ${RAND}/FOFN_${RAND}_* > ${RAND}/${RAND}_FOFN.txt

# loop through groups
for GROUP in $(cat ${RAND}/${RAND}_FOFN.txt); do

	FILE=`echo ${GROUP}`

	# loop through isolates in group
	for TAXA in $(cat ${FILE}); do
		grep "${TAXA}" ${INFILE} | head -1 > ${RAND}_${TAXA}_tmp.csv &
	done

	wait

done

# cat all lines to outfile
for TAXA in $(cat ${RAND}_uniq_tmp.csv); do
	cat ${RAND}_${TAXA}_tmp.csv >> ${OUTFILE}
	rm ${RAND}_${TAXA}_tmp.csv
done


# rm tmp files		
rm *${RAND}*
rm -r ${RAND}
