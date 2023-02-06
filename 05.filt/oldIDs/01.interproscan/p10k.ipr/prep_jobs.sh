#!/bin/bash
#




for i in P10K.hm.all+abinitio.r05+abinitio.all.maker.proteins.fasta.split/*; do
	p=`basename $i`; p=${p%.fasta};
	echo "interproscan.sh -b ipr_out/${p} -i $i";
done > commands.txt
