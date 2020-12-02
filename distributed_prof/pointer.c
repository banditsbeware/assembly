#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

extern uint32_t readU32 (uint32_t * p);
extern void writeU32(uint32_t * p, uint32_t x);
extern uint16_t readU16 (uint16_t * p);
extern void writeU16(uint16_t * p, uint16_t x);
extern uint8_t readU8 (uint8_t * p);
extern void writeU8(uint8_t * p, uint8_t x);

extern int32_t readS32 (int32_t * p);
extern void writeS32(int32_t * p, int32_t x);
extern int16_t readS16 (int16_t * p);
extern void writeS16(int16_t * p, int16_t x);
extern int8_t readS8 (int8_t * p);
extern void writeS8(int8_t * p, int8_t x);

int main(void) {

	uint32_t a;
	writeU32(&a, 0x1234abcd);

	printf("a = %x\n", readU32(&a));

	uint16_t b;
	writeU16(&b, 0x12ab);

	printf("b = %x\n", readU16(&b));

	uint8_t c;
	writeU8(&c, 0x1a);

	printf("c = %x\n", readU8(&c));

	int32_t d;
	writeS32(&d, 0x1234abcd);

	printf("d = %x\n", readS32(&d));

	int16_t e;
	writeS16(&e, 0x12ab);

	printf("e = %x\n", readS16(&e));

	int8_t f;
	writeS8(&f, 0x1a);

	printf("f = %x\n", readS8(&f));

	return EXIT_SUCCESS;
}
