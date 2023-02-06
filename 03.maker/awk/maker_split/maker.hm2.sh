#!/bin/bash
#SBATCH -n 100
#SBATCH --ntasks-per-node=20
#SBATCH --mem-per-cpu=25G
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=END
#SBATCH --mail-user=salim.bougouffa@kaust.edu.sa
#SBATCH -t 1-00:00:00
##SBATCH --reserv TESTING
#SBATCH --qos=c2022
#salloc -N4 -n 80 --ntasks-per-node=20 -t 20 --qos=c2022 --mem=0

export PATH=/ibex/scratch/bougous/kaust_research/babili/millet/apps/mpich-3.3.2/bin/:$PATH
export PATH=/ibex/scratch/bougous/kaust_research/babili/millet/apps/maker-3.01.03/bin/:$PATH
module load augustus/3.3.3/gnu6.4.0
module load perl/5.26.1/gnu-6.4.0

in=$1
pref=${in%.fasta}

/ibex/scratch/bougous/kaust_research/babili/millet/apps/mpich-3.3.2/bin/mpiexec -hosts=$SLURM_JOB_NODELIST -n 100 /ibex/scratch/bougous/kaust_research/babili/millet/apps/maker-3.01.03/bin/maker -c 1 -base ${pref} -g ${in} -fix_nucleotides  maker_opts.ctl maker_bopts.ctl maker_exe.ctl

