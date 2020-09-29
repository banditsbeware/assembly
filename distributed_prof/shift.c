#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "printBinary.c"

extern int32_t shiftBy(int32_t x, int32_t y);

int main(void) {

	int32_t a, b, c;
	
	printf("Input integer: ");
	scanf("%d", &a);
	
	printf("Input shift amount: ");
	scanf("%d", &b);

	c = shiftBy(a, b);

	printf("a = %d\n", a);
	printBinary32(a);

	printf("c = %hd\n", c);
	printBinary32(c);

	return EXIT_SUCCESS;
}
