.global sum

.text

@ uint16_t sum(uint16_t x[], uint16_t count);
@     R0			R0				R1

sum:
	MOV R2, R0
	MOV R0, #0
	
sum_loop:
	LDR R3, [R2], #4
	ADD R0, R0, R3
	SUBS R1, R1, #1 @ i--
	BNE sum_loop
	BX LR
