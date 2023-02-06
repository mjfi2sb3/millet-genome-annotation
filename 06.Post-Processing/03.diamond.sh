module load diamond/2.1.0

diamond makedb --in transdecoder_stranded/longest_orfs.pep -d est.merged.awk+p10k.dedup3_longest_orfs

==> 01.est/commands.txt <==
nohup diamond blastp --query-cover 80 --id 80 --sensitive -d ../est.merged.awk+p10k.dedup3_longest_orfs -q awk.hm.all.r05+abinitio.all.maker.proteins.newIDs.fasta -o awk.dmnd.id80.qc80.tsv > awk.dmnd.id80.qc80.log &
nohup diamond blastp --query-cover 80 --id 80 --sensitive -d ../est.merged.awk+p10k.dedup3_longest_orfs -q P10K.hm.all+abinitio.r05+abinitio.all.maker.proteins.newIDs.fasta -o p10k.dmnd.id80.qc80.tsv > p10k.dmnd.id80.qc80.log &

==> 02.kegg/commands.sh <==
diamond blastp --min-score 60 -d ../kegg_db/kegg -q P10K.hm.all+abinitio.r05+abinitio.all.maker.proteins.newIDs.fasta -o p10k.dmnd.kegg.bs60.tsv > nohup.p10k.dmnd.kegg.bs60.log

==> 04.swissprot/commands.sh <==
nohup diamond blastp --query-cover  80 --subject-cover 80 --min-score 60  -d ../../uniprot_sprot_ALL_2022.11.16 -q awk.hm.all.r05+abinitio.all.maker.proteins.newIDs.fasta -o awk.dmnd.sprot.bs60.qc80.sc80.tsv > nohup.awk.dmnd.sprot.qc80.sc80.bs60.log &