# Run sstacks. Match all samples supplied in the population map against the catalog.

rule sstacks:
    input:
	directory="results/stacks_denovo"
    output:
	"results/stacks_denovo/{sample}.matches.tsv.gz",
	"results/stacks_denovo/sstacks.out",
	"results/stacks_denovo/sstacks.err"
    conda:
        "envs/stacks.yaml"
    resources:
	cpus=24,
        mem_mb=lambda _, attempt: 54000 + ((attempt - 1) * 2000),
        runtime_min=lambda _, attempt: 100 * (attempt),
    log:
        "results/logs/stacks_denovo/sstacks/{sample}.log"
    shell:
	" (sstacks -P {input.directory} -p 24	"
	" -M data/popmap_lib2_6frogs.tsv)	"
	" 2> {log}				"
