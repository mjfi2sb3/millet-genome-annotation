#!/bin/bash
#SBATCH -J ipr.p10k.r5.abinitio
##SBATCH -a 1-93409
#SBATCH -c 1
##SBATCH -t 1:00:00
#SBATCH --mem=5g
#SBATCH --mail-type=END
#SBATCH --mail-user=salim.bougouffa@kaust.edu.sa
#SBATCH --output=ipr_out/slurm-p10k-abinitio-%A_%a.err
##SBATCH -c 2022

module load gcc/6.4.0 java/11.0.6 perl/5.30.0;
export PATH=/ibex/scratch/projects/c2022/Analysis2022/sb/apps/interproscan-5.60-92.0/:$PATH
export PATH=/ibex/scratch/projects/c2022/Analysis2022/sb/apps/interproscan-5.60-92.0/bin:$PATH

`sed -n ${SLURM_ARRAY_TASK_ID}p commands.txt`
