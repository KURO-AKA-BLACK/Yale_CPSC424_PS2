#include <stdio.h>
#include <math.h>
#include <complex.h> 
#include <omp.h>
#include <stdint.h>
#include <stdbool.h>
#include "./timing/timing.h"

void dsrand(unsigned s);
double drand(void);
uint64_t seed;
bool flag;

double MS_area(int n0, int n1, double r_area){
	return 2 * r_area * n1/(n1+n0);
}

int main(int argc, char *argv[]) {
	flag = false;
	seed = 12345;
	dsrand(seed);
	int n0 = 0;
	double wall_clock_start, cpu_start, wall_clock_end, cpu_end;
	timing(&wall_clock_start, &cpu_start);
	#pragma omp parallel for schedule(runtime) firstprivate(seed,flag) reduction(+: n0)
	/* scale up the axis by 1000 so that it matches the side-length of each cell*/
	for (int i = -2000; i < 500; i++){
		for (int j = 0; j < 1250; j ++){
			/* scale down the value of i and j to get the actual coordinates of c */
			double complex c = (((double)i) + drand())/1000 + (((double)j) + drand())/1000*I;
			double complex z = c;
			for (int k = 0; k < 20000; k++){
				/* |z| > 2  -->  sqrt(creal(z*z) + cimag(z*z)) > 2 --> creal(z*z) + cimag(z*z) > 4 */
				/* Using this form reduce calculation complexity */
				if ((creal(z*z) + cimag(z*z)) > 4.0){
					n0 = n0 + 1;
					break;
				}
				z = z * z + c;
			}
		}
	}
	timing(&wall_clock_end, &cpu_end);
	printf("Estimation of the area of the Mandelbrot set: %f\n", MS_area(n0, 2500*1250-n0, 2.5*1.25));
	printf("Wall clock time used: %f\n", wall_clock_end - wall_clock_start);
	printf("CPU time used: %f\n", cpu_end - cpu_start);
	return 0;
}