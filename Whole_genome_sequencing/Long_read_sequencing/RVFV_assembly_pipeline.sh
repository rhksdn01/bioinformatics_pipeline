#!/bin/bash

IDS="ZH548_L ZH548_M ZH548_S"

# 1. genome mapping
for id in $IDS; do
    echo -e "\n[Start genome mapping $id ... ]"
    time bwa mem -t 32 ../../$id.fasta ../barcode14_merge.fastq > ./mapping_$id.sam
done
wait
echo -e "[Completed]" `date` "\n"


# 2. sorting of reads in mapping file
for id in $IDS; do
    echo -e "\n[Start sorting of reads in $id ... ]"
    time samtools sort -O bam -T temp.prefix -o ./mapping_$id.bam ./mapping_$id.sam
    time bedtools genomecov -ibam ./mapping_$id.bam -d > depth_$id.txt
done
wait
echo -e "[Completed]" `date` "\n"


# 3. indexing bam file and fasta file
for id in $IDS; do
    echo -e "\n[Start index and faidx $id ... ]"
    time samtools index ./mapping_$id.bam
done
wait
echo -e "[Completed]" `date` "\n"


# 4. Error correction
for id in $IDS; do
    echo -e "\n[Start error correction about $id ... ]"
    time java -Xmx200G -jar /home/kwkim/anaconda3/envs/genome_tool/share/pilon-1.24-0/pilon.jar --genome ../../$id.fasta --unpaired ./mapping_$id.bam --output ./pilon_$id --fix all --mindepth 2.0 --changes --verbose --threads 16
done
wait
echo -e "[Completed]" `date` "\n"


