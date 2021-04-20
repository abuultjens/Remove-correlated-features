#!/bin/bash

INFILE=${1}
OUTFILE=${2}

head -1 ${INFILE} > ${OUTFILE}
tr ',' '\t' < ${INFILE} | tail -n +2 | sort -k2 | uniq --skip-fields=1 | tr '\t' ',' >> ${OUTFILE}