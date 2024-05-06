import pandas as pd

### Get the sample info table read into a pandas data frame (from Eric Anderon's Snakefile)
sample_table=pd.read_table(config_lib2_6frogs["sample_info"], dtype="str").set_index(
    "sample", drop=False
)

### Transfer values from the yaml and tabular config to
### our familiar lists, SAMPLES and CHROMOS
# Populate our SAMPLES list from the sample_table using a little
# pandas syntax
SAMPLES=sample_table["sample"].unique().tolist()

# create dict to retrieve raw files (from Coby McDonald's common.smk)
def get_fastqs(wildcards):
  return {
    "fq2": sample_table.loc[wildcards.sample, "fq2"],
    "fq1": sample_table.loc[wildcards.sample, "fq1"]
  }
