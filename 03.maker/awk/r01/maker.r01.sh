#!/bin/bash

#module purge;
#module load maker/3.01.03;
export PATH=/ibex/scratch/bougous/kaust_research/babili/millet/apps/mpich-3.3.2/bin/:$PATH
export PATH=/ibex/scratch/bougous/kaust_research/babili/millet/apps/maker-3.01.03/bin/:$PATH
module load perl/5.26.1/gnu-6.4.0

sbatch --qos=urg-bougous -J maker_awk_r1 -n512 -t 1-00:00:00 --mail-user=salim.bougouffa@kaust.edu.sa --mail-type=END --output=slurm-maker-r01-awk-%j.err --wrap="/ibex/scratch/bougous/kaust_research/babili/millet/apps/mpich-3.3.2/bin/mpiexec -hosts=\$SLURM_JOB_NODELIST -n 512 /ibex/scratch/bougous/kaust_research/babili/millet/apps/maker-3.01.03/bin/maker -c 1 -base awk_maker_r1 -fix_nucleotides  maker_opts_r01.ctl maker_bopts.ctl maker_exe.ctl"



## 15 NODES
sbatch --mem=0 --qos=urg-bougous -J maker_awk_r1 -N 15 -n300 -t 4-00:00:00 --mail-user=salim.bougouffa@kaust.edu.sa --mail-type=END --output=slurm-maker-r01-awk-%j.err --wrap="/ibex/scratch/bougous/kaust_research/babili/millet/apps/mpich-3.3.2/bin/mpiexec -hosts=\$SLURM_JOB_NODELIST -n 300 /ibex/scratch/bougous/kaust_research/babili/millet/apps/maker-3.01.03/bin/maker -c 1 -base awk_maker_r1 -fix_nucleotides  maker_opts_r01.ctl maker_bopts.ctl maker_exe.ctl"

## ONE NODE
sbatch --mem=0 --qos=urg-bougous -J maker_awk_r1_N1 -N1 -n128 -t 4-00:00:00 --mail-user=salim.bougouffa@kaust.edu.sa --mail-type=END --output=slurm-maker-r01-N1-awk-%j.err --wrap="module load trnascan-se/2.0/el7_gnu6.4.0; /ibex/scratch/bougous/kaust_research/babili/millet/apps/mpich-3.3.2/bin/mpiexec -hosts=\$SLURM_JOB_NODELIST -n 128 /ibex/scratch/bougous/kaust_research/babili/millet/apps/maker-3.01.03/bin/maker -c 1 -base awk_maker_r1_N1 -fix_nucleotides  maker_opts_r01.ctl maker_bopts.ctl maker_exe.ctl"

