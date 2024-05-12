#!/bin/bash
#
#SBATCH --job-name=ustacks_array
#SBATCH --output=/scratch/alpine/wcfunk@colostate.edu/Rana_pretiosa/ddrad/results/lib2_6frogs/slurm_logs/ustacks/ustacks_array_%A_%a.out
#SBATCH --error=/scratch/alpine/wcfunk@colostate.edu/Rana_pretiosa/ddrad/results/lib2_6frogs/slurm_logs/ustacks/ustacks_array_%A_%a.err
#SBATCH --mem=89760
#SBATCH --nodes=1
#SBATCH --cpus-per-task=24
#SBATCH --time=7-00:00:00
#SBATCH --qos=long
#SBATCH --mail-user=Chris.Funk@colostate.edu
#SBATCH --mail-type=ALL
#SBATCH --array=1-3
#

eval "$(conda shell.bash hook)"
conda activate stacks-2.65

reads_dir=/scratch/alpine/wcfunk@colostate.edu/Rana_pretiosa/ddrad/results/lib2_6frogs/process_radtags/for_slurm_array/
out=/scratch/alpine/wcfunk@colostate.edu/Rana_pretiosa/ddrad/results/lib2_6frogs/stacks_denovo/ustacks/

file=`ls $reads_dir/*.1.fq.gz | head -n $SLURM_ARRAY_TASK_ID | tail -n 1`

i=$SLURM_ARRAY_TASK_ID

ustacks -f ${file} -p 24 \
-i $i -o $out \
-m 3 -M 2 -d \
-t gzfastq \
--model_type bounded --bound_high 0.05
