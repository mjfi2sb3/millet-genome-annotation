#!/bin/bash
#SBATCH -J busco.awk.r05
#SBATCH --mem=0
#SBATCH -c 10
##SBATCH --exclusive
#SBATCH --mail-type=END
#SBATCH --mail-user=salim.bougouffa@kaust.edu.sa
#SBATCH --output=slurm-busco.awk-%j.err
#SBATCH -t 12:00:00


module load busco/5.1.2;

busco -m prot --lineage_dataset poales_odb10 --cpu $SLURM_JOB_CPUS_PER_NODE --out awk.r05.augustus -i awk.augustus.r05.fasta
#awk.hm.all.r06.all.maker.proteins.fasta
#busco -m prot --lineage_dataset poales_odb10 --cpu $SLURM_JOB_CPUS_PER_NODE --out awk.r06.maker -i awk.hm.all.r06.all.maker.proteins.fasta
#busco -m prot --lineage_dataset poales_odb10 --cpu $SLURM_JOB_CPUS_PER_NODE --out awk.r05.maker+abinitio -i awk.hm.all.r05.maker+abinitio.proteins.fasta
#busco -m prot --lineage_dataset poales_odb10 --cpu $SLURM_JOB_CPUS_PER_NODE --out awk.r05.maker -i awk.hm.all.r05.all.maker.proteins.fasta

#busco -m prot --lineage_dataset poales_odb10 --cpu $SLURM_JOB_CPUS_PER_NODE --out awk -i awk.hm.all.r03.all.maker.proteins.fasta
#busco -m prot --lineage_dataset poales_odb10 --cpu $SLURM_JOB_CPUS_PER_NODE --out awk_maker+abinitio -i awk.r03.prots.maker+abinitio.fasta
