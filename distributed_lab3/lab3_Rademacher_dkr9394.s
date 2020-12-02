@lab3_Rademacher_dkr9394.s
@david rademacher 1001469394

.global sortDecendingInPlace,sumF32,prodF64,dotpF64,maxF32,absSumF64,sqrtSumF64,getDirection,getAddNo,getCity

.text

@ void sortDecendingInPlace(int16_t x[], uint32_t count)
sortDecendingInPlace:
	BX LR

@ float sumF32(float x[], uint32_t count)
sumF32:
	MOV R2, #0
	VMOV S0, R2
loop_sumF32:
	CMP R1, #0
	BEQ return_sumF32
	VLDR.F32 S1, [R0]
	VADD.F32 S0, S0, S1
	SUB R1, R1, #1
	ADD R0, R0, #4
	B loop_sumF32
return_sumF32:
	BX LR

@ double prodF64(double x[], uint32_t count)
prodF64:
	VLDR.F64 D0, [R0]
loop_prodF64:
	ADD R0, R0, #8
	SUB R1, R1, #1
	CMP R1, #0
	BEQ return_prodF64
	VLDR.F64 D1, [R0]
	VMUL.F64 D0, D0, D1
	B loop_prodF64
return_prodF64:
	BX LR

@ double dotpF64(double x[], double y[], uint32_t count)
dotpF64:
	MOV R3, #0
	VMOV.F64 D0, R3, R3 @ sum into D0
	VMOV.F64 D1, R3, R3 @ multiply into D1
loop_dotpF64:
	CMP R2, #0
	BEQ return_dotpF64
	VLDR.F64 D2, [R0]
	VLDR.F64 D3, [R1]
	VMUL.F64 D1, D2, D3
	VADD.F64 D0, D0, D1
	ADD R0, R0, #8
	ADD R1, R1, #8
	SUB R2, R2, #1
	B loop_dotpF64
return_dotpF64:
	BX LR

@ float maxF32(float x[], uint32_t count)
maxF32:
	VLDR.F32 S0, [R0]
loop_maxF32:
	ADD R0, R0, #4
	SUB R1, R1, #1
	CMP R1, #0
	BEQ return_maxF32
	VLDR.F32 S1, [R0]
	VCMP.F32 S0, S1
	VMOVGT.F32 S0, S1
	B loop_maxF32
return_maxF32:
	BX LR

@ double absSumF64(double x[], uint32_t count)
absSumF64:
	MOV R2, #0
	VMOV D0, R2, R2
	VMOV D1, R2, R2
loop_absSumF64:
	CMP R1, #0
	BEQ return_absSumF64
	VLDR.F64 D1, [R0]
	VADD.F64 D0, D0, D1
	ADD R0, R0, #8
	SUB R1, R1, #1
	B loop_absSumF64
return_absSumF64:
	VABS.F64 D0, D0
	BX LR

@ double sqrtSumF64(double x[], uint32_t count)
sqrtSumF64:
	MOV R2, #0
	VMOV D0, R2, R2
	VMOV D1, R2, R2
loop_sqrtSumF64:
	CMP R1, #0
	BEQ return_sqrtSumF64
	VLDR.F64 D1, [R0]
	VADD.F64 D0, D0, D1
	ADD R0, R0, #8
	SUB R1, R1, #1
	B loop_sqrtSumF64
return_sqrtSumF64:
	VSQRT.F64 D0, D0
	BX LR

@ char getDirection(BUSINESS business[], uint32_t index)
getDirection:
	MOV R3, #120
	MUL R2, R1, R3
	ADD R0, R0, #44
	ADD R0, R0, R2
	LDR R0, [R0]
	BX LR

@ uint32_t getAddNo(BUSINESS business[], uint32_t index)
getAddNo:
	MOV R3, #120
	MUL R2, R1, R3
	ADD R0, R0, #40
	ADD R0, R0, R2
	LDR R0, [R0]
	BX LR

@ char * getCity(BUSINESS business[], uint32_t index)
getCity:
	MOV R3, #120
	MUL R2, R1, R3
	ADD R0, R0, #78
	ADD R0, R0, R2
	BX LR


