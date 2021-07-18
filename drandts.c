#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <stdbool.h>
#include <omp.h>

extern uint64_t seed;
extern bool flag;
#pragma omp threadprivate(seed)
void dsrand(unsigned s)
{
	seed = s-1;
	printf("Seed = %llu. RAND_MAX = %d.\n",seed,RAND_MAX);
}

double drand(void)
{
	seed = 6364136223846793005ULL*seed + 1;
	return((double)(seed>>33)/(double)RAND_MAX);
}
