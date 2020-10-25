INCLUDE Irvine32.inc


.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
something BYTE 500 DUP("TEST")

.code
main proc
	xor eax, eax
	call subproc
	invoke ExitProcess,0
main endp

subproc proc
	mov eax, esp
	call WriteHex
subproc endp



end main