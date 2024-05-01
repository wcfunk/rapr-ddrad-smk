# Transpose the data so it is stored by locus, instead of by sample. We will include
# paired-end reads using tsv2bam.

rule tsv2bam:
    input:
	directory="results/stacks_denovo"
    output:
	"results/stacks_denovo/{sample}.matches.bam",
	"results/stacks_denovo/tsv2bam.out",
	"results/stacks_denovo/tsv2bam.err"
    conda:
        "envs/stacks.yaml"
    resources:
	cpus=12,
        mem_mb=lambda _, attempt: 54000 + ((attempt - 1) * 2000),
        runtime_min=lambda _, attempt: 100 * (attempt),
    log:
        "results/logs/stacks_denovo/tsv2bam/tsv2bam.log"
    shell:
	" (tsv2bam -P {input.directory} -t 12	"
	" -M data/popmap_lib2_6frogs.tsv	"
	" -R results/process_radtags/)		"
	" 2> {log}				"
