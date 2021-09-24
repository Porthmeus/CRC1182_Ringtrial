# Porthmeus
# 24.09.21

# simply combine the kmer table into a matrix
log <- file(snakemake@log[[1]], open = "wt")
sink(log)
sink(log, type = "message")

require(data.table)

files = snakemake@input[[1]]

mat <- fread(files[1], skip=1)
nm <- strsplit(basename(files[1]),split = "-")[[1]][1]
colnames(mat)[2] <- nm

for(f in files[-1]){
    nm <- strsplit(basename(f),split = "-")[[1]][1]
    dt = fread(f, skip=1)
    colnames(dt)[2] <- nm
    mat <- merge(mat,dt,by="V1", all = TRUE)
}

colnames(mat)[1] <- "kmer"

write.csv(mat, file = snakemake@output[[1]], row.names = FALSE)
