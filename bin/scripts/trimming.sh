#!/bin/bash

ADAPTER="TGGAATTCTCGGGTGCCAAGGAACTCCAGTCAC"

DATAPATH='/home/nextPARS/data'
FILES=$DATAPATH"/fastq/*"

for fullfile in $FILES
do
	filename=$(basename -- "$fullfile")
	extension="${filename##*.}"
	filename="${filename%.*}"
	echo "Processing $filename"
	cutadapt -a $ADAPTER -m 18 -j 4 -o $DATAPATH/trimming/$filename.fastq.qz $fullfile > $DATAPATH/report/trimming_$filename.txt
done
