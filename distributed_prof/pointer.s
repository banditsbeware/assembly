.global readU32
.global writeU32
.global readU16
.global writeU16
.global readU8
.global writeU8

.global readS32
.global writeS32
.global readS16
.global writeS16
.global readS8
.global writeS8

.text

writeS32:
writeU32:
	STR R1, [R0]
	BX LR

readS32:
readU32:
	LDR R0, [R0]
	BX LR

writeS16:
writeU16:
	STRH R1, [R0]
	BX LR

readS16:
readU16:
	LDRH R0, [R0]
	BX LR

writeS8:
writeU8:
	STRB R1, [R0]
	BX LR

readS8:
readU8:
	LDRB R0, [R0]
	BX LR
