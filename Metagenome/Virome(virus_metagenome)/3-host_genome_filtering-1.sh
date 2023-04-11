#!/bin/bash
# host genome(Human) filtering

samples="16M-HYU002 16M-HYU001 16M-CBU002 16M-CAU021 16M-CAU012 16M-CAU011 18M-SNU021 18M-SNU020 18M-SNU019 18M-SNU016 18M-SNU015 18M-SNU014 18M-SNU011 18M-SNU007 16M-CAU009 18M-SNU006 18M-SNU005 18M-SNU004 18M-SNU003 18M-SNU002 18M-SNU001 18M-PHR006 18M-KHU005 18M-CBU003 18M-CAU003 16M-CAU008 16M-SNU066 16M-SNU063 16M-SNU044 16M-SNU043 16M-SNU041 16M-SNU040 16M-SNU026 16M-SNU018 16M-SNU014 16M-SNU001 16M-CAU005 16M-CAU001"


# host genome filtering
for sp in $samples; do
    echo -e "\n[host genome filtering $sp ... ]"
    time /home/exeman/bowtie2/bowtie2 --sensitive-local --thread 32 -x /var3/users_data/KwanwooKim/Metagenome/virome/human_DB/hg38 -U /var3/users_data/KwanwooKim/Metagenome/Lungvirome_data/02_merge_data/${sp}_merge.fastq.assembled.fastq --un /var3/users_data/KwanwooKim/Metagenome/Lungvirome_data/03_host_genome_filtering/${sp}_filtered.fastq -S /var3/users_data/KwanwooKim/Metagenome/Lungvirome_data/03-1_host_genome_data/${sp}_aligned.sam
    echo -e "\n[host genome filtering done $sp ... ]"
done
wait
echo -e "[Completed]" `date` "\n"
