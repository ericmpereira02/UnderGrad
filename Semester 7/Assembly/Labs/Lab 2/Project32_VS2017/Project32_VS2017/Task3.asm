; Demonstrate local variables   (LocalVars.asm)

; This program demonstrates the use of local variables.

INCLUDE Irvine32.inc

.data
sysTime SYSTEMTIME<>
.code
main PROC
mov ebx, 0
mov ecx, 2
mov edx, 3

cmp edx, eax
jg XIS1
cmp ebx, ecx
jle XIS2
cmp ebx, edx
jg XIS1
jmp XIS2



XIS1:


XIS2:

exit
	
	
END main



