#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

extern uint32_t length(char str[]);

int main(void) {
	char str1[80];
	
	printf("Enter string 1: ");
	scanf("%s", &str1);
	
	printf("Length of str1: %u\n", length(str1));
	
	return EXIT_SUCCESS;
}
	
