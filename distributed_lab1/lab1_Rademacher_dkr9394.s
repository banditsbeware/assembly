@lab1_Rademacher_dkr9394.s
@david rademacher 1001469394

.global add32,sub64,minU16,minS32,isLessThanU16,isLessThanS16,shiftLeftU16,shiftU32,shiftS8,isEqualU32,isEqualS8

.text

@uint64_t add32(uint32_t x, uint32_t y); x + y
add32:
	ADDS R0, R0, R1
	MOV R1, #0 /* clear R1 to hold high word */
	ADC R1, #0 /* high word is just carry flag */
	BX LR

@uint64_t sub64(uint64_t x, uint64_t y); x - y
sub64:
	SUBS R0, R0, R2 /* subtract low word, set carry flag */
	SBC R1, R1, R3  /* subtract high word, subtract carry flag */
	BX LR

@uint16_t minU16(uint16_t x, uint16_t y); the minimum of x, y
minU16:
	CMP R0, R1 /* compare x and y */
	MOVHI R0, R1 /* if y > x, move y to R0 */
	BX LR

@int32_t minS32(int32_t x, int32_t y); the minimum of x, y
minS32:
	CMP R0, R1 /* compare x and y */
	MOVGT R0, R1 /* if y > x, move y to R0 */
	BX LR

@bool isLessThanU16(uint16_t x, uint16_t y); 1 if x < y, 0 else
isLessThanU16:
	CMP R0, R1 /* compare x and y */
	MOVLO R0, #1 /* move 1 if x < y */
	MOVHS R0, #0 /* move 0 if x >= y */
	BX LR

@bool isLessThanS16(int16_t x, int16_t y); 1 if x < y, 0 else
isLessThanS16:
	CMP R0, R1
	MOVLT R0, #1
	MOVGE R0, #0
	BX LR

@uint16_t shiftLeftU16 (uint16_t x, uint16_t p); x << p = x * 2p, p = 0 .. 31
shiftLeftU16:
	LSL R0, R1
	BX LR

@uint32_t shiftU32(uint32_t x, int32_t p); x * 2p for p = -31 .. 31
shiftU32:
	CMP R1, #0
	LSLGE R0, R1 /* shift left if exponent is HS zero */
	NEGLT R1, R1 /* make negative exponent positive */
	LSRLT R0, R1 /* shift right */
	BX LR

@int8_t shiftS8(int8_t x, int8_t p); x * 2p for p = -31 .. 31
shiftS8:
	CMP R1, #0	/* test exponent */
	LSLGE R0, R1	/* shift left if exponent positive */
	BGE return	/* done */
	NEG R1, R1	/* make negative exponent positive */
	ASR R0, R1	/* preserve negative sign & shift right */
return:
	BX LR

@bool isEqualU32(uint32_t x, uint32_t y); 1 if x = y, 0 if x != y
isEqualU32:
	CMP R0, R1
	MOVEQ R0, #1
	MOVNE R0, #0
	BX LR

@bool isEqualS8(int8_t x, int8_t y); 1 if x = y, 0 if x != y
isEqualS8:
	CMP R0, R1
	MOVEQ R0, #1
	MOVNE R0, #0
	BX LR


