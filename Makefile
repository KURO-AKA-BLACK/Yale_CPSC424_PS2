# This makes both a sequential and parallel program to display the Mandelbrot Set
# Use "module load intel/2018b"

CC = icc

CFLAGS_OMP = -g -O3 -xHost -fno-alias -std=c99 -qopenmp
CFLAGS_SERIAL = -g -O3 -xHost -fno-alias -std=c99

EXECUTABLES = mandseq mandomp mand_collapse mandompts mandomptasks_part_one mandomptasks_part_two mandomptasks_part_three mandompts_parallel

TIMING = ./timing/timing.o 

all: $(EXECUTABLES)

mandseq: mandseq.o drand.o $(TIMING)  
	$(CC) $(CFLAGS_SERIAL) -o $@ $^ -lm

mandomp: mandomp.o drand.o $(TIMING)
	$(CC) $(CFLAGS_OMP) -o $@ $^ -lm
	
mand_collapse: mandomp.o drandts.o $(TIMING)
	$(CC) $(CFLAGS_OMP) -o $@ $^ -lm

mandompts: mandomp.o drandts.o $(TIMING)
	$(CC) $(CFLAGS_OMP) -o $@ $^ -lm

mandomptasks_part_one: mandomptasks_part_one.o drandts.o $(TIMING)
	$(CC) $(CFLAGS_OMP) -o $@ $^ -lm

mandomptasks_part_two: mandomptasks_part_two.o drandts.o $(TIMING)
	$(CC) $(CFLAGS_OMP) -o $@ $^ -lm
	
mandomptasks_part_three: mandomptasks_part_three.o drandts.o $(TIMING)
	$(CC) $(CFLAGS_OMP) -o $@ $^ -lm
	
mandompts_parallel: mandomp.o drand_parallel.o $(TIMING)
	$(CC) $(CFLAGS_OMP) -o $@ $^ -lm

mandseq.o: mandseq.c
	$(CC) $(CFLAGS_SERIAL) -c -o $@ $^

.c.o:
	$(CC) $(CFLAGS_OMP) -c $<

clean:
	rm -f $(EXECUTABLES) *.o
	