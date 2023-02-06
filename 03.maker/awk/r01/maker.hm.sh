#!/bin/bash
#SBATCH -n 200
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=12048
#SBATCH --mail-type=END
#SBATCH --mail-user=salim.bougouffa@kaust.edu.sa
#SBATCH -o slurm-awk-hm-maker-%j.err
#SBATCH -J awk.maker.hm
#SBATCH -t 2-00:00:00
#SBATCH --qos=c2022

export PATH=/ibex/scratch/bougous/kaust_research/babili/millet/apps/mpich-3.3.2/bin/:$PATH
export PATH=/ibex/scratch/bougous/kaust_research/babili/millet/apps/maker-3.01.03/bin/:$PATH
module load augustus/3.3.3/gnu6.4.0
module load perl/5.26.1/gnu-6.4.0

/ibex/scratch/bougous/kaust_research/babili/millet/apps/mpich-3.3.2/bin/mpiexec -hosts=$SLURM_JOB_NODELIST -n 200 /ibex/scratch/bougous/kaust_research/babili/millet/apps/maker-3.01.03/bin/maker -c 1 -base awk_hm -fix_nucleotides  maker_opts_hm.r01.ctl maker_bopts.ctl maker_exe.ctl

###sbatch --mem-per-cpu=10G --cpus-per-task=1 -J maker_awk_r1 -n300 -t 4-00:00:00 --mail-user=salim.bougouffa@kaust.edu.sa --mail-type=END --output=slurm-maker-r01-awk-%j.err --wrap="/ibex/scratch/bougous/kaust_research/babili/millet/apps/mpich-3.3.2/bin/mpiexec -hosts=\$SLURM_JOB_NODELIST -n 300 /ibex/scratch/bougous/kaust_research/babili/millet/apps/maker-3.01.03/bin/maker -c 1 -base awk_maker_r1 -fix_nucleotides  maker_opts_r01.ctl maker_bopts.ctl maker_exe.ctl"
