#To collect NCBI protein IDs of ssDNA-specific Rep (Replication-associated protein) protein used in Li et al., 2020 and a few additional ones from NCBI (Rep_ID.txt)
#To retrieve the FASTA sequences of IDs to a single fasta file using the efetch command.
cat Rep_proteins.txt | while read id; do   efetch -db protein -id $id -format fasta; done > Rep.fasta

#Aligning the sequences using MAFFT
mafft --auto Rep.fasta > Rep.aln

#Trimming the non-aligned regions to reduce the alignment length
trimal -in Rep.aln -out Rep_trimmed.aln -automated1

#Building Rep protein-based HMM using HMMER package
hmmbuild Rep.hmm Rep_trimmed.aln

