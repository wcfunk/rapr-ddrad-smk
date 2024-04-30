configfile: "config/rapr.yaml"

include: "workflow/rules/common.smk"

include: "workflow/rules/clone_filter.smk"

include: "workflow/rules/process_radtags.smk"

# Stacks de novo pipeline
include: "workflow/rules/ustacks.smk"
include: "workflow/rules/cstacks.smk"
include: "workflow/rules/sstacks.smk"
include: "workflow/rules/tsv2bam.smk"
include: "workflow/rules/gstacks.smk"

include: "workflow/rules/populations.smk"
