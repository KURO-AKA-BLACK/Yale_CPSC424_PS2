#!/bin/bash

#SBATCH --partition=cpsc424
#SBATCH --cpus-per-task=20
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=4:00:00
#SBATCH --mem-per-cpu=5000
#SBATCH --job-name=task_part_one
#SBATCH --output=%x-%j.out

module load intel
make mandomptasks_part_one
export OMP_NUM_THREADS=1
./mandomptasks_part_one
./mandomptasks_part_one
./mandomptasks_part_one
export OMP_NUM_THREADS=2
./mandomptasks_part_one
./mandomptasks_part_one
./mandomptasks_part_one
export OMP_NUM_THREADS=4
./mandomptasks_part_one
./mandomptasks_part_one
./mandomptasks_part_one
export OMP_NUM_THREADS=10
./mandomptasks_part_one
./mandomptasks_part_one
./mandomptasks_part_one
export OMP_NUM_THREADS=20
./mandomptasks_part_one
./mandomptasks_part_one
./mandomptasks_part_one