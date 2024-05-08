# Run sstacks. Match all samples supplied in the population map against the catalog.

rule sstacks:
    input:
        "results/lib2_6frogs/stacks_denovo/cstacks/catalog.tags.tsv.gz",
        "results/lib2_6frogs/stacks_denovo/cstacks/catalog.snps.tsv.gz",
        "results/lib2_6frogs/stacks_denovo/cstacks/catalog.alleles.tsv.gz",
        "results/lib2_6frogs/stacks_denovo/cstacks/catalog.sample_list.tsv.gz"
    output:
        "results/lib2_6frogs/stacks_denovo/sstacks/{sample}.matches.tsv.gz",
        "results/lib2_6frogs/stacks_denovo/sstacks/{sample}.out",
        "results/lib2_6frogs/stacks_denovo/sstacks/{sample}.err"
    params:
        popmap=config["popmap"],
    conda:
       "../../envs/stacks.yaml"
    resources:
        cpus=10,
        mem_mb=37400,
        time="24:00:00"
    log:
        "results/lib2_6frogs/logs/stacks_denovo/sstacks/{sample}.log"
    benchmark:
        "results/lib2_6frogs/benchmarks/stacks_denovo/sstacks/{sample}.bmk"
    shell:
        " (sstacks				"
        " -P results/lib2_6frogs/stacks_denovo/cstacks/	"
        " -o results/lib2_6frogs/stacks_denovo/sstacks/     "
        " -M {params.popmap} -p 10)		"
        " 2> {log}				"
