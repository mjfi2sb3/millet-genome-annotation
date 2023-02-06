
r="r05"
#for fasta in Pg*.fasta; do
for fasta in Pg*.fasta; do

	jn=${fasta%.fasta}
	sbatch -J ${jn} -o slurm_out/slurm-${r}-${jn}-%j.err maker.hm.sh $fasta	
	
done
