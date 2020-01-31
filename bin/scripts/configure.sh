#!/bin/bash

DATAPATH=/home/nextPARS/data
BINPATH=/home/nextPARS/bin
ln -sfn /usr/bin/python3.5 /usr/bin/python

mkdir -p $DATAPATH/fastq
mkdir -p $DATAPATH/fastq
mkdir -p $DATAPATH/mapping
mkdir -p $DATAPATH/score
mkdir -p $DATAPATH/tab
mkdir -p $DATAPATH/trimming

chmod -R 775 $DATAPATH
