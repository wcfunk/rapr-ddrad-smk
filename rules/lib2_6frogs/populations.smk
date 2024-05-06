# Run populations. Calculate Hardy-Weinberg deviation, population statistics, f-statistics
# export several output files.

rule populations:
    input:
        "results/stacks_denovo/gstacks/catalog.fa.gz",
        "results/stacks_denovo/gstacks/catalog.calls"
    output:
        "results/populations/populations.snps.vcf",
        "results/populations/populations.out",
        "results/populations/populations.err"
    params:
        popmap=config["popmap"],
    resources:
        cpus=24,         
        mem_mb=187200,
        time="24:00:00"
    conda:
        "../envs/stacks.yaml"
    log:
        "results/logs/populations/populations.log"
    shell:
        " (populations				"
        " -P results/stacks_denovo/gstacks/ 	"
        " -O results/populations/ 		"
        " -M {params.popmap}			" 
        " -p 2 -r 0.5 --min-maf 0.1		"
        " --write-random-snp 			"
        " --fstats --hwe --genepop --vcf	"
        " -t 24)				"
        " 2> {log}				"
