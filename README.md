## BACKGROUND

**Mycoviruses** are viruses associated with fungi. Mycoviral populations are highly diverse, spreading across 23 viral families. They are maintained and transmitted within fungal hosts vertically by means of asexual and/or sexual spores and horizontally between fungal hosts by hyphal fusion. Most of the known mycoviruses have dsRNA or single-stranded (ssRNA) genomes, either positive sense or negative sense. RNA mycoviruses usually range in genomic sizes of 2.5-23kb, encoding 1-12 genes from one or more genomic components. RNA-dependent RNA polymerase (RdRp) serves as an important feature. Most DNA mycoviruses are single-stranded circular, usually referred to as CRESSDNA (circular replication-associated protein-encoding ssDNA) viruses. They carry ORFs of rolling-circle replication-associated protein (Rep), capsid protein (CP) and a few unknown proteins interconnected by extensive intergenic regions, making up a genomic size of over 3.2kb, distributed across 1-4 genomic components.

While most of the mycoviruses identified are classified as ssRNA and dsRNA viruses, a few DNA viruses have been reported to be associated with phytopathogenic fungal strains, including Sclerotinia sclerotiorum hypovirulence-associated DNA virus 1 (SsHADV-1) (Yu et al., 2010), Fusarium graminearum gemytripvirus 1 (FgGMTV1) (Li et al., 2020) and Diaporthe sojae circular DNA virus 1 (DsCDV1) (Wang et al., 2024). Additionally, two novel ssDNA mycoviruses associated with the fungus, Botrytis cinerea (Botrytis cinerea ssDNA virus 1 (BcssDV1) and Botrytis cinerea genomovirus 1 (BcGV1) have been reported (Ruiz-Padilla et al., 2021; Hao et al., 2021).

The circular ssDNA mycoviruses make copies of their genome by rolling-circle replication (RCR). All the reported DNA mycoviruses encode **rolling-circle replication-associated proteins** (Rep). The Rep proteins are viral-encoded proteins for initiating and performing RCR inside the fungal host after infection. The protein possesses two conserved domains, namely a HUH (Histidine-hydrophobic residue-Histidine) endonuclease domain and an SF3 (Super family 3) helicase domain. The endonuclease domain contains three motifs (Motif I, Motif II and Motif III) which are involved in initiation of RCR by introducing a single nick at specific sites near the origin of replication. The Rep protein binds to the 5’ end of the nicked strand until the host DNA polymerase binds to the 3’ OH end using the template of double stranded replicative form as a template. Simultaneously, the helicase domain with characteristic motifs (Walker A, Walker B and Motif C) displaces the initial virion strand to be released as ssDNA after replication. Although the Rep proteins are functionally conserved across species, they are quite divergent, sharing less than 78 % sequence similarity between two viral species within the same family. Hence, Rep proteins are used as phylogenetic markers to classify and study the evolution of ssDNA viruses.

**Hidden Markov Models** (HMMs) are powerful probabilistic models used to capture the statistical patterns and conserved motifs within biological sequences. They have been used as an essential tool in bioinformatics for detecting protein families and domains that share evolutionary relationships, even when sequence similarity is low. They are considered more sensitive than BLAST for finding distant homologs. By training HMMs on multiple sequence alignments of related proteins, characteristic domains can be identified and used to search large datasets with high sensitivity.  Many HMM-based tools are available for identifying hallmark viral genes. Rep proteins often display significant sequence diversity, making their detection by standard similarity searches from huge datasets challenging. To overcome this limitation, a specialised Rep protein-based HMM can be developed from curated multiple sequence alignments, enabling more accurate identification of replication-related proteins across mycoviral species. 

## WORKFLOW

Collection of Rep protein sequences from viral families *genomoviridae* and *geminiviridae*

Construction of HMM based on Rep proteins using HMMER package

*De novo* read assembly of virus-related reads retrieved from fungal transcriptome by reference genome-based assembly.

Open reading frame (ORF) prediction on *de novo* assembled read contigs

HMM search on predicted protein sequences from the contigs.


## REFERENCES

Li, P., Wang, S., Zhang, L., Qiu, D., Zhou, X., & Guo, L. (2020). A tripartite ssDNA mycovirus from a plant pathogenic fungus is infectious as cloned DNA and purified virions. Science advances, 6(14), eaay9634. https://doi.org/10.1126/sciadv.aay9634

Yu, X., Li, B., Fu, Y., Jiang, D., Ghabrial, S. A., Li, G., Peng, Y., Xie, J., Cheng, J., Huang, J., & Yi, X. (2010). A geminivirus-related DNA mycovirus that confers hypovirulence to a plant pathogenic fungus. Proceedings of the National Academy of Sciences of the United States of America, 107(18), 8387–8392. https://doi.org/10.1073/pnas.0913535107

Wang, X., Kotta-Loizou, I., Coutts, R. H., Deng, H., Han, Z., Hong, N., ... & Wang, G. (2024). A circular single-stranded DNA mycovirus infects plants and confers broad-spectrum fungal resistance. Molecular Plant, 17(6), 955-971.

Ruiz-Padilla, A., Rodríguez-Romero, J., Gómez-Cid, I., Pacifico, D., & Ayllón, M. A. (2021). Novel Mycoviruses Discovered in the Mycovirome of a Necrotrophic Fungus. mBio, 12(3), e03705-20. https://doi.org/10.1128/mBio.03705-20

Hao, F., Wu, M., & Li, G. (2021). Characterization of a novel genomovirus in the phytopathogenic fungus Botrytis cinerea. Virology, 553, 111-116.

