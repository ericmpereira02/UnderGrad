.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	mov	eax,5
     mov  ebx,6
     mov  ecx,1
     mov  edx,2

     add  eax, ebx
     add  ecx, edx

     sub  eax, ecx   

	invoke ExitProcess,0
main endp
end main