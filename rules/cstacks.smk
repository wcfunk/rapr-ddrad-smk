# Build the catalog of loci available in the metapopulation from the samples contained
# in the population map.

rule cstacks:
    input:
	"results/stacks_denovo/ustacks/"
    output:
	"results/stacks_denovo/catalog.tags.tsv.gz",
	"results/stacks_denovo/catalog.snps.tsv.gz",
	"results/stacks_denovo/catalog.alleles.tsv.gz",
	"results/stacks_denovo/catalog.sample_list.tsv.gz"
	"results/stacks_denovo/cstacks.out",
	"results/stacks_denovo/cstacks.err"
    conda:
        "envs/stacks.yaml"
    resources:
	cpus=24,
        mem_mb=lambda _, attempt: 54000 + ((attempt - 1) * 2000),
        runtime_min=lambda _, attempt: 100 * (attempt),
    log:
        "results/logs/stacks_denovo/cstacks/cstacks.log"
    shell:
	" (cstacks -P {input.directory} -p 24	"
	" -M data/popmap_lib2_6frogs.tsv	"
	" -n 3) 2> {log}			"
