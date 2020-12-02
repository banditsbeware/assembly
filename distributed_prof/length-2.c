#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

extern uint32_t length(char str[]);
extern char * cat(char dest[], char src[]);

#define MAX_CHARS 80

int main(void) {
	char str1[2 * MAX_CHARS + 1];
	char str2[MAX_CHARS + 1];
	
	printf("Enter string 1: ");
	scanf("%s", &str1);
	
	printf("Enter string 2: ");
	scanf("%s", &str2);
	
	printf("Length of str1: %u\n", length(str1));
	printf("Length of str2: %u\n", length(str2));
	
	printf("Concatenated string: %s\n", cat(str1, str2));
	
	return EXIT_SUCCESS;
}
