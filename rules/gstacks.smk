# Build a paired-end contig from the metapopulation data, align reads per sample
# call variant sites in the population, genotypes in each individual.

rule gstacks:
    input:
        expand("results/stacks_denovo/tsv2bam/{s}.matches.bam", s=SAMPLES)
    output:
        "results/stacks_denovo/gstacks/catalog.fa.gz",
        "results/stacks_denovo/gstacks/catalog.calls",
        "results/stacks_denovo/gstacks/gstacks.out",
        "results/stacks_denovo/gstacks/gstacks.err"
    params:
        popmap=config["popmap"],
    conda:
        "../envs/stacks.yaml"
    resources:
        cpus=24,
        mem=187200,
        time="24:00:00"
    log:
        "results/logs/stacks_denovo/gstacks/gstacks.log"
    benchmark:
        "results/benchmarks/stacks_denovo/gstacks/gstacks.bmk"
    shell:
        " (gstacks				"
        " -P results/stacks_denovo/tsv2bam/	"
        " -O results/stacks_denovo/gstacks/	"
        " -M {params.popmap} -t 24)		"
        " 2> {log}				"
