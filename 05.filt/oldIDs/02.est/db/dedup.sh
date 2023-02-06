#!/bin/bash
#SBATCH --qos=c2022
#SBATCH --exclusive
#SBATCH --mem=0
#SBATCH -J Pg_est_dedup
#SBATCH --mail-type=ALL
#SBATCH --mail-user=salim.bougouffa@kaust.edu.sa
#SBATCH --output=slurm-cdhit-dedup-%j.err
#SBATCH -t 4:00:00

module load cdhit/4.6.8;

cd-hit -i est.merged.awk+p10k.fasta -o est.merged.awk+p10k.dedup.fasta -T $SLURM_JOB_CPUS_PER_NODE -M 200000
