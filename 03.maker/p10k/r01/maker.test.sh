#!/bin/bash
#SBATCH -n 20
#SBATCH --cpus-per-task=1
##SBATCH --mem-per-cpu=10G
#SBATCH --mail-type=END
#SBATCH --mail-user=salim.bougouffa@kaust.edu.sa
#SBATCH -o slurm-test-hm-maker-%j.err
#SBATCH -J test.maker.hm
#SBATCH -t 20:00

export PATH=/ibex/scratch/bougous/kaust_research/babili/millet/apps/mpich-3.3.2/bin/:$PATH
export PATH=/ibex/scratch/bougous/kaust_research/babili/millet/apps/maker-3.01.03/bin/:$PATH
module load augustus/3.3.3/gnu6.4.0
module load perl/5.26.1/gnu-6.4.0

/ibex/scratch/bougous/kaust_research/babili/millet/apps/mpich-3.3.2/bin/mpiexec -hosts=$SLURM_JOB_NODELIST -n 20 /ibex/scratch/bougous/kaust_research/babili/millet/apps/maker-3.01.03/bin/maker -c 1 -base test_10m_hm -fix_nucleotides -g test.10m.fa  maker_opts_hm.r01.ctl maker_bopts.ctl maker_exe.ctl

###sbatch --mem-per-cpu=10G --cpus-per-task=1 -J maker_p10k_r1 -n300 -t 4-00:00:00 --mail-user=salim.bougouffa@kaust.edu.sa --mail-type=END --output=slurm-maker-r01-p10k-%j.err --wrap="/ibex/scratch/bougous/kaust_research/babili/millet/apps/mpich-3.3.2/bin/mpiexec -hosts=\$SLURM_JOB_NODELIST -n 300 /ibex/scratch/bougous/kaust_research/babili/millet/apps/maker-3.01.03/bin/maker -c 1 -base awk_maker_r1 -fix_nucleotides  maker_opts_r01.ctl maker_bopts.ctl maker_exe.ctl"
