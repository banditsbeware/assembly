#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

extern uint32_t sum(uint32_t x[], uint32_t count);

int main(void) {

	uint32_t count = 5;
	uint32_t result;
	uint32_t x[] = {5, 2, 3, 4, 5};
	
	result = sum(x, count);
	
	printf("Sum is: %u\n", result);
	
	return EXIT_SUCCESS;
}
