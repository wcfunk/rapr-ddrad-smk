# Transpose the data so it is stored by locus, instead of by sample. We will include
# paired-end reads using tsv2bam.

rule tsv2bam:
    input:
        "results/stacks_denovo/sstacks/{sample}.matches.tsv.gz"
    output:
        "results/stacks_denovo/sstacks/{sample}.matches.bam",
        "results/stacks_denovo/sstacks/tsv2bam_{sample}.out",
        "results/stacks_denovo/sstacks/tsv2bam_{sample}.err"
    params:
        popmap=config["popmap"],
    conda:
        "envs/stacks.yaml"
    resources:
        cpus=12,
        mem_mb=lambda _, attempt: 54000 + ((attempt - 1) * 2000),
        runtime_min=lambda _, attempt: 100 * (attempt),
    log:
        "results/logs/stacks_denovo/tsv2bam/{sample}.log"
    benchmark:
        "results/benchmarks/stacks_denovo/tsv2bam/{sample}.bmk"
    shell:
        " (tsv2bam				"
        " -P results/stacks_denovo/sstacks/	"
        " -R results/process_radtags/   	"
        " -M {params.popmap} -t 12) 		"
        " 2> {log}				"
