.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword
include irvine32.inc


.data
B dword 7
N real8 7.1
P real8 ?


.code
main proc
	fld N
	fsqrt 
	fild B
	fadd
	fstp P
	xor ebx, ebx
  INVOKE ExitProcess,0
main ENDP
END main