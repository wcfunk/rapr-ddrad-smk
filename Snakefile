configfile: "config/config.yaml"

include: "rules/common.smk"

include: "rules/clone_filter.smk"

include: "rules/process_radtags.smk"
include: "rules/rename_fastqs.smk"

# Stacks de novo pipeline
include: "rules/ustacks.smk"
include: "rules/cstacks.smk"
include: "rules/sstacks.smk"
include: "rules/tsv2bam.smk"
include: "rules/gstacks.smk"

include: "rules/populations.smk"
