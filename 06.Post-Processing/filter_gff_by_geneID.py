#!/usr/bin/env python3
import subprocess
import re, sys

if len(sys.argv)<3:
	print(f'\n\n\t\tpython3 {sys.argv[0]} maker_gff_file.gff protein_ids_2keep_one_per_line.txt\n\n')
	sys.exit(0)

idsFile=sys.argv[2]

keepIDs=dict()
with open(idsFile) as IDs:
	for line in IDs.readlines():
		keepIDs[line.split(".")[0]] = 0
		#keepIDs = IDs.read().splitlines()
	#print(keepIDs)
		

gff=sys.argv[1]

gffHCout=gff+".HC"
gffLCout=gff+".LC"
gffEVout=gff+".EV"

with open(gffHCout, 'w') as hc:
	hc.write("##gff-version 3\n")
with open(gffLCout, 'w') as lc:
	lc.write("##gff-version 3\n")
with open(gffEVout, 'w') as ev:
	ev.write("")

with open(gff) as f:
	with open(gffHCout, 'a') as hc:
		with open(gffLCout, 'a') as lc:
			with open(gffEVout, 'a') as ev:			
				for line in f:
					if not re.match(r'^#',line):
						cols = line.split("\t")
						if cols[1] =="maker":
							geneID=cols[8].split(";")[0].split("ID=")[1].split(".")[0]
							if geneID in keepIDs:
								#print(f'{cols[2]} yes" {geneID}')
								hc.write(line)
							else:
								lc.write(line)
						elif cols[1] ==".":
							hc.write(line)
							lc.write(line)
							ev.write(line)
						else:
							ev.write(line)

					else:
						#hc.write(line)
						#lc.write(line)
						ev.write(line)

