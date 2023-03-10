#!/bin/bash
# viral blastn

samples="16M-HYU002 16M-HYU001 16M-CBU002 16M-CAU021 16M-CAU012 16M-CAU011 18M-SNU021 18M-SNU020 18M-SNU019 18M-SNU016 18M-SNU015 18M-SNU014 18M-SNU011 18M-SNU007 16M-CAU009 18M-SNU006 18M-SNU005 18M-SNU004 18M-SNU003 18M-SNU002 18M-SNU001 18M-PHR006 18M-KHU005 18M-CBU003 18M-CAU003 16M-CAU008 16M-SNU066 16M-SNU063 16M-SNU044 16M-SNU043 16M-SNU041 16M-SNU040 16M-SNU026 16M-SNU018 16M-SNU014 16M-SNU001 16M-CAU005 16M-CAU001"


# viral blastn
for sp in $samples; do
    echo -e "\n[Lenth cutoff 100 $sp ... ]"
    time java -jar /var3/users_data/KwanwooKim/pipeline/Trimmomatic/Trimmomatic-0.39/trimmomatic-0.39.jar SE -threads 32 -phred33 /var3/users_data/KwanwooKim/Metagenome/Lungvirome_data/03_host_genome_filtering/${sp}_filtered.fastq /var3/users_data/KwanwooKim/Metagenome/Lungvirome_data/04-lencut100/${sp}_filtered_lencut100.fastq MINLEN:100
    echo -e "\n[Lenth cutoff 100 done $sp ... ]"
done
wait
echo -e "[Completed]" `date` "\n"
