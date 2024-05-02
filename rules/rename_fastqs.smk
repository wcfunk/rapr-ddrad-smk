# Remove extra 1s and 2s from end of fastq files

rule rename_fastqs:
    input:
	R1extraones="results/process_radtags/{sample}_1.1.1.fq.gz",
	R2extratwos="results/process_radtags/{sample}_2.2.2.fq.gz"
    output:
        R1="results/process_radtags/{sample}.1.fq.gz",
	R2="results/process_radtags/{sample}.2.fq.gz"
    shell:
        "cp {input} {output}"
