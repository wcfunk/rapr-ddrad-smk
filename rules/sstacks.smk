# Run sstacks. Match all samples supplied in the population map against the catalog.

rule sstacks:
    input:
	"results/stacks_denovo/cstacks/catalog.tags.tsv.gz",
	"results/stacks_denovo/cstacks/catalog.snps.tsv.gz",
	"results/stacks_denovo/cstacks/catalog.alleles.tsv.gz",
	"results/stacks_denovo/cstacks/catalog.sample_list.tsv.gz"
    output:
	"results/stacks_denovo/sstacks/{sample}.matches.tsv.gz",
	"results/stacks_denovo/sstacks/sstacks.out",
	"results/stacks_denovo/sstacks/sstacks.err"
    conda:
        "envs/stacks.yaml"
    resources:
	cpus=24,
        mem_mb=lambda _, attempt: 54000 + ((attempt - 1) * 2000),
        runtime_min=lambda _, attempt: 100 * (attempt),
    log:
        "results/logs/stacks_denovo/sstacks/sstacks.log"
    shell:
	" (sstacks -P {input.directory} -p 24	"
	" -M data/popmap_lib2_6frogs.tsv)	"
	" -o results/stacks_denovo/sstacks/	"
	" 2> {log}				"
