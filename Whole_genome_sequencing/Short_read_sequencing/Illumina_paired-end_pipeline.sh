#!/bin/bash

IDS="barcode01"

# 1. genome mapping
for id in $IDS; do
    echo -e "\n[Start genome mapping $id ... ]"
    time bwa mem -t 32 /home/kwkim/genome_assemble/SFTSV/ref-seq/$id.fasta 004_SFTSV_isolation04_final_R1.fastq 004_SFTSV_isolation04_final_R2.fastq > ./mapping_$id.sam
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
    time samtools flagstat mapping_$id.bam > mapping_$id_report.txt
done
wait
echo -e "[Completed]" `date` "\n"

:<<END
# 4. Error correction
for id in $IDS; do
    echo -e "\n[Start error correction about $id ... ]"
    time java -Xmx200G -jar /home/kwkim/anaconda3/envs/genome_tool/share/pilon-1.24-0/pilon.jar --genome ../HCoV_229E.fasta --unpaired ./mapping_$id.bam --output ./pilon_$id --fix all --mindepth 2.0 --changes --verbose --threads 32
done
wait
echo -e "[Completed]" `date` "\n"
END

