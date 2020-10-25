.text
.Ltext0:
.globl square
.type square, @function
square:
	movl $16, %ecx
	movl $0, %ebx
CONTINUE:
	movl %ebx, %eax
	movl %ebx, %edx
	mul %edx
	cmp %ecx, %eax
	je IXIEQUALSA
	inc %ebx
	jmp CONTINUE
IXIEQUALSA
ret