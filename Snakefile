configfile: "rapr-ddrad-smk/config/rapr.yaml"

include: "rapr-ddrad-smk/rules/common.smk"

include: "rapr-ddrad-smk/rules/clone_filter.smk"

include: "rapr-ddrad-smk/workflow/rules/process_radtags.smk"

# Stacks de novo pipeline
include: "rapr-ddrad-smk/rules/ustacks.smk"
include: "rapr-ddrad-smk/rules/cstacks.smk"
include: "rapr-ddrad-smk/rules/sstacks.smk"
include: "rapr-ddrad-smk/rules/tsv2bam.smk"
include: "rapr-ddrad-smk/rules/gstacks.smk"

include: "rapr-ddrad-smk/rules/populations.smk"
