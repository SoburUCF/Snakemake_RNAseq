# Define the overall goal of the workflow:
rule all:
    # Specify the final outputs that the workflow should produce:
    input:
        "pca.pdf",  # PCA plot
        "heatmap.pdf"  # Heatmap

# Rule for generating the PCA plot:
rule pca:
    # Inputs required for PCA:
    input:
        counts="data/Mov10_full_counts.txt",  # Raw count data
        meta="meta/Mov10_full_meta.txt"  # Sample metadata
    # Output file for the PCA plot:
    output:
        "pca.pdf"
    # R script containing the PCA code:
    script:
        "scripts/pca.R"

# Rule for generating the heatmap:
rule heatmap:
    # Input file containing rlog-transformed data:
    input:
        rld="data/rld.Rds"  # Saved from the DESeq2 rule
    # Output file for the heatmap:
    output:
        "heatmap.pdf"
    # R script containing the heatmap code:
    script:
        "scripts/heatmap.R"

# Rule for performing DESeq2 analysis and generating rlog-transformed data:
rule deseq2:
    # Inputs required for DESeq2 analysis:
    input:
        counts="data/Mov10_full_counts.txt",  # Raw count data
        meta="meta/Mov10_full_meta.txt"  # Sample metadata
    # Output file for the rlog-transformed data:
    output:
        rld="data/rld.Rds"  # Saved for reusability in other rules
    # R script containing the DESeq2 code:
    script:
        "scripts/deseq2.R"
