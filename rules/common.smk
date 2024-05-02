import pandas as pd

### Get the sample info table read into a pandas data frame (from Eric Anderon's Snakefile)
sample_table=pd.read_table(config["sample_info"], dtype="str").set_index(
    "sample", drop=False
)

# create dict to retrieve raw files (from Coby McDonald's common.smk)
def get_fastqs(wildcards):
  return {
    "fq2": sample_table.loc[wildcards.sample, "fq2"],
    "fq1": sample_table.loc[wildcards.sample, "fq1"]
  }

### Specify rule "all" (from Eric Anderson's Snakefile)
# By default, Snakemake tries to create the input files needed
# for the first rule in the Snakefile, so we define the first
# rule to ask for results/populations/populations.snps.vcf
rule all:
  input: "results/populations/populations.snps.vcf"
