#!/bin/bash
#SBATCH -J ipr.awk.r05
#SBATCH --mem=0
#SBATCH --exclusive
#SBATCH --mail-type=END
#SBATCH --mail-user=salim.bougouffa@kaust.edu.sa
#SBATCH --output=slurm-awk.r05-ipr-%j.err
#SBATCH -t 2-00:00:00

 #module load interproscan/5.59-91.0;
module load  java/11.0.6;

export INTERPROSCAN_DIR=/ibex/scratch/projects/c2022/Analysis2022/sb/apps/interproscan-5.60-92.0v
export PATH=/ibex/scratch/projects/c2022/Analysis2022/sb/apps/interproscan-5.60-92.0:$PATH
export PATH=/ibex/scratch/projects/c2022/Analysis2022/sb/apps/interproscan-5.60-92.0/bin:$PATH

mkdir -p awk.ipr

interproscan.sh \
--output-dir awk.ipr --goterms --pathways --verbose  \
--input awk.hm.all.r05.all.maker.proteins.fasta
