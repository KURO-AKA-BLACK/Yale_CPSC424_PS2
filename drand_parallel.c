#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <stdbool.h>
#include <omp.h>

extern uint64_t seed;
extern bool flag;
#pragma omp threadprivate(seed)
#pragma omp threadprivate(flag)

void dsrand(unsigned s)
{
	seed = s-1;
	printf("Seed = %lu. RAND_MAX = %d.\n",seed,RAND_MAX);
}

double drand(void)
{
	
	if (!flag){
		flag = true;
		for (int i = 0; i < omp_get_thread_num() + 1; i++){
			seed = 6364136223846793005ULL*seed + 1;
		}
		return((double)(seed>>33)/(double)RAND_MAX);
	}
	for (int i = 0; i < omp_get_num_threads(); i++){
		seed = 6364136223846793005ULL*seed + 1;
	}
	return((double)(seed>>33)/(double)RAND_MAX);
}
