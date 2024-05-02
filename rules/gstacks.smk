# Build a paired-end contig from the metapopulation data, align reads per sample
# call variant sites in the population, genotypes in each individual.

rule gstacks:
    input:
        "results/stacks_denovo/tsv2bam/{sample}.matches.bam"
    output:
        "results/stacks_denovo/gstacks/catalog.fa.gz",
        "results/stacks_denovo/gstacks/catalog.calls",
        "results/stacks_denovo/gstacks/gstacks.out",
        "results/stacks_denovo/gstacks/gstacks.err"
    params:
        popmap=config["popmap"],
    conda:
        "envs/stacks.yaml"
    resources:
        cpus=12,
        mem_mb=lambda _, attempt: 54000 + ((attempt - 1) * 2000),
        runtime_min=lambda _, attempt: 100 * (attempt),
    log:
        "results/logs/stacks_denovo/gstacks/gstacks.log"
    benchmark:
        "results/benchmarks/stacks_denovo/gstacks/gstacks.bmk"
    shell:
        " (gstacks				"
        " -P results/stacks_denovo/sstacks/	"
        " -O results/stacks_denovo/gstacks/	"
        " -M {params.popmap} -t 12)		"
        " 2> {log}				"
