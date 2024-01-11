#Import Required packages
library(tidyverse)
library(DESeq2)
library(ggplot2)

# Load data from input files
data <- read.table("data/Mov10_full_counts.txt", header=T, row.names=1)
meta <- read.table("data/Mov10_full_meta.txt", header=T, row.names=1)

# Check sample name consistency
stopifnot(all(colnames(data) == rownames(meta)))

# Create DESeq2Dataset object
dds <- DESeqDataSetFromMatrix(countData = data, colData = meta, design = ~ sampletype)

# Estimate size factors
dds <- estimateSizeFactors(dds)

# Transform counts for data visualization
rld <- rlog(dds, blind=TRUE)

# Plot PCA
pca_plot <- plotPCA(rld, intgroup="sampletype")

# Save PCA plot to PDF
ggsave("pca.pdf", plot = pca_plot, width = 8, height = 6)
