.global _start

_start:

	MOV R7, #4  @ Syscall number - print string
	MOV R0, #1  @ Stdout is monitor
	MOV R2, #19 @ String is 19 characters long
	LDR R1, =string
	SWI 0 
	
_exit:
	MOV R7, #1
	SWI 0
	
.data
string:
.ascii "Hello World String\n"
