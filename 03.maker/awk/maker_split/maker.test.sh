#!/bin/bash
#SBATCH -n 30
#SBATCH -N1
#SBATCH --mem-per-cpu=10G
##SBATCH --mem=0
#SBATCH --mail-type=ALL
#SBATCH --mail-user=salim.bougouffa@kaust.edu.sa
#SBATCH -t 10:00:00
#SBATCH --qos=c2022

export PATH=/ibex/scratch/bougous/kaust_research/babili/millet/apps/mpich-3.3.2/bin/:$PATH
export PATH=/ibex/scratch/bougous/kaust_research/babili/millet/apps/maker-3.01.03/bin/:$PATH
module load augustus/3.3.3/gnu6.4.0
module load perl/5.26.1/gnu-6.4.0

in=$1
pref=${in%.fasta}

/ibex/scratch/bougous/kaust_research/babili/millet/apps/mpich-3.3.2/bin/mpiexec -hosts=$SLURM_JOB_NODELIST -n 10 /ibex/scratch/bougous/kaust_research/babili/millet/apps/maker-3.01.03/bin/maker -tries 1 -c 1 -base ${pref} -g ${in} -fix_nucleotides  maker_opts_test.ctl maker_bopts.ctl maker_exe.ctl

