#!/bin/bash
#

#log_dir="/data/dragon/kamauaa/output/test_sleep_v02";
log_dir=${PWD}/slurmlog;
#input_file_name=/data/dragon/othoumgk/microbial/test_data/Input.part-${SLURM_ARRAY_TASK_ID};
output_file_name=${log_dir}/${SLURM_ARRAY_TASK_ID}.out;
log_file_name=${output_file_name}.log;
#job_file_name=/data/dragon/kamauaa/scripts/slurm/some_job_file.txt;
job_file_name=jobsfile.txt;

#module load ncbi-blast+;
/home/cbrc-aamg/AAMG2/bin/idempotence_wrapper.sh eval `head -n${SLURM_ARRAY_TASK_ID} ${job_file_name}|tail -n1` ${log_file_name};
