# Remove extra 1s and 2s from sample name suffix

rule suffix_trim:
    input:
        "{sample}_1.1.1.fq.gz"
    output:
        "{sample}.1.fq.gz"
    shell:
        "mv {input} {output}"
