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
        mem_mb=90000,
        runtime_min=420,
        cpus=20
    conda:
        "envs/stacks.yaml"
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
	" -t 20)				"
	" 2> {log}				"
