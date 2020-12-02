#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

extern double fsum(double x[], uint32_t count);

#define COUNT 3

int main(void) {

	double x[COUNT];
	double result;
	uint32_t i;

	for(i = 0; i < COUNT; i++) {
		printf("Enter double %d: ", i);
		scanf("%lf", &x[i]);
	}

	result = fsum(x, COUNT);
	printf("Result = %lf\n", result);

	return EXIT_SUCCESS;
}
