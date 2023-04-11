#!/bin/bash
# viral blastn

samples="16M-HYU002 16M-HYU001 16M-CBU002 16M-CAU021 16M-CAU012 16M-CAU011 18M-SNU021 18M-SNU020 18M-SNU019 18M-SNU016 18M-SNU015 18M-SNU014 18M-SNU011 18M-SNU007 16M-CAU009 18M-SNU006 18M-SNU005 18M-SNU004 18M-SNU003 18M-SNU002 18M-SNU001 18M-PHR006 18M-KHU005 18M-CBU003 18M-CAU003 16M-CAU008 16M-SNU066 16M-SNU063 16M-SNU044 16M-SNU043 16M-SNU041 16M-SNU040 16M-SNU026 16M-SNU018 16M-SNU014 16M-SNU001 16M-CAU005 16M-CAU001"


# viral blastn
for sp in $samples; do
    echo -e "\n[host viral blastn $sp ... ]"
    time seqtk seq -a /var3/users_data/KwanwooKim/Metagenome/Lungvirome_data/04-lencut100/${sp}_filtered_lencut100.fastq > /var3/users_data/KwanwooKim/Metagenome/Lungvirome_data/04-lencut100/${sp}_filtered_lencut100.fasta
    time blastn -query /var3/users_data/KwanwooKim/Metagenome/Lungvirome_data/04-lencut100/${sp}_filtered_lencut100.fasta -db /var3/users_data/KwanwooKim/Metagenome/virome/virome_DB/custom_complete_DB/excluded_complete_DB.fasta -outfmt '6 qseqid sseqid pident qcovs evalue staxids scomnames sskingdoms stitle' -evalue 1e-10 -best_hit_score_edge 0.1 -best_hit_overhang 0.1 -max_target_seqs 1 -num_threads 32 -out /var3/users_data/KwanwooKim/Metagenome/Lungvirome_data/05-viral_blastn-ComDB/${sp}_blastn_CustomCompleteDB_result.txt
    echo -e "\n[complete viral DB blastn done $sp ... ]"
done
wait
echo -e "[Completed]" `date` "\n"
