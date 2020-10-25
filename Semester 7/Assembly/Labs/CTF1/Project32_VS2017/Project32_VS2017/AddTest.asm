; AddTwoSum.asm - Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
sum DWORD 0

.code
main PROC
 mov edx,1
 mov eax,7FFFh
 cmp eax,0FFFF8000h
 jl L2
 mov edx,0
L2:
INVOKE ExitProcess,0
main ENDP
END main