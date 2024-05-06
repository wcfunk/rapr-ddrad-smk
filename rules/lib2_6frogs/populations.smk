# Run populations. Calculate Hardy-Weinberg deviation, population statistics, f-statistics
# export several output files.

rule populations:
    input:
        "results/lib2_6frogs/stacks_denovo/gstacks/catalog.fa.gz",
        "results/lib2_6frogs/stacks_denovo/gstacks/catalog.calls"
    output:
        "results/lib2_6frogs/populations/populations.snps.vcf",
        "results/lib2_6frogs/populations/populations.out",
        "results/lib2_6frogs/populations/populations.err"
    params:
        popmap=config["popmap"],
    resources:
        cpus=24,         
        mem_mb=89760,
        time="24:00:00"
    conda:
        "../../envs/stacks.yaml"
    log:
        "results/lib2_6frogs/logs/populations/populations.log"
    shell:
        " (populations				"
        " -P results/lib2_6frogs/stacks_denovo/gstacks/ 	"
        " -O results/lib2_6frogs/populations/ 		"
        " -M {params.popmap}			" 
        " -p 2 -r 0.5 --min-maf 0.1		"
        " --write-random-snp 			"
        " --fstats --hwe --genepop --vcf	"
        " -t 24)				"
        " 2> {log}				"
