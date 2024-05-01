import pandas as pd

### Get the sample info table read into a pandas data frame
sample_table=pd.read_table(config["sample_info"], dtype="str").set_index(
    "sample", drop=False
)

### Transfer values from the yaml and tabular config to
### our familiar list
# Populate our SAMPLES list from the sample_table using a little
# pandas syntax
SAMPLES=sample_table["sample"].unique().tolist()

### Input Functins that use the tabular sample_info
# define a function to get the fastq path from the sample_table. This
# returns it as a dict, so we need to unpack it in the rule
def get_fastqs(wildcards):
  return {
    "fq2": libs.loc[wildcards.lib, "fq2"],
    "fq1": libs.loc[wildcards.lib, "fq1"]
  }

### Specify rule "all"
# By default, Snakemake tries to create the input files needed
# for the first rule in the Snakefile, so we define the first
# rule to ask for results/stacks_denovo/populations.snps.vcf
rule all:
  input: "results/populations/populations.snps.vcf"
