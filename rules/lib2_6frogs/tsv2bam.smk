# Transpose the data so it is stored by locus, instead of by sample. We will include
# paired-end reads using tsv2bam.

rule tsv2bam:
    input:
        "results/lib2_6frogs/stacks_denovo/sstacks/{sample}.matches.tsv.gz"
    output:
        "results/lib2_6frogs/stacks_denovo/tsv2bam/{sample}.matches.bam",
        "results/lib2_6frogs/stacks_denovo/tsv2bam/{sample}.out",
        "results/lib2_6frogs/stacks_denovo/tsv2bam/{sample}.err"
    params:
        popmap=config["popmap"],
    conda:
        "stacks-2.65"
    resources:
        cpus=10,
        mem_mb=37400,
        time="24:00:00"
    log:
        "results/lib2_6frogs/logs/stacks_denovo/tsv2bam/{sample}.log"
    benchmark:
        "results/lib2_6frogs/benchmarks/stacks_denovo/tsv2bam/{sample}.bmk"
    shell:
        " (tsv2bam				"
        " -P results/lib2_6frogs/stacks_denovo/sstacks/	"
        " -o results/lib2_6frogs/stacks_denovo/tsv2bam/	"    
        " -R results/lib2_6frogs/process_radtags/   	"
        " -M {params.popmap} -t 10) 		"
        " 2> {log}				"
