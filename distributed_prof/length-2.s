.global length
.global cat

.text

@ uint32_t length(char str[]);
@    R0					R0
length:
	MOV R1, R0
	MOV R0, #0
loop:
	LDRB R2, [R1], #1 @ post-index, i++
	CMP R2, #0 @ null-terminator
	BEQ backToC
	ADD R0, R0, #1
	B loop
	
backToC:
	BX LR


@ char * cat(char dest[], char src[]);
@      R0		R0			R1
cat:
	MOV R2, R0
cat_loop1:
	LDRB R3, [R2], #1 @ post-index, i++
	CMP R3, #0 @ Check for null-terminator
	BNE cat_loop1
	SUB R2, R2, #1
cat_loop2:
	LDRB R3, [R1], #1 
	STRB R3, [R2], #1
	CMP R3, #0 @ Check for null-terminator
	BNE cat_loop2
	BX LR
