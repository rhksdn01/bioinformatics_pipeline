#!/bin/bash

# 0.input data   genome mapping

read -p "what is your reference sequence? " reference

read -p "what is your Raw data? " Raw

read -p "what is your sample name? " name

# 0-0. trimming and filtering
# porechop -i barcode17_merge.fastq -o barcode17_trim.fastq &&
# NanoFilt -q 8 -l 1200 barcode17_trim.fastq > barcode17_trim_F.fastq &&

# 1. Indexing reference genome 

echo -e "\n[reference sequence indexing $reference ... ]"
time bwa index /home/MinION/reference/$reference.fasta
wait

echo -e "[Completed]" `date` "\n"

# 2. genome mapping

echo -e "\n[Start genome mapping $name ... ]"
time bwa mem -t 32 /home/MinION/reference/$reference.fasta /home/MinION/$name/$Raw.fastq > /home/MinION/$name/$name.sam
wait

echo -e "[Completed]" `date` "\n"


# 3. sorting of reads in mapping file
echo -e "\n[Start sorting of reads in $name.sam ... ]"
time samtools sort -O bam -T temp.prefix -o /home/MinION/$name/$name.bam /home/MinION/$name/$name.sam
time bedtools genomecov -ibam /home/MinION/$name/$name.bam -d > /home/MinION/$name/depth.txt
wait

echo -e "[Completed]" `date` "\n"


# 4. indexing bam file and fasta file
echo -e "\n[Start index and faidx $name.bam ... ]"
    time samtools index /home/MinION/$name/$name.bam
    time samtools flagstat /home/MinION/$name/$name.bam > /home/MinION/$name/mapping_report.txt
wait

echo -e "[Completed]" `date` "\n"


# 5. Error correction
echo -e "\n[Start error correction about $name.bam ... ]"
time java -Xmx200G -jar /home/MinION/anaconda3/envs/pipeline/share/pilon-1.24-0/pilon.jar --genome /home/MinION/reference/$reference.fasta --unpaired /home/MinION/$name/$name.bam --output /home/MinION/$name/pilon_$name --fix all --mindepth 2.0 --changes --verbose --threads 32
wait

echo -e "[Completed]" `date` "\n"



