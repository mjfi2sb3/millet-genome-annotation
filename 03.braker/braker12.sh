#!/bin/bash
#SBATCH --mem=0
#SBATCH --exclusive
#SBATCH -t 4-00:00:00
#SBATCH --mail-type=END
#SBATCH --mail-user=salim.bougouffa@kaust.edu.sa
#SBATCH --qos=c2022
#SBATCH --output=slurm-braker12-rnaseq_ordthodb-%j.err
#SBATCH -J braker12_rnaseq_orthodb

#module load perl/5.26.1/gnu-6.4.0
#export PATH=/ibex/scratch/bougous/apps/gmes_linux_64_4:$PATH
#export GENEMARK_PATH=/ibex/scratch/bougous/apps/gmes_linux_64_4
#module load augustus/3.3.3/gnu6.4.0 ncbi-blast+/2.8.1/gnu-6.4.0 bzip2/1.0.6;
#export PATH=/ibex/scratch/bougous/apps/ProtHint/bin:$PATH
#export PROTHINT_PATH=/ibex/scratch/bougous/apps/ProtHint/bin
#export PATH=/ibex/scratch/bougous/apps/BRAKER-2.1.6/scripts:$PATH

module load braker/2.1.4

export AUGUSTUS_CONFIG_PATH=/ibex/scratch/projects/c2022/Analysis2022/sb/03.braker/augustus_config

### BRAKER1
braker.pl --species=pearl_millet_rnaseq_orthodb --genome=Awk_v1.fasta.softmasked --overwrite \
--AUGUSTUS_CONFIG_PATH=/ibex/scratch/projects/c2022/Analysis2022/sb/03.braker/augustus_config \
--AUGUSTUS_SCRIPTS_PATH=/ibex/scratch/projects/c2022/Analysis2022/sb/03.braker/augustus_scripts \
--softmasking --workingdir=braker12_rnaseq_orthodb_out --cores $SLURM_JOB_CPUS_PER_NODE \
--prot_seq=orthodb_plants.fa --etpmode \
--prg=gth --ALIGNMENT_TOOL_PATH=/sw/csi/braker/2.1.4/el7.6_gnu6.4.0/dependent_software/gth-1.7.1-Linux_x86_64-64bit/bin/ \
--bam=/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A10/A10_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A11/A11_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A12/A12_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A13/A13_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A14/A14_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A15/A15_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A16/A16_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A17/A17_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A18/A18_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A19/A19_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A1/A1_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A20/A20_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A21/A21_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A22/A22_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A23/A23_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A24/A24_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A25/A25_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A26/A26_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A27/A27_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A28/A28_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A29/A29_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A2/A2_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A30/A30_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A31/A31_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A32/A32_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A3/A3_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A4/A4_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A5/A5_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A6/A6_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A7/A7_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A8/A8_Aligned.sortedByCoord.out.bam,/ibex/scratch/projects/c2022/novogene_PM_rnaseq2022/PMrnaSeq_mappedWithStar_GuessStrand/A9/A9_Aligned.sortedByCoord.out.bam
