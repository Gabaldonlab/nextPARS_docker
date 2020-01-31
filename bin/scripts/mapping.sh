#!/bin/bash

DATAPATH='/home/nextPARS/data'

BT2_FILES_PATH_OUT=$DATAPATH'/mapping'
DIRECTORY=$DATAPATH'/trimming'
DB_INDEX=$DATAPATH"/DB/saccharomyces_cerevisiae/"


TMP_DIR='/tmp/tmp_nextPARS'

mkdir $TMP_DIR
# Remove data from tmp
rm -f -r $TMP_DIR/*

#############
# Mapping
#############

for fullfile in $DATAPATH/trimming/*
do
	filename=$(basename -- "$fullfile")
	extension="${filename##*.}"
	filename="${filename%.*}"
	echo "Processing $filename"
	STAR --runThreadN 4 --genomeDir $DB_INDEX --readFilesIn $fullfile --outFileNamePrefix $BT2_FILES_PATH_OUT/$filename --outSAMtype BAM SortedByCoordinate --outTmpDir $TMP_DIR/$filename

done
