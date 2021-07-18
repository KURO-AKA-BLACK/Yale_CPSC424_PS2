#!/bin/bash

#SBATCH --partition=cpsc424
#SBATCH --cpus-per-task=20
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=4:00:00
#SBATCH --mem-per-cpu=5000
#SBATCH --job-name=summary
#SBATCH --output=%x-%j.out

module load intel
make clean

echo ""
echo ""
echo "Task 1: "
make mandseq
./mandseq
./mandseq
./mandseq
make clean

echo ""
echo ""
echo "Task 2 part 1: "
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

make clean

echo ""
echo ""
echo "Task 2 part 2: "
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
make clean

echo ""
echo ""
echo "Task 2 part 3: "
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
unset OMP_SCHEDULE
make clean

echo ""
echo ""
echo "Task 3 part 1: "
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
make clean

echo ""
echo ""
echo "Task 3 part 2: "
make mandomptasks_part_two
export OMP_NUM_THREADS=1
./mandomptasks_part_two
./mandomptasks_part_two
./mandomptasks_part_two
export OMP_NUM_THREADS=2
./mandomptasks_part_two
./mandomptasks_part_two
./mandomptasks_part_two
export OMP_NUM_THREADS=4
./mandomptasks_part_two
./mandomptasks_part_two
./mandomptasks_part_two
export OMP_NUM_THREADS=10
./mandomptasks_part_two
./mandomptasks_part_two
./mandomptasks_part_two
export OMP_NUM_THREADS=20
./mandomptasks_part_two
./mandomptasks_part_two
./mandomptasks_part_two
make clean

echo ""
echo ""
echo "Task 3 part 3: "
make mandomptasks_part_three
export OMP_NUM_THREADS=1
./mandomptasks_part_three
./mandomptasks_part_three
./mandomptasks_part_three
export OMP_NUM_THREADS=2
./mandomptasks_part_three
./mandomptasks_part_three
./mandomptasks_part_three
export OMP_NUM_THREADS=4
./mandomptasks_part_three
./mandomptasks_part_three
./mandomptasks_part_three
export OMP_NUM_THREADS=10
./mandomptasks_part_three
./mandomptasks_part_three
./mandomptasks_part_three
export OMP_NUM_THREADS=20
./mandomptasks_part_three
./mandomptasks_part_three
./mandomptasks_part_three
make clean

echo ""
echo ""
echo "Task 4: "
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
make clean