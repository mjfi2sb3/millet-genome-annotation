

lima --isoseq --peek-guess 00.data/r64068_20220831_124330_1_A01.ccs.bam IsoSeq_Primers_12_Barcodes_v1.fasta fl.bam
ls $PWD/fl.*bam > all.fofn

isoseq3 refine all.fofn IsoSeq_Primers_12_Barcodes_v1.fasta flnc.bam --require-polya

isoseq3 cluster flnc.bam clustered.bam --use-qvs
