# Remove PCR and optical duplicates and trim degenerate barcode

rule clone_filter:
    input:
        unpack(get_fastqs)
    output:
        "results/lib2_6frogs/clone_filter/{sample}_1.1.fq.gz",
        "results/lib2_6frogs/clone_filter/{sample}_2.2.fq.gz"
    resources:
        cpus=1,
        mem_mb=3740,
        time="12:00:00"
    conda:
        "../envs/stacks.yaml",
    log:
        "results/lib2_6frogs/logs/clone_filter/{sample}.log"
    benchmark:
        "results/lib2_6frogs/benchmarks/clone_filter/{sample}.bmk"
    shell:
        " (clone_filter -i gzfastq                "
        "       -1 {input.fq1} -2 {input.fq2}     "
        "       --inline-null --oligo-len-1 10    "
        "       -o results/lib2_6frogs/clone_filter/) 2> {log} "
