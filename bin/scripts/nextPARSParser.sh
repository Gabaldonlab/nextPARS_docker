#!/bin/bash

DATAPATH='/home/nextPARS/data'
BINPATH="/home/nextPARS/bin"

BT2_FILES_PATH_OUT=$DATAPATH'/tab'
GFF=$DATAPATH"/DB/saccharomyces_cerevisiae/saccharomyces_cerevisiae.gff"
FILES=$DATAPATH/mapping/*.bam
nextPARSParser=$BINPATH'/nextPARSParser.py'

#############
# Parser
#############


for fullfile in $FILES
do
	filename=$(basename -- "$fullfile")
	extension="${filename##*.}"
	filename="${filename%.*}"
	echo "Processing $filename"
	sample=${filename/.fastq.gz/}
	sample=${sample%%.*}
	echo "python $nextPARSParser -b $fullfile -g $GFF -o $BT2_FILES_PATH_OUT/$sample.tab -t gene"
done



