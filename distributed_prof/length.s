.global length

.text

@ uint32_t length(char str[]);
@    R0					R0
length:
	MOV R1, R0
	MOV R0, #0
loop:
	@LDRB R2, [R1], #1 @ post-index, i++
	@LDRB R2, [R1, R0] @ Use counter to offset from address
	LDRB R2, [R1]
	ADD R1, R1, #1
	CMP R2, #0 @ null-terminator
	BEQ backToC
	ADD R0, R0, #1
	B loop
	
backToC:
	BX LR
