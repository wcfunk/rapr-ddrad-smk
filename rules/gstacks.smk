# Build a paired-end contig from the metapopulation data, align reads per sample
# call variant sites in the population, genotypes in each individual.

rule gstacks:
    input:
	directory="results/stacks_denovo"
    output:
	"results/stacks_denovo/catalog.fa.gz",
        "results/stacks_denovo/catalog.calls",
	"results/stacks_denovo/gstacks.out",
	"results/stacks_denovo/gstacks.err"
    conda:
        "envs/stacks.yaml"
    resources:
	cpus=12,
        mem_mb=lambda _, attempt: 54000 + ((attempt - 1) * 2000),
        runtime_min=lambda _, attempt: 100 * (attempt),
    log:
        "results/logs/stacks_denovo/gstacks/gstacks.log"
    shell:
	" (gstacks -P {input.directory} -t 12	"
	" -M data/popmap_lib2_6frogs.tsv)	"
	" -O results/stacks_denovo)		"
	" 2> {log}				"
