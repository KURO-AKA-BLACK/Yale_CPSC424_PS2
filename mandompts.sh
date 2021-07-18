#!/bin/bash

#SBATCH --partition=cpsc424
#SBATCH --cpus-per-task=20
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=4:00:00
#SBATCH --mem-per-cpu=5000
#SBATCH --job-name=mandompts
#SBATCH --output=%x-%j.out

module load intel
make mandompts
export OMP_NUM_THREADS=2
export OMP_SCHEDULE=static,1
./mandompts
export OMP_SCHEDULE=static,10
./mandompts
export OMP_SCHEDULE=dynamic
./mandompts
export OMP_SCHEDULE=dynamic,250
./mandompts
export OMP_SCHEDULE=guided
./mandompts
export OMP_NUM_THREADS=4
export OMP_SCHEDULE=static,1
./mandompts
export OMP_SCHEDULE=static,10
./mandompts
export OMP_SCHEDULE=dynamic
./mandompts
export OMP_SCHEDULE=dynamic,250
./mandompts
export OMP_SCHEDULE=guided
./mandompts
export OMP_NUM_THREADS=10
export OMP_SCHEDULE=static,1
./mandompts
export OMP_SCHEDULE=static,10
./mandompts
export OMP_SCHEDULE=dynamic
./mandompts
export OMP_SCHEDULE=dynamic,250
./mandompts
export OMP_SCHEDULE=guided
./mandompts
export OMP_NUM_THREADS=20
export OMP_SCHEDULE=static,1
./mandompts
export OMP_SCHEDULE=static,10
./mandompts
export OMP_SCHEDULE=dynamic
./mandompts
export OMP_SCHEDULE=dynamic,250
./mandompts
export OMP_SCHEDULE=guided
./mandompts