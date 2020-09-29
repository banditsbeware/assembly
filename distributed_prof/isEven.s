.global isEven

.text

@ bool isEven(int32_t x);

isEven:
	AND R0, R0, #1
	EOR R0, R0, #1  @ XOR, exclusive OR
	BX LR
