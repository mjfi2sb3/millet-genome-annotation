#!/bin/bash
#SBATCH -J busco.p10k
#SBATCH --mem=0
##SBATCH -c 10
#SBATCH --exclusive
#SBATCH --mail-type=END
#SBATCH --mail-user=salim.bougouffa@kaust.edu.sa
#SBATCH --output=slurm-busco.p10k-%j.err
#SBATCH -t 12:00:00


module load busco/5.1.2;
busco -m prot --lineage_dataset poales_odb10 --cpu $SLURM_JOB_CPUS_PER_NODE --out p10k.r05+abinitio.maker -i P10K.hm.all+abinitio.r05+abinitio.all.maker.proteins.fasta
#busco -m prot --lineage_dataset poales_odb10 --cpu $SLURM_JOB_CPUS_PER_NODE --out p10k.r05.augustus -i p10k.augustus.r05.fasta
#busco -m prot --lineage_dataset poales_odb10 --cpu $SLURM_JOB_CPUS_PER_NODE --out p10k.r06.maker -i P10K.hm.all.r06.all.maker.proteins.fasta

#busco -m prot --lineage_dataset poales_odb10 --cpu $SLURM_JOB_CPUS_PER_NODE --out p10k.r05.maker+abinitio -i P10K.hm.all.r05.maker+abinitio.proteins.fasta
#busco -m prot --lineage_dataset poales_odb10 --cpu $SLURM_JOB_CPUS_PER_NODE --out p10k.r05.maker -i P10K.hm.all.r05.all.maker.proteins.fasta
#busco -m prot --lineage_dataset poales_odb10 --cpu $SLURM_JOB_CPUS_PER_NODE --out p10k_maker+abinitio -i p10k.r03.prots.maker+abinitio.fasta
