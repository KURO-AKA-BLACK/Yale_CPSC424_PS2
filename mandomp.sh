#!/bin/bash

#SBATCH --partition=cpsc424
#SBATCH --cpus-per-task=20
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=4:00:00
#SBATCH --mem-per-cpu=5000
#SBATCH --job-name=mandomp
#SBATCH --output=%x-%j.out

module load intel
make mandompts
make mandseq

./mandseq
./mandseq
./mandseq
export OMP_NUM_THREADS=1
./mandompts
./mandompts
./mandompts
export OMP_NUM_THREADS=2
./mandompts
./mandompts
./mandompts
export OMP_NUM_THREADS=4
./mandompts
./mandompts
./mandompts
export OMP_NUM_THREADS=10
./mandompts
./mandompts
./mandompts
export OMP_NUM_THREADS=20
./mandompts
./mandompts
./mandompts