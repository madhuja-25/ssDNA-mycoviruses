#!/bin/bash
# 01_build_rep_hmm.sh
# Builds a Rep protein-based HMM from curated ssDNA mycovirus Rep sequences
# (from Li et al., 2020 and additional NCBI entries; see file Rep_proteins.txt)

set -euo pipefail

# Retrieve FASTA sequences for the collected NCBI protein IDs
cat Rep_proteins.txt | while read -r id; do
    efetch -db protein -id "$id" -format fasta
done > Rep.fasta

# Align the sequences using MAFFT
mafft --auto Rep.fasta > Rep.aln

# Trim non-aligned regions to reduce alignment length
trimal -in Rep.aln -out Rep_trimmed.aln -automated1

# Build the Rep protein-based HMM using the HMMER package
hmmbuild Rep.hmm Rep_trimmed.aln

