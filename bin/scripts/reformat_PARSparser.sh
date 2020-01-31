#!/bin/bash

DATAPATH='/home/nextPARS/data'
BINPATH="/home/nextPARS/bin"

FILES=$DATAPATH'/tab/*.tab'
reformat_PARSParser=$BINPATH/'reformat_PARSparser_output.py'

for fullfile in $FILES
do

	filename=$(basename -- "$fullfile")
	extension="${filename##*.}"
	filename="${filename%.*}"
	directory=$(basename $(dirname $fullfile))
	echo "Processing $filename"
	sample=${filename/.fastq.gz/}

	python $reformat_PARSParser -t $fullfile -m 20
	
done
