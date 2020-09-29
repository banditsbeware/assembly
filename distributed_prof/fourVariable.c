#include<stdio.h>
#include<stdint.h>
#include<stdlib.h>

extern int32_t fourVariable(int32_t g, int32_t h, int32_t i, int32_t j);

int main(void) {
	int32_t g = 1;
	int32_t h = 8;
	int32_t i = 3;
	int32_t j = 6;
	int32_t f; // Result

	f = (g + h) - (i + j);
	printf("f = %d\n", f);
	
	f = 0;
	
	f = fourVariable(g, h, i, j);
	printf("f = %d\n", f);
	
	return EXIT_SUCCESS;
}
