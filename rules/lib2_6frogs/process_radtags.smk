# Clean reads (already demultiplexed by sequencing facility)

rule process_radtags:
    input:
        in1="results/lib2_6frogs/clone_filter/{sample}_1.1.fq.gz",
        in2="results/lib2_6frogs/clone_filter/{sample}_2.2.fq.gz",
    output:
        R1extraones="results/lib2_6frogs/process_radtags/{sample}_1.1.1.fq.gz",
        R1rem="results/lib2_6frogs/process_radtags/{sample}_1.1.rem.1.fq.gz",
        R2extratwos="results/lib2_6frogs/process_radtags/{sample}_2.2.2.fq.gz",
        R2rem="results/lib2_6frogs/process_radtags/{sample}_2.2.rem.2.fq.gz"
    conda:
        "-p /projects/wcfunk@colostate.edu/mambaforge/envs/stacks-2.65"
    params:
        enz1= config["process_radtags"]["enzyme1"],
        enz2= config["process_radtags"]["enzyme2"],
    resources:
        cpus=10,
        mem_mb=37400,
        time="12:00:00"
    log:
        "results/lib2_6frogs/logs/process_radtags/{sample}.log"
    benchmark:
        "results/lib2_6frogs/benchmarks/process_radtags/{sample}.bmk"
    shell:
        " (process_radtags -i gzfastq --threads 10  "
        " -1 {input.in1} -2 {input.in2}  "
        " -o results/lib2_6frogs/process_radtags/  "
        " --renz-1 {params.enz1} --renz-2 {params.enz2}  "
        " -c -q -r) 2> {log}  "
