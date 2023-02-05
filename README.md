# The genome annotation of two pearl millet genomes :ear_of_rice:
### An annotation journey using the MAKER pipeline


[[_TOC_]]

#### Summary
***
The following details the annotation pipeline I used to annotate two pearl millet genomes, codenamed internally as AWK and P10K. The main annotation pipeline I used is the MAKER pipeline <sup>[1](https://www.yandell-lab.org/software/maker-p.html)</sup>.

#### Preparation of data for annotation
***
The following data are required for a decent gene annotation excercise:

- [x] A genome assembly
- [x] EST data: assembled RNASeq and/or ISOSEQ data from different plant tissues and under different conditions
- [x] Homology data: good quality proteomes of closely related species. One should also use the UniProt Swissprot dataset <sup>[2](urlhttps://www.uniprot.org/uniprotkb?facets=reviewed%3Atrue&query=%2A)</sup>.

##### a. Genome assemblies
Done by Michael Abrouk. Briefly, HiFi data were assembled using hifiasm then OmniC data were used to scaffold and validate the higjhly contiguous hifiasm assembly.

##### b. EST evidence
###### RNA-Seq data
This was done by Intikhab Alam. Briefly, rnaseq data were mapped on the respective genome using STAR taking into account that these rnaseq are unstranded. Assembly of transcripts was done using StringTie then merged using StringTie merge mode.
###### ISOSEQ data
```bash
# smrtlink_11.0.0.146107
### LIMA
lima --isoseq --peek-guess --num-threads 30 r64068_20220831_124330_2_B01.ccs.bam IsoSeq_Primers_12_Barcodes_v1.fasta fl.bam
### Remove poly(A) tails and concatemer
isoseq3 refine all.fofn IsoSeq_Primers_12_Barcodes_v1.fasta flnc.bam --require-polya --log-level DEBUG
### cluster
isoseq3 cluster flnc.bam clustered.bam --use-qvs --verbose
### collapse
pbmm2 align --num-threads 30 --preset ISOSEQ --sort clustered.hq.bam genome_assembly.fasta  mapped.s.bam
isoseq3 collapse mapped.s.bam awk.collapse.gff 
```

##### c. Homology evidence


#### MAKER pipeline
***

#### Postprocessing
***

#### Bibliography
***
1. MAKER: https://www.yandell-lab.org/software/maker-p.html
2. UniProt SwissProt: https://www.uniprot.org/uniprotkb?facets=reviewed%3Atrue&query=%2A
