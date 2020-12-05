// practical lab 5: l5.c
// author: david rademacher (1001469394)

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define INPUT_LEN 50

int main() {
	// recieve packet data
	char input[INPUT_LEN];
	fgets(input, sizeof input, stdin);
	
	// calculate actual data length
	int data_length = 0;
	while (input[data_length] != '\n') data_length++;

	// create packet structure
	int pkt_length = data_length + 3;
	uint8_t pkt[pkt_length];
	pkt[0] = 0xAA;
	pkt[1] = pkt_length;
	uint8_t chk = pkt[0] ^ pkt[1]; 

	// fill packet with data
	int i;
	for (i=0; i<data_length; i++) {
		pkt[i+2] = (uint8_t) input[i];
		chk ^= (uint8_t) input[i];
	}
	pkt[pkt_length-1] = chk;

	// print packet
	for (i=0; i<pkt_length; i++) printf("0x%02hhX ", pkt[i]);
	printf("\n");

	return EXIT_SUCCESS;
}
