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
		keepIDs[line.split("-mRNA")[0]] = 0
		#keepIDs = IDs.read().splitlines()
	#print(keepIDs)
		
#sys.exit(0)
gff=sys.argv[1]


gffIDs=dict()
with open(gff) as f:
	for line in f:
		if not re.match(r'^#',line):
			cols = line.split("\t")
			if cols[1] == "maker" and cols[2] == "gene":
				geneID=cols[8].split(";")[2].split("Alias=")[1]
				gffIDs[geneID] = 0


#print(gffIDs)
#sys.exit(0)

for currentID in keepIDs.keys():
	if currentID in gffIDs:
		print(f'{currentID} --> YES')
	else:
		print(f'{currentID} --> NO')
