# Build the catalog of loci available in the metapopulation from the samples contained
# in the population map.

rule cstacks:
    input:
        expand("results/lib2_6frogs/stacks_denovo/ustacks/{s}.tags.tsv.gz", s=SAMPLES),	
        expand("results/lib2_6frogs/stacks_denovo/ustacks/{s}.snps.tsv.gz", s=SAMPLES),
        expand("results/lib2_6frogs/stacks_denovo/ustacks/{s}.alleles.tsv.gz", s=SAMPLES)
    output:
        "results/lib2_6frogs/stacks_denovo/cstacks/catalog.tags.tsv.gz",
        "results/lib2_6frogs/stacks_denovo/cstacks/catalog.snps.tsv.gz",
        "results/lib2_6frogs/stacks_denovo/cstacks/catalog.alleles.tsv.gz",
        "results/lib2_6frogs/stacks_denovo/cstacks/catalog.sample_list.tsv.gz",
        "results/lib2_6frogs/stacks_denovo/cstacks/cstacks.out",
        "results/lib2_6frogs/stacks_denovo/cstacks/cstacks.err"
    params:
        popmap=config["popmap"],
    conda:
        "stacks-2.65"
    resources:
        cpus=24,
        mem_mb=89760,
        time="24:00:00"
    log:
        "results/lib2_6frogs/logs/stacks_denovo/cstacks/cstacks.log"
    benchmark:
        "results/lib2_6frogs/benchmarks/stacks_denovo/cstacks/cstacks.bmk"
    shell:
        " (cstacks				"
        " -P results/lib2_6frogs/stacks_denovo/ustacks/	"
        " -o results/lib2_6frogs/stacks_denovo/cstacks/	"
        " -M {params.popmap}			"
        " -n 3 -p 24) 2> {log}			"
