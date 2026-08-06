#!/bin/bash
# 03_search_hmm.sh
# Searches the Rep HMM against predicted ORFs from de novo assembled contigs
# (TransDecoder output), then validates hits by BLAST against viral and NR databases.

set -euo pipefail

## HMM search for ssDNA-specific Rep-like proteins on predicted ORFs of Trinity-assembled contigs (Transdecoder output)
hmmsearch --cpu 8 -E 1e-5 --tblout results.tbl \
    Rep.hmm ./Trinity.fasta.transdecoder.pep

# Output is written to results.tbl; contigs with significant hits are retrieved below.

## Retrieve the contig(s) with HMM hits (example: TRINITY_DN9239_c0_g1_i2.p1)
seqkit grep -p "TRINITY_contig" ./Trinity.fasta.transdecoder.pep > hit.fasta

## BLAST validation against a custom viral protein database and NR

# Build a custom viral protein database
makeblastdb -in viral_protein.fasta -dbtype prot -out viral_db -parse_seqids

# BLASTp against the custom viral database
blastp -query hit.fasta -db viral_db -out orf_vs_viral.out \
    -evalue 1e-5 -num_threads 8 -outfmt 6

# BLASTp against the NCBI non-redundant (NR) protein database
blastp -query hit.fasta -db nr -remote -out results.out \
    -evalue 1e-5 -max_target_seqs 50 -seg yes -outfmt 6
