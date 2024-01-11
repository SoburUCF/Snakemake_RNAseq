library(pheatmap)

# Load rlog-transformed data
load("data/rld.Rds")

# Extract the rlog matrix
rld_mat <- assay(rld)

# Compute pairwise correlation values
rld_cor <- cor(rld_mat)

# Plot heatmap
pheatmap(rld_cor, filename = "heatmap.pdf")
