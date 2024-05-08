# Build a paired-end contig from the metapopulation data, align reads per sample
# call variant sites in the population, genotypes in each individual.

rule gstacks:
    input:
        expand("results/lib2_6frogs/stacks_denovo/tsv2bam/{s}.matches.bam", s=SAMPLES)
    output:
        "results/lib2_6frogs/stacks_denovo/gstacks/catalog.fa.gz",
        "results/lib2_6frogs/stacks_denovo/gstacks/catalog.calls",
        "results/lib2_6frogs/stacks_denovo/gstacks/gstacks.out",
        "results/lib2_6frogs/stacks_denovo/gstacks/gstacks.err"
    params:
        popmap=config["popmap"],
    conda:
       "../../envs/stacks.yaml"
    resources:
        cpus=24,
        mem=89760,
        time="24:00:00"
    log:
        "results/lib2_6frogs/logs/stacks_denovo/gstacks/gstacks.log"
    benchmark:
        "results/lib2_6frogs/benchmarks/stacks_denovo/gstacks/gstacks.bmk"
    shell:
        " (gstacks				"
        " -P results/lib2_6frogs/stacks_denovo/tsv2bam/	"
        " -O results/lib2_6frogs/stacks_denovo/gstacks/	"
        " -M {params.popmap} -t 24)		"
        " 2> {log}				"
