#!/bin/bash -x

export PATH=/ibex/scratch/bougous/kaust_research/babili/millet/apps/maker-3.01.03/bin/:$PATH

round="r05+abinitio"
pref="P10K.hm.all+abinitio"

gff3_merge -o ${pref}.${round}.gff -n -d P10K.hm_master_datastore_index.log &
fasta_merge -o ${pref}.${round} -d P10K.hm_master_datastore_index.log &
wait

mkdir -p ${round};
mv *${pref}.${round}* ${round}/.

cp *.ctl ${round}/.

cd ${round}/;
AED_cdf_generator.pl -b 0.025 ${pref}.${round}.gff > ${pref}.${round}.gff.aed &

module load genometools;
gt stat ${pref}.${round}.gff > ${pref}.${round}.gff.stat &

wait
