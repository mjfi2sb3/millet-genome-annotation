#!/usr/bin/env python3
import subprocess
import re, sys

#keys=dict[]
with open("map.txt") as mapping:
	keys = dict(x.strip().split(" ") for x in mapping)
	#for l in mapping:
	#	print(l)
		

gff=sys.argv[1]

with open(gff) as f:
	for line in f:
		for word, replacement in keys.items():
			
			if word in line:
				#print(f"{word} :: {line}")
				line = re.sub(word, replacement, line)
				break
			else:
				pass
		print(line.strip())
