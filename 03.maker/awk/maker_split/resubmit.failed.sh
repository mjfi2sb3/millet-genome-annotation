#!/bin/bash
#
#


myAcc="awk"
round="r06"

c=`squeue -ubougous --noheader -o %i|wc -l`

while [ "$c" -gt 0 ]; do
	r=`squeue -ubougous -tr --noheader -o %i|wc -l`
	if [ "$r" -eq 0 ]; then
		sleep 600
		c=`squeue -ubougous --noheader -o %i|wc -l`
		continue;
	fi
	for jobid in `squeue -ubougous -tr --noheader -o %i`;do

		#slurm=`ls slurm_out/slurm*${jobid}*.err`
		slurm=`scontrol show jobid=${jobid} --oneliner | awk '{print $60}'| awk -F"=" '{print $2}'`

		if [ ! -f "$slurm" ]; then
			continue;
		fi

		echo "Looking at $slurm ..."
		if grep -q ERROR "${slurm}"; then
			echo "$jobid FAILED"
			jn=`squeue -j ${jobid} --noheader -o %j`
			fasta=$jn".fasta"
			
			if [ -f "$fasta" ]; then
				echo "cancel $jobid"
				scancel $jobid
				echo "resubmit ${fasta}"
				sbatch -J ${jn} -o slurm_out/slurm-${round}-${jn}-%j.err maker.hm.sh $fasta
			else
				echo "$fasta not found here. skipping."
			fi
		else
			echo "$jobid is good"

		fi

	done
	sleep 600
	c=`squeue -ubougous --noheader -o %i|wc -l`
done
