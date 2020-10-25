.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword
.data
mov eax, 2
mov ebx, 3
PUSH EAX
PUSH EBX
POP EAX
POP EBX
  INVOKE ExitProcess,0
main ENDP
END main