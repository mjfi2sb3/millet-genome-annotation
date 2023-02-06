#!/bin/bash
#


export PATH=/ibex/scratch/bougous/apps/seqkit_v2.2.0/:$PATH

seqkit split -p 300 -j 5 awk.hm.all.r05+abinitio.all.maker.proteins.fasta

for i in awk.hm.all.r05+abinitio.all.maker.proteins.fasta.split/*; do
	p=`basename $i`; p=${p%.fasta};
	echo "interproscan.sh -b ipr_out/${p} -i $i";
done > commands.txt


mkdir -p ipr_out;


sbatch -t 1-00:00:00 -a 1-300 submit_ipr_arr.sh
