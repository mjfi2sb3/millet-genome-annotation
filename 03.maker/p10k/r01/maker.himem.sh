#!/bin/bash
#SBATCH --mem=3082240
#SBATCH -n 48
#SBATCH -N1
#SBATCH -t 4-00:00:00
#SBATCH -o slurm-p10k-maker-himem-%j.err
#SBATCH --mail-type=END
#SBATCH --mail-user=salim.bougouffa@kaust.edu.sa
#SBATCH -J p10k_maker_himem
#SBATCH --qos c2022

export PATH=/ibex/scratch/bougous/kaust_research/babili/millet/apps/mpich-3.3.2/bin/:$PATH
export PATH=/ibex/scratch/bougous/kaust_research/babili/millet/apps/maker-3.01.03/bin/:$PATH
module load augustus/3.3.3/gnu6.4.0
module load perl/5.26.1/gnu-6.4.0

/ibex/scratch/bougous/kaust_research/babili/millet/apps/mpich-3.3.2/bin/mpiexec -hosts=$SLURM_JOB_NODELIST -n 48 /ibex/scratch/bougous/kaust_research/babili/millet/apps/maker-3.01.03/bin/maker -g /ibex/scratch/projects/c2022/Analysis2022/sb/03.maker/p10k/P10K_v1.fasta.hardmasked -c 1 -base p10k_himem -fix_nucleotides  maker_opts_r01.ctl maker_bopts.ctl maker_exe.ctl
