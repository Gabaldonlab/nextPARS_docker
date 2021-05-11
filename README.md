# Profiling of RNA structure at single-nucleotide resolution using nextPARS.

The protocol for the computation of the nextPARS scores and their use to obtain the structural profile (single- or double-stranded state) of an RNA sequence at single-nucleotide resolution: https://link.springer.com/protocol/10.1007/978-1-0716-1307-8_4


![flowchart](https://user-images.githubusercontent.com/1820116/117805643-7f269300-b259-11eb-8345-994e177b91da.png)


**Automatization of Steps**
In order to simplify steps, there are different bash scripts in the bin/scripts directory inside the container. These scripts will help to automate the pipeline and to use a set of V1 and S1 samples. We assume that you have the .fastq files in the data/fastq directory.

cd ~/bin/scripts

# Trimming
./trimming.sh

# Mapping reads. Use the following script to do the mapping. First, you have to generate the genome index (step 1.3).
./mapping.sh

# Note: If you want to start with the Parser step (count number of reads beginning at each position), we assumed that you have the bam files in the data/mapping directory. As an alternative, you can use already generated bam files (subsets from the originals), that are inside the data/mapping_subset directory. To do so, you have to modify the FILE variable (changing mapping by mapping_subset) on the following script.

# Parser
./nextPARSParser.sh

# Filter out transcripts
./reformat_PARSParser.sh
