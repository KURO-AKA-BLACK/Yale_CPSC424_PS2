#!/bin/bash

#SBATCH --partition=cpsc424
#SBATCH --cpus-per-task=20
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=4:00:00
#SBATCH --mem-per-cpu=5000
#SBATCH --job-name=collapse
#SBATCH --output=%x-%j.out

module load intel
make mand_collapse
export OMP_NUM_THREADS=4
export OMP_SCHEDULE=static,10
./mand_collapse
export OMP_SCHEDULE=dynamic
./mand_collapse
export OMP_SCHEDULE=guided
./mand_collapse
export OMP_NUM_THREADS=10
export OMP_SCHEDULE=static,10
./mand_collapse
export OMP_SCHEDULE=dynamic
./mand_collapse
export OMP_SCHEDULE=guided
./mand_collapse
export OMP_NUM_THREADS=20
export OMP_SCHEDULE=static,10
./mand_collapse
export OMP_SCHEDULE=dynamic
./mand_collapse
export OMP_SCHEDULE=guided
./mand_collapse