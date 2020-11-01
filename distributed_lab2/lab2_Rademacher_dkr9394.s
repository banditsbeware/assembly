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

@                          R0		 R1
@ uint32_t countNegative (int16_t x[], uint32_t count);
countNegative:
	MOV R3, R0
	MOV R0, #0
positions:
	LDRSH R2, [R3], #2
	CMP R2, #0
	ADDLT R0, R0, #1
	SUB R1, R1, #1
	CMP R1, #0
	BNE positions
	BX LR

@                             R0	    R1
@ uint32_t countNonNegative (int16_t x[], uint32_t count);
countNonNegative:
	MOV R3, R0
	MOV R0, #0
snacktime:
	LDRSH R2, [R3], #2
	CMP R2, #0
	ADDGE R0, R0, #1
	SUB R1, R1, #1
	CMP R1, #0
	BNE snacktime
	BX LR

@                        R0          R1
@ uint32_t countMatches(char str[], char toMatch);
countMatches:
	MOV R3, R0
	MOV R0, #0
approach:
	LDRB R2, [R3], #1
	CMP R2, R1
	ADDEQ R0, R0, #1
	CMP R2, #0
	BNE approach
	BX LR
	
@ int32_t returnMax(int16_t x[], uint32_t count);
returnMax:
	MOV R3, R0
	MOV R0, #0
	LDRSH R0, [R3], #2
cloudy:
	LDRSH R2, [R3], #2
	CMP R2, R0
	MOVGE R0, R2
	SUB R1, R1, #1
	CMP R1, #0
	BNE cloudy
	BX LR

@ int32_t returnMin(int16_t x[], uint32_t count);
returnMin:
	MOV R3, R0
	MOV R0, #0
	LDRSH R0, [R3], #2
chestplate:
	LDRSH R2, [R3], #2
	CMP R0, R2
	MOVGE R0, R2
	SUB R1, R1, #1
	CMP R1, #0
	BNE chestplate
	BX LR


