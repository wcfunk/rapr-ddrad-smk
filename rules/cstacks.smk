# Build the catalog of loci available in the metapopulation from the samples contained
# in the population map.

rule cstacks:
    input:
	tags="results/stacks_denovo/ustacks/{sample}.tags.tsv.gz",	
	snps="results/stacks_denovo/ustacks/{sample}.snps.tsv.gz",
	alleles="results/stacks_denovo/ustacks/{sample}.alleles.tsv.gz"
    output:
	"results/stacks_denovo/cstacks/catalog.tags.tsv.gz",
	"results/stacks_denovo/cstacks/catalog.snps.tsv.gz",
	"results/stacks_denovo/cstacks/catalog.alleles.tsv.gz",
	"results/stacks_denovo/cstacks/catalog.sample_list.tsv.gz",
	"results/stacks_denovo/cstacks/cstacks.out",
	"results/stacks_denovo/cstacks/cstacks.err"
    params:
        popmap=config["popmap"],
    conda:
        "envs/stacks.yaml"
    resources:
	cpus=24,
        mem_mb=lambda _, attempt: 54000 + ((attempt - 1) * 2000),
        runtime_min=lambda _, attempt: 100 * (attempt),
    log:
        "results/logs/stacks_denovo/cstacks/cstacks.log"
    shell:
	" (cstacks				"
	" -P results/stacks_denovo/ustacks/	"
	" -o results/stacks_denovo/cstacks/	"
	" -M {params.popmap}			"
	" -n 3 -p 24) 2> {log}			"
