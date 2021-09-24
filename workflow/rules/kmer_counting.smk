# Porthmeus
# 23.10.21

# count the kmer occurance for quality control

rule kmer_counting:
    input:
        fwd = "results/trimmed/{sample}_R1_001.fastq.gz",
        rev = "results/trimmed/{sample}_R2_001.fastq.gz"
    output:
        "results/kmer/kmer_{sample}.csv"
    log: "logs/kmer_counting_{sample}.log"
    conda: "../envs/trimming.yaml"
    threads: 8
    shell:
        "jellyfish count -C -m 9 -s 100M --text -o {output} -t {threads} <(gunzip -c {input.fwd}) <(gunzip -c {input.rev}) > {log}"
