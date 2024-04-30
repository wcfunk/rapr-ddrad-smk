configfile: "rapr-ddrad-smk/config/rapr.yaml"

include: "rapr-ddrad-smk/workflow/rules/common.smk"

include: "rapr-ddrad-smk/workflow/rules/clone_filter.smk"

include: "rapr-ddrad-smk/workflow/rules/process_radtags.smk"

# Stacks de novo pipeline
include: "rapr-ddrad-smk/workflow/rules/ustacks.smk"
include: "rapr-ddrad-smk/workflow/rules/cstacks.smk"
include: "rapr-ddrad-smk/workflow/rules/sstacks.smk"
include: "rapr-ddrad-smk/workflow/rules/tsv2bam.smk"
include: "rapr-ddrad-smk/workflow/rules/gstacks.smk"

include: "rapr-ddrad-smk/workflow/rules/populations.smk"
