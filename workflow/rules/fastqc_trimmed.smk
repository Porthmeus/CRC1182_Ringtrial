# Porthmeus
# 23.10.19

# create fastqc reports for all trimmed samples

rule fastqc_trimmed:
    input:
        fastq = "results/trimmed/{sample}.fastq.gz"
    output:
        data = "results/trimmed/{sample}_fastqc.zip",
        html = "results/trimmed/{sample}_fastqc.html"
    conda:
        "../envs/trimming.yaml"
    params:
        outdir = "results/trimmed/",
    threads: 8
    log:
        "logs/fastqc_trimmed_{sample}.log"
    shell:
        "fastqc {input.R1} {input.R2} -o {params.outdir} -t {threads} &> {log}"
