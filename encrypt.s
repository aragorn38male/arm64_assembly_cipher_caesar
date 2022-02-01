.global _start
_start:

.include "fileIO.s"
.include "crypto.s"

mov x8, #63
mov x0, #0
mov x2, #8192
ldr x1, =inString
svc  0

mov x4, x1

openFile outFile, O_CREAT+O_WONLY
adds x9, xzr, x0

mov x12, #0

loop:
	ldrb w5, [x4, x12]

	cmp w5, #0
	b.eq _end	

	encode w5, #13

	ldr x2, =outBuf

	strb w5, [x2, x12]	
		
	add x12, x12, #1

	b loop

_end:

sub x12, x12, #1
writeFile x9, outBuf, x12
flushClose x9

mov x8, #93
svc 0

.data
outFile: .asciz "encrypted.txt"
inString: .fill  255, 1, 0
outBuf: .fill BUFFERLEN + 1, 1, 0
