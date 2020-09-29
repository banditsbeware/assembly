.global shiftBy

.text

@ int32_t shiftBy(int32_t x, int32_t y);

shiftBy:
	MOV R0, R0, LSR R1
	BX LR
