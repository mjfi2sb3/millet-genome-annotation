#!/usr/bin/env python3
#

import re

gff="awk.hm.all.r05.gff"
estEV="awk_prots_with_est_ev.txt"
homoEV="awk_prots_with_homo_ev.txt"

with open(estEV, 'w') as est:
	with open(homoEV, 'w') as homo:
		with open(gff) as f:
			for l in f:
				cols=l.split("\t")
				if not re.match(r'^#', l) or len(cols)==9:
					if cols[2] == "mRNA":
						#print(cols[2])
						col9cols=cols[8].split(";")
						aed=float(col9cols[3].split("=")[1])
						if aed <= 0.75:
							if re.match( r'_QI', col9cols[5]):
								#print(col9cols[5])
								QIs=col9cols[5].split("|")
								## proteins with EST support
								if float(QIs[1])>0 or float(QIs[2])>0:
									#print(f'{col9cols[5].strip()}: {QIs[1]} <=> {QIs[2]}')
									est.write(f'{col9cols[0].split("=")[1]}\n')
									#pass
								elif float(QIs[3]) > 0:
									#print(f'{col9cols[5].strip()}: {col9cols[3]} <=> {QIs[2]} <=> {QIs[3]}')
									homo.write(f'{col9cols[0].split("=")[1]}\n')
									#pass
							#break
						else: # aed>0.75
							print(f'SKIP {col9cols[0].split("=")[1]}: AED={aed} <><> {col9cols[5].strip()}')
