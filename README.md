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
###### Iso-Seq data
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
###### UniProt Swissprot [Canonical and Isoforms]
```
downloaded on 2022.11.16
uniprot_sprot-2022.11.16.fasta:568363  # canonical
uniprot_sprot_varsplic-2022.11.16.fasta:40853  # isoforms
```
```bash
-rw-r--r-- 1 bougous cbrc-PrlMill_Babil  29M Oct 12 17:17 /ibex/scratch/projects/c2022/Analysis2022/sb/03.maker/00.protein/uniprot_sprot_varsplic-2022.11.16.fasta
-rw-r--r-- 1 bougous cbrc-PrlMill_Babil 270M Oct 12 17:17 /ibex/scratch/projects/c2022/Analysis2022/sb/03.maker/00.protein/uniprot_sprot-2022.11.16.fasta
```
###### Pearl Millet [_Cenchrus americanus_]
Paper: https://www.nature.com/articles/nbt.3943

I could not download the protein annotation from http://gigadb.org/dataset/view/id/100192
so I downloaded the annotation from https://cegresources.icrisat.org/data_public/PearlMillet_Genome/v1.1/ (cited in the paper) labelled as v1.1
```
PM.genechr.trans.pep:35791
PM.genescf.pep:2788
```
```bash
-rw-r--r-- 1 bougous cbrc-PrlMill_Babil 1.1M May 30  2016 /ibex/scratch/projects/c2022/Analysis2022/sb/03.maker/00.protein/PM.genescf.pep
-rwxr-xr-x 1 bougous cbrc-PrlMill_Babil  15M May 30  2016 /ibex/scratch/projects/c2022/Analysis2022/sb/03.maker/00.protein/PM.genechr.trans.pep
```

##### Green Millet [_Setaria viridis_]
Paper: https://www.nature.com/articles/s41587-020-0681-2

I cannot find the annotation described in the paper so I am using the one from NCBI annotation pipeline
https://www.ncbi.nlm.nih.gov/genome/annotation_euk/Setaria_viridis/100/

protein annotation downloaded from
https://ftp.ncbi.nlm.nih.gov/genomes/all/annotation_releases/4556/100/GCF_005286985.1_Setaria_viridis_v2.0/GCF_005286985.1_Setaria_viridis_v2.0_protein.faa.gz

```bash
-rw-r--r-- 1 bougous cbrc-PrlMill_Babil  21M May 25  2020 /ibex/scratch/projects/c2022/Analysis2022/sb/03.maker/00.protein/GCF_005286985.1_Setaria_viridis_v2.0_protein.faa
```

##### Foxtail millet [_Setaria italica_]
https://ftp.ncbi.nlm.nih.gov/genomes/all/annotation_releases/4555/103/GCF_000263155.2_Setaria_italica_v2.0/GCF_000263155.2_Setaria_italica_v2.0_protein.faa.gz

```bash
-rw-r--r-- 1 bougous cbrc-PrlMill_Babil  19M Dec 11  2019 /ibex/scratch/projects/c2022/Analysis2022/sb/03.maker/00.protein/GCF_000263155.2_Setaria_italica_v2.0_protein.faa
```

##### The elephant grass [_Cenchrus purpureus_]
Paper: https://doi.org/10.1111/1755-0998.13271

CANNOT DOWNLOAD THE ANNOTATION FROM CHINESE SERVER. I SENT AN EMAIL TO CORRESPONDING AUTHORS.
https://download.cncb.ac.cn/gwh/Plants/Cenchrus_purpureus_Elephant_grass_cv._Purple_GWHAORA00000000/GWHAORA00000000.Protein.faa.gz

##### Sorghum [_Sorghum bicolor_]
https://ftp.ncbi.nlm.nih.gov/genomes/all/annotation_releases/4558/101/GCF_000003195.3_Sorghum_bicolor_NCBIv3/GCF_000003195.3_Sorghum_bicolor_NCBIv3_protein.faa.gz

```bash
-rw-r--r-- 1 bougous cbrc-PrlMill_Babil  21M Dec 11  2019 /ibex/scratch/projects/c2022/Analysis2022/sb/03.maker/00.protein/GCF_000003195.3_Sorghum_bicolor_NCBIv3_protein.faa
```

#### MAKER pipeline
***

#### Postprocessing
***
##### Renaming gene IDs
The format of the gene ids is:
```
awk --> PgAWc<chrom=2 digits><assembly_version=01>G<gene_number=6 digits> e.g. Gene: PgAWc0101G009464 & Transcript: PgAWc0101G009464.1
p10k --> PgP10c<chrom=2 digits><assembly_version=01>G<gene_number=6 digits> e.g. PgP10c0101G009518 & Transcript: PgP10c0101G009518.1
```
Here is the code I used:
```bash
module load maker;
## awk
maker_map_ids --prefix "PgAWc|" --suffix . --abrv_gene G --abrv_tran G --iterate 1 --justify 6 awk.hm.all.r05+abinitio.gff > awk.map.txt
cat awk.map.txt|awk -F"[-_]" '{print $0"\t|"$2}' |sed 's#\t|Pg#|#g' |awk -F"|" '{print $1"0"$3"01"$2}' > awk.map2.txt
sed -i 's#PgAWc0Un#PgAWcUn#g' awk.map2.txt
## p10k
maker_map_ids --prefix "PgP10c|" --suffix . --abrv_gene G --abrv_tran G --iterate 1 --justify 6 P10K.hm.all+abinitio.r05+abinitio.gff > p10k.map.txt
cat p10k.map.txt|awk -F"[-_]" '{print $0"\t|"$2}' |sed 's#\t|Pg#|#g' |awk -F"|" '{print $1"0"$3"01"$2}' > p10k.map2.txt
sed -i 's#PgP10c0Un#PgP10cUn#g' p10k.map2.txt
```

##### High & Low Confidence Genes/Proteins
I filtered genes based on the following four strategies:

###### 1. based on EST evidence
Here, we leverage RNA-seq and the Iso-Seq evidence (described above)

##### GFF3 to GTF2 conversions
To convert GFF3 file to GTF2, I used gffread tool (part of cufflink package).

```bash
gffread -T -o P10K.hm.all+abinitio.r05+abinitio.newIDs.gtf P10K.hm.all+abinitio.r05+abinitio.newIDs.gff
gffread -T -o awk.hm.all.r05+abinitio.newIDs.gtf awk.hm.all.r05+abinitio.newIDs.gff
```

For more info, refer to http://ccb.jhu.edu/software/stringtie/gff.shtml

#### Bibliography
***
1. MAKER: https://www.yandell-lab.org/software/maker-p.html
2. UniProt SwissProt: https://www.uniprot.org/uniprotkb?facets=reviewed%3Atrue&query=%2A
