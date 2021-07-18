#!/bin/bash

#SBATCH --partition=cpsc424
#SBATCH --cpus-per-task=20
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=4:00:00
#SBATCH --mem-per-cpu=5000
#SBATCH --job-name=parallel
#SBATCH --output=%x-%j.out

module load intel
make mandompts_parallel
export OMP_NUM_THREADS=20
./mandompts_parallel
./mandompts_parallel
./mandompts_parallel
./mandompts_parallel
./mandompts_parallel
./mandompts_parallel
./mandompts_parallel
./mandompts_parallel