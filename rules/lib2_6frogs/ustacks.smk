# Build loci de novo in each sample

rule ustacks:
    input:
        R1="results/lib2_6frogs/process_radtags/{sample}.1.fq.gz",
    output:
        tags="results/lib2_6frogs/stacks_denovo/ustacks/{sample}.tags.tsv.gz",	
        snps="results/lib2_6frogs/stacks_denovo/ustacks/{sample}.snps.tsv.gz",
        alleles="results/lib2_6frogs/stacks_denovo/ustacks/{sample}.alleles.tsv.gz"
    conda:
        "stacks-2.65"
    resources:
        cpus=10,
        mem_mb=37400,
        time="24:00:00"
    log:
        "results/lib2_6frogs/logs/stacks_denovo/ustacks/{sample}.log"
    benchmark:
        "results/lib2_6frogs/benchmarks/stacks_denovo/ustacks/{sample}.bmk"
    shell:
        " (ustacks -f {input.R1}			"
        " -o results/lib2_6frogs/stacks_denovo/ustacks/		"
        " -m 3 -M 2 -d -t gzfastq -p 10			"
        " --model_type bounded --bound_high 0.05)	"
        "  2> {log}					"
