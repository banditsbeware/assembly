@lab2_Rademacher_dkr9394.s
@david rademacher 1001469394

.global stringCopy,stringCat,sumS32,sumS16,sumU32_64,countNegative,countNonNegative,countMatches,returnMax,returnMin

.text

@		   R0		R1
@ void stringCopy(char* strTo, char* strFrom);
stringCopy:
	LDRB R2, [R1]
	STRB R2, [R0]
	CMP R2, #0
	BEQ return
	ADD R0, R0, #1 
	ADD R1, R1, #1
	B stringCopy
return:
	BX LR

@		  R0		 R1
@ void stringCat(char* second, char* first);
stringCat:
	LDRB R2, [R1], #1
	CMP R2, #0
	BNE stringCat
	SUB R1, R1, #1
spiderloop:
	LDRB R2, [R0], #1
	STRB R2, [R1], #1
	CMP R2, #0
	BNE spiderloop
	BX LR

@		  R0	       R1
@ int32_t sumS32(int32_t x[], int32_t count);
sumS32:
	MOV R2, R0
	MOV R0, #0
bearloop:
	LDR R3, [R2], #4
	ADD R0, R0, R3
	SUB R1, R1, #1
	CMP R1, #0
	BNE bearloop
	BX LR

@		  R0	       R1
@ int32_t sumS16(int16_t x[], int32_t count);
sumS16:	
	MOV R2, R0
	MOV R0, #0
ferretloop:
	LDRH R3, [R2], #2
	ADD R0, R0, R3
	SUB R1, R1, #1
	CMP R1, #0
	BNE ferretloop
	BX LR

@  R1:R0               R0            R1
@ uint64_t sumU32_64(uint32_t x[], uint32_t count);
sumU32_64:
	MOV R3, R1
	MOV R2, R0
	MOV R1, #0
	MOV R0, #0
johnloop:
	LDR R4, [R2], #4
	ADDS R0, R0, R4
	ADC R1, R1, #0
	SUB R3, R3, #1
	CMP R3, #0
	BNE johnloop
	BX LR

@ uint32_t countNegative (int16_t x[], uint32_t count);
countNegative:
	BX LR

@ uint32_t countNonNegative (int16_t x[], uint32_t count);
countNonNegative:
	BX LR

@ uint32_t countMatches(char str[], char toMatch);
countMatches:
	BX LR
	
@ int32_t returnMax(int16_t x[], uint32_t count);
returnMax:
	BX LR

@ int32_t returnMin(int16_t x[], uint32_t count);
returnMin:
	BX LR


