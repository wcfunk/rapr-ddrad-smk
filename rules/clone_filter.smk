# Remove PCR and optical duplicates and trim degenerate barcode

rule clone_filter:
    input:
        unpack(get_fastqs)
    output:
        "results/clone_filter/{sample}_1.1.fq.gz",
        "results/clone_filter/{sample}_2.2.fq.gz"
    resources:
        cpus=1,
        mem_mb=15000,
        runtime_min=lambda _, attempt: 840 * (attempt),
    conda:
        "envs/stacks.yaml",
    log:
        "results/logs/clone_filter/{sample}.log"
    shell:
        "(clone_filter -i gzfastq -1 {input.fq1} -2 {input.fq2} --inline_null --oligo_len_2 10 -o results/clone_filter/) 2> {log}"
     
        " (clone_filter -i gzfastq                "
        "       -1 {input.fq1} -2 {input.fq2}     "
        "       --inline-null --oligo-len-1 10    "
        "       -o results/clone_filter/) 2> {log} "

