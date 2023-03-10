#!/bin/bash

IDS="barcode13 barcode14 barcode15 barcode16 barcode17 barcode18"

# 0. trimming and filtering
# porechop -i barcode17_merge.fastq -o barcode17_trim.fastq &&
# NanoFilt -q 8 -l 1200 barcode17_trim.fastq > barcode17_trim_F.fastq &&

# 1. genome mapping
for id in $IDS; do
    echo -e "\n[Start genome mapping $id ... ]"
    time bwa mem -t 32 /home/kwkim/MinION/220212_alpha/genome_assemble/HCoV_229E.fasta /home/kwkim/MinION/220212_alpha/genome_assemble/$id/merge_$id.fastq > /home/kwkim/MinION/220212_alpha/genome_assemble/&id/mapping_$id.sam
done
wait
echo -e "[Completed]" `date` "\n"


# 2. sorting of reads in mapping file
for id in $IDS; do
    echo -e "\n[Start sorting of reads in $id ... ]"
    time samtools sort -O bam -T temp.prefix -o /home/kwkim/MinION/220212_alpha/genome_assemble/$id/mapping_$id.bam /home/kwkim/MinION/220212_alpha/genome_assemble/&id/mapping_$id.sam
    time bedtools genomecov -ibam /home/kwkim/MinION/220212_alpha/genome_assemble/&id/mapping_$id.bam -d > /home/kwkim/MinION/220212_alpha/genome_assemble/&id/depth_$id.txt
done
wait
echo -e "[Completed]" `date` "\n"


# 3. indexing bam file and fasta file
for id in $IDS; do
    echo -e "\n[Start index and faidx $id ... ]"
    time samtools index /home/kwkim/MinION/220212_alpha/genome_assemble/$id/mapping_$id.bam
    time samtools flagstat /home/kwkim/MinION/220212_alpha/genome_assemble/&id/mapping_$id.bam > /home/kwkim/MinION/220212_alpha/genome_assemble/&id/mapping_report_$id.txt
done
wait
echo -e "[Completed]" `date` "\n"


# 4. Error correction
for id in $IDS; do
    echo -e "\n[Start error correction about $id ... ]"
    time java -Xmx200G -jar /home/kwkim/anaconda3/envs/genome_tool/share/pilon-1.24-0/pilon.jar --genome /home/kwkim/MinION/220212_alpha/genome_assemble/HCoV_229E.fasta --unpaired /home/kwkim/MinION/220212_alpha/genome_assemble/&id/mapping_$id.bam --output /home/kwkim/MinION/220212_alpha/genome_assemble/&id/pilon_$id --fix all --mindepth 2.0 --changes --verbose --threads 32
done
wait
echo -e "[Completed]" `date` "\n"


