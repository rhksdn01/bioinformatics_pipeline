#!/bin/bash
# result

Control="16M-SNU004 16M-SNU071 16M-SNU072 16M-SNU073 16M-SNU074 17M-SNU003 17M-SNU004 17M-SNU005 17M-SNU006 17M-SNU008 17M-SNU010 18M-SNU001 18M-SNU003 18M-SNU004 18M-SNU006 18M-SNU007 18M-SNU008"
NonSevere="16M-CAU010 16M-CAU011 16M-SNU007 16M-SNU055 16M-SNU056 16M-SNU058 16M-SNU061 17M-CAU005 17M-SNU012 17M-SNU015 17M-SNU016 17M-SNU017 17M-SNU020 17M-SNU022 18M-SNU011 18M-SNU015 18M-SNU017 18M-SNU018 18M-SNU019 16M-CAU006 17M-SNU014"
Severe="17M-CAU001 17M-CBU003 17M-SNU024 18M-KBU004 16M-CAU007 16M-SNU054 16M-SNU057 16M-SNU059 16M-SNU065 16M-SNU067 16M-SNU068 16M-SNU069 17M-CBU001 17M-CBU002 17M-CBU004 17M-SNU021 17M-SNU025 18M-CAU003 18M-CBU002 18M-PHR002 18M-PHR004 18M-PHR005 18M-BSN001"



# Control
for Con in $Control; do
    echo -e "\n[Control sample $Con ... ]"
    time sed -e "s/^/${Con}\t/;s/^/Control\t/" /var3/users_data/KwanwooKim/Metagenome/astha_virome_draft_ver3/5-1_50coverage_blastn/${Con}_complete_blast_sequence_final-1.txt > /var3/users_data/KwanwooKim/Metagenome/astha_virome_draft_ver3/6-2_50coverage-Taxonomy_sequence/${Con}_completeDB_group_sequence.txt

done
wait
echo -e "[Con Completed]" `date` "\n"

# Non-Severe
for NonS in $NonSevere; do
    echo -e "\n[NonSevere sample $NonS ... ]"
    time sed -e "s/^/${NonS}\t/;s/^/NonSevere\t/" /var3/users_data/KwanwooKim/Metagenome/astha_virome_draft_ver3/5-1_50coverage_blastn/${NonS}_complete_blast_sequence_final-1.txt > /var3/users_data/KwanwooKim/Metagenome/astha_virome_draft_ver3/6-2_50coverage-Taxonomy_sequence/${NonS}_completeDB_group_sequence.txt

done
wait
echo -e "[NonS Completed]" `date` "\n"


# Severe
for Sev in $Severe; do
    echo -e "\n[Severe sample $Sev ... ]"
    time sed -e "s/^/${Sev}\t/;s/^/Severe\t/" /var3/users_data/KwanwooKim/Metagenome/astha_virome_draft_ver3/5-1_50coverage_blastn/${Sev}_complete_blast_sequence_final-1.txt > /var3/users_data/KwanwooKim/Metagenome/astha_virome_draft_ver3/6-2_50coverage-Taxonomy_sequence/${Sev}_completeDB_group_sequence.txt

done
wait
echo -e "[Sev Completed]" `date` "\n"
