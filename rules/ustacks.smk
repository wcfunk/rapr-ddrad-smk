# Build loci de novo in each sample

rule ustacks:
    input:
        R1="results/process_radtags/{sample}.1.fq.gz",
    output:
	tags="results/stacks_denovo/ustacks/{sample}.tags.tsv.gz",	
	snps="results/stacks_denovo/ustacks/{sample}.snps.tsv.gz",
	alleles="results/stacks_denovo/ustacks/{sample}.alleles.tsv.gz",
	out="results/stacks_denovo/ustacks/ustacks_{sample}.out",
	err="results/stacks_denovo/ustacks/ustacks_{sample}.err"
    conda:
        "envs/stacks.yaml"
    resources:
	cpus=10,
        mem_mb=lambda _, attempt: 54000 + ((attempt - 1) * 2000),
        runtime_min=lambda _, attempt: 100 * (attempt),
    log:
        "results/logs/stacks_denovo/ustacks/{sample}.log"
    shell:
	" (ustacks -f {input.R1}			"
	" -o results/stacks_denovo/ustacks/		"
	" -m 3 -M 2 -d -t gzfastq -p 10			"
	" --model_type bounded --bound_high 0.05)	"
	"  2> {log}					"
