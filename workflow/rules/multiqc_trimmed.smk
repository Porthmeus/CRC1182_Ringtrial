# Porthmeus
# 23.10.21

# summarize the fastqc results after trimming


rule multiqc_trimming:
    input:
        expand("results/trimmed/{sample}", 
                sample = [x.replace(".fastq.gz","_fastqc.zip") for x in list(sampleFiles["R1"].append(sampleFiles["R2"]))]
            )
    output: 
        "results/QC/multiqc_trimming.html"
    log: "logs/multiqc_trimming.log"
    conda: "../envs/timming.yaml"
    shell:
        "multiqc --file-list {input} -n {output} > {log}"
