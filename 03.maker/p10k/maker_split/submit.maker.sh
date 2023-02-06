
r="r5"
for fasta in Pg*.fasta; do

	jn=${fasta%.fasta}
	sbatch -J ${jn} -o slurm_out/slurm-${r}-${jn}-%j.err maker.hm.sh $fasta	
	
done
