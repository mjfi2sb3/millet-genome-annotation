
## awk
maker_map_ids --prefix "PgAWc|" --suffix . --abrv_gene G --abrv_tran G --iterate 1 --justify 6 awk.hm.all.r05+abinitio.gff > awk.map.txt
cat awk.map.txt|awk -F"[-_]" '{print $0"\t|"$2}' |sed 's#\t|Pg#|#g' |awk -F"|" '{print $1"0"$3"01"$2}' > awk.map2.txt
sed -i 's#PgAWc0Un#PgAWcUn#g' awk.map2.txt
## p10k
maker_map_ids --prefix "PgP10c|" --suffix . --abrv_gene G --abrv_tran G --iterate 1 --justify 6 P10K.hm.all+abinitio.r05+abinitio.gff > p10k.map.txt
cat p10k.map.txt|awk -F"[-_]" '{print $0"\t|"$2}' |sed 's#\t|Pg#|#g' |awk -F"|" '{print $1"0"$3"01"$2}' > p10k.map2.txt
sed -i 's#PgP10c0Un#PgP10cUn#g' p10k.map2.txt
