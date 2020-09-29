.global countUpToFifty
.global countDownToZero

.text

@ int32_t countUpToFifty(int32_t x);
@   R0						R0
countUpToFifty:
	MOV R1, #50 @ Copy 50 into R1
loopUp:
	CMP R0, R1 @ Is R0 equal to 50?
	BGE exit @ If R0 is greater than or equal R1, go to exit
	ADD R0, R0, #1
	B loopUp
	
@ int32_t countDownToZero(int32_t x);
@    R0						R0
countDownToZero:
	CMP R0, #0
	BLE exit
	SUB R0, R0, #1
	B countDownToZero
	
exit:
	BX LR
