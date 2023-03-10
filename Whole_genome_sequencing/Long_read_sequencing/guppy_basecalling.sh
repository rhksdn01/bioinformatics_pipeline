#! /bin/bash
IDS="barcode01 barcode02 barcode03 barcode04 barcode05 barcode06 barcode07 barcode08 barcode09 barcode10 barcode11 barcode12 barcode13 barcode14 barcode15 barcode16 barcode17 barcode18 barcode19 barcode20 barcode21  barcode22 barcode23 barcode24"
# 1. nanopore GPU Guppy basecalling
for id in $IDS; do
    echo -e "\n[Start Guppy high basecalling $id ... ]"
    time guppy_basecaller -c dna_r9.4.1_450bps_hac.cfg --input_path /home/MinION/fast5/fast5_pass/$id --save_path /home/MinION/fastq/high_basecalling/$id -x auto --qscore_filtering --min_qscore 7 
done
wait
echo -e "[Complete Guppy basecalling]" `date` "\n"

# 2. complete basecalling move
for id in $IDS; do
    mv /home/MinION/fastq/high_basecalling/$id /home/MinION/fastq/complete_basecalling/$id
done
wait
echo -e "[Moving Completed]" `date` "\n"

# 3. make merge basecalling directory
for id in $IDS; do
    mkdir /home/MinION/Analysis/$id
done

# 4. merging fastq format
for id in $IDS; do
    cat /home/MinION/fastq/complete_basecalling/$id/pass/*.fastq > /home/MinION/Analysis/$id/merge_$id.fastq
done
wait
echo -e "[complete merging fastq files]" `date` "\n"
