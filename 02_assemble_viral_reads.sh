#!/bin/bash
# 02_assemble_viral_reads.sh
# Reference genome-based subtraction to recover non-host (candidate viral) reads,
# followed by de novo assembly and ORF prediction.

set -euo pipefail

## Reference genome-based assembly
# Combine all reference genomes (both haplotypes if dikaryotic, plus mitochondrial genome)
cat hapA_genomic.fna hapB_genomic.fna mitochondrial_genome.fasta > combined.fasta

# Build a reference index for mapping
hisat2-build combined.fasta combined_index
hisat2 -p 16 --dta -x combined_index \
    -1 forward_trimmed.fq.gz -2 reverse_trimmed.fq.gz \
    -S mapped.sam

## Retrieve non-host (unmapped) reads using samtools
# Convert SAM to BAM
samtools view -Sb mapped.sam > mapped.bam

# Extract unmapped reads (includes singletons)
samtools view -b -f 4 mapped.bam > unmapped.bam

# Extract paired unmapped reads and singletons as FASTQ
samtools fastq -f 4 -F 256 -F 2048 \
    -1 unmapped_1.fastq -2 unmapped_2.fastq \
    -s unmapped_singletons.fastq mapped.bam

## De novo assembly of unmapped reads using Trinity (min contig length 500 bp)
Trinity --seqType fq --max_memory 128G \
    --left unmapped_1.fq.gz \
    --right unmapped_2.fq.gz \
    --CPU 32 --min_contig_length 500 \
    --output /path_to_output/trinity_viral

## Predict coding ORFs using TransDecoder
cd /path_to_output/trinity_viral
TransDecoder.LongOrfs --complete_orfs_only -t ./Trinity.fasta
TransDecoder.Predict -t ./Trinity.fasta






