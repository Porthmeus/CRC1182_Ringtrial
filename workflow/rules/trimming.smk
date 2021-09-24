# Porthmeus
# 23.10.19

rule trimming:
    input:
        R1 = "resources/raw/{sample}_R1_{tail}.fastq.gz",
        R2 = "resources/raw/{sample}_R2_{tail}.fastq.gz",
        adapter = adapter # defined in the snakefile
    output:
        R1 = "results/trimmed/{sample}_R1_{tail}.fastq.gz",
        R2 = "results/trimmed/{sample}_R2_{tail}.fastq.gz",
        R1_up = temp("results/trimmed/UP_{sample}_R1_{tail}.fastq.gz"),
        R2_up = temp("results/trimmed/UP_{sample}_R2_{tail}.fastq.gz")
    log:
        "logs/trimming/{sample}_{tail}_trimmomatic.log"
    conda:
        "../envs/trimming.yaml"
    threads: 8
    resources:
        walltime = "3",
        mem = "16" 
    shell:
        "trimmomatic PE {input.R1} {input.R2} {output.R1} {output.R1_up} {output.R2} {output.R2_up} ILLUMINACLIP:{input.adapter}:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36 -threads {threads} > {log}"
