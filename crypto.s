.macro encode chr, dec
	mov w0, \chr
	mov w13, \dec
	
	add w0, w0, w13
	cmp w0, #122
	b.gt 1f
	b 2f	

	1:
	sub w0, w0, w13
	add w13, w13, #97
	neg w0, w0
	add w0, w0, #123
	sub w0, w13, w0

	2:
	mov w5, w0
	svc 0
.endm
