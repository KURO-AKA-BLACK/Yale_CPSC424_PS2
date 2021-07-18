#!/bin/bash

#SBATCH --partition=cpsc424
#SBATCH --cpus-per-task=1
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=4:00:00
#SBATCH --mem-per-cpu=5000
#SBATCH --job-name=mandseq
#SBATCH --output=%x-%j.out

module load intel
make clean
make mandseq
./mandseq
./mandseq
./mandseq
