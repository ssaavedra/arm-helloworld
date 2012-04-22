	.cpu arm926ej-s
	.fpu softvfp
	.text
	.global	print_uart0
print_uart0:
	ldrb	r3, [r0, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bxeq	lr
	ldr	r2, =UART0DR
	ldr	r2, [r2, #0]
print_uart0_loop:
	str	r3, [r2, #0]
	ldrb	r3, [r0, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	bne	print_uart0_loop
	bx	lr

	.global	c_entry
c_entry:
	ldr	r0, =HELLO_WORLD
	bl	print_uart0
	b	.

	.section	.rodata
	.global	UART0DR
UART0DR:
	.word	270471168
	.section	.rodata.str1.4,"aMS",%progbits,1
HELLO_WORLD:
	.ascii	"Hello world!\012\000"
