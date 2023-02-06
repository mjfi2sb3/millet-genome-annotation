#!/bin/bash
#

in="../05.interproscan/awk.ipr/awk.all.ipr.gff3"
awk -F"\t" '$0 !~ /^#/ && $3=="protein_match" {print $1}' ${in}|sort|uniq
