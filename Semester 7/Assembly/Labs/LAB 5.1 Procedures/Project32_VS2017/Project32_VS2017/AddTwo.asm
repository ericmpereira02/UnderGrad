.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
message db "smartest"
target BYTE SIZEOF message DUP(0)
count EQU LENGTHOF message

.code
main PROC
	mov al, 40h
	xor al, 20h
  mov esi,0
  mov ecx,SIZEOF message
  mov eax, 0
  mov ebx, 0
  lea edx, message
  add edx, 4

L1:
  mov al,message[esi]
  add ebx, eax
  inc esi
  loop L1

  mov [edx], ebx


  invoke ExitProcess,0
main ENDP

END main