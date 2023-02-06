#!/bin/bash
#SBATCH -n 120
#SBATCH -N3
#SBATCH --cpus-per-task=1
#SBATCH --mem=0
#SBATCH -t 1-00:00:00
#SBATCH --reserv TESTING

export PATH=/ibex/scratch/bougous/kaust_research/babili/millet/apps/mpich-3.3.2/bin/:$PATH
export PATH=/ibex/scratch/bougous/kaust_research/babili/millet/apps/maker-3.01.03/bin/:$PATH
module load augustus/3.3.3/gnu6.4.0
module load perl/5.26.1/gnu-6.4.0

in=$1
pref=${in%.fasta}

/ibex/scratch/bougous/kaust_research/babili/millet/apps/mpich-3.3.2/bin/mpiexec -hosts=$SLURM_JOB_NODELIST -n 120 /ibex/scratch/bougous/kaust_research/babili/millet/apps/maker-3.01.03/bin/maker -c 1 -base p10k_${pref} -g ${in} -fix_nucleotides  maker_opts.ctl maker_bopts.ctl maker_exe.ctl

