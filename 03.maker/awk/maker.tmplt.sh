module purge;
#module load maker/3.01.03;
export PATH=/ibex/scratch/bougous/kaust_research/babili/millet/apps/mpich-3.3.2/bin/:$PATH
export PATH=/ibex/scratch/bougous/kaust_research/babili/millet/apps/maker-3.01.03/bin/:$PATH
module load perl/5.26.1/gnu-6.4.0

sbatch -J maker_ibl_r1_all -N30 -n300 --qos=urg-bougous --time=1-00:00:00 --mail-user=bougous --mail-type=END --output=slurm-maker-r1-ibl.all-%j.err --wrap="/ibex/scratch/bougous/kaust_research/babili/millet/apps/mpich-3.3.2/bin/mpiexec -hosts=\$SLURM_JOB_NODELIST -n 300 /ibex/scratch/bougous/kaust_research/babili/millet/apps/maker-3.01.03/bin/maker -c 1 -base maker_ibl_all_r1 -fix_nucleotides  maker_opts.ctl maker_bopts.ctl maker_exe.ctl"

