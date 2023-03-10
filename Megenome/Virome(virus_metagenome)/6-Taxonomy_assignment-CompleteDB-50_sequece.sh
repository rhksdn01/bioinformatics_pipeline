#!/bin/bash
# Taxonomy assignment

samples="16M-CAU006 16M-CAU007 16M-CAU010 16M-CAU011 16M-SNU054 16M-SNU055 16M-SNU056 16M-SNU057 16M-SNU058 16M-SNU059 16M-SNU061 16M-SNU065 16M-SNU067 16M-SNU068 16M-SNU069 16M-SNU071 16M-SNU072 16M-SNU073 16M-SNU074 17M-CAU001 17M-CAU005 17M-CBU001 17M-CBU002 17M-CBU003 17M-CBU004 17M-SNU003 17M-SNU004 17M-SNU005 17M-SNU006 17M-SNU008 17M-SNU010 17M-SNU012 17M-SNU014 17M-SNU015 17M-SNU016 17M-SNU017 17M-SNU020 17M-SNU021 17M-SNU022 17M-SNU024 17M-SNU025 18M-BSN001 18M-CAU003 18M-CBU002 18M-KBU004 18M-PHR002 18M-PHR004 18M-PHR005 18M-SNU001 18M-SNU003 18M-SNU004 18M-SNU006 18M-SNU007 18M-SNU008 18M-SNU011 18M-SNU015 18M-SNU017 18M-SNU018 18M-SNU019"


# viral Taxonomy assignment
for sp in $samples; do
    echo -e "\n[viral Taxonomy assignment $sp ... ]"
    time cat  /var3/users_data/KwanwooKim/Metagenome/astha_virome_draft_ver3/5-1_50coverage_blastn/16M-CAU006_complete_blast_sequence_final.txt |awk -F '\t' '{print $9}'|sort |uniq > /var3/users_data/KwanwooKim/Metagenome/astha_virome_draft_ver3/6-1_50coverage-Taxonomy/${sp}_Custom_completeDB_list.txt
    time cat /var3/users_data/KwanwooKim/Metagenome/astha_virome_draft_ver3/5-1_50coverage_blastn/${sp}_blastn_completeDB_result_IF.txt |awk '{print $9}'|sort |uniq| while read a;do grep $a /var3/users_data/KwanwooKim/Metagenome/astha_virome_draft_ver3/5-viral_blastn-CustomCompleteDB/${sp}_blastn_CustomCompleteDB_result.txt| wc -l; done > /var3/users_data/KwanwooKim/Metagenome/astha_virome_draft_ver3/6-1_50coverage-Taxonomy/${sp}_completeDB_count.txt
    paste /var3/users_data/KwanwooKim/Metagenome/astha_virome_draft_ver3/6-1_50coverage-Taxonomy/${sp}_Custom_completeDB_list.txt /var3/users_data/KwanwooKim/Metagenome/astha_virome_draft_ver3/6-1_50coverage-Taxonomy/${sp}_completeDB_count.txt > /var3/users_data/KwanwooKim/Metagenome/astha_virome_draft_ver3/6-1_50coverage-Taxonomy/${sp}_completeDB_list_count.txt

done
wait
echo -e "[Completed]" `date` "\n"
