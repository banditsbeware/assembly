.global fourVariable

.text

@ f = (g + h) - (i + j);
@ int32_t fourVariable(int32_t g, int32_t h, int32_t i, int32_t j);
@    R0						R0			R1		R2			R3

fourVariable:
	ADD R0, R0, R1 @ R0 = g + h
	ADD R1, R2, R3 @ R1 = i + j
	SUB R0, R0, R1 @ We must return our result in R0
	BX LR
