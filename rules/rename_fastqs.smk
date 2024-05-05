# Remove extra 1s and 2s from end of fastq files

rule rename_fastqs:
    input:
        R1extraones="results/process_radtags/{sample}_1.1.1.fq.gz",
        R2extratwos="results/process_radtags/{sample}_2.2.2.fq.gz"
    output:
        R1="results/process_radtags/{sample}.1.fq.gz",
        R2="results/process_radtags/{sample}.2.fq.gz"
    resources:
        cpus=10,
        mem_mb=90000,
        runtime_min=lambda _, attempt: 420 + ((attempt - 1) * 60),
    log:
        "results/logs/rename_fastqs/{sample}.log"
    benchmark:
        "results/benchmarks/rename_fastqs/{sample}.bmk"
    shell:
        "mv {input} {output}"
