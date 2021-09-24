# Porthmeus
# 23.09.21

# merge the kmer counts to one matrix

import os

files = [x.split("_R1_")[0] for x in list(sampleFiles["R1"])]

rule kmerCounts2Matrix:
    input:
        expand("results/kmer/kmer_{sample}.csv", sample = files)
    output:
        "results/kmer/kmer_matrix.csv"
    log: "logs/kmerCounts2Matrix.log"
    conda: "../envs/trimming.yaml"
    threads: 1
    script: "../scripts/kmerCounts2Matrix.R"
