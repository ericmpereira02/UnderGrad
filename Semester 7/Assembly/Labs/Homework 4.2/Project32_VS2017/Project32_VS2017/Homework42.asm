.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
source WORD "T","h","i","s"," ","i","s"," ","i","t",0
target WORD SIZEOF source DUP(0)

.data?
count DWORD ?
.code
main PROC
  mov esi,0
  mov ecx,SIZEOF source
L1:
  mov count, ecx
  mov ecx, 2
  mov ax,source[esi]
  mov target[esi],ax
  jmp L2
  L11:
  inc esi
  mov ecx, count
  loop L1
  jmp exit
  L2:
    mov al,BYTE PTR source[esi]
    mov BYTE PTR target[esi],al
    loop L2
    jmp L11
    exit:
  invoke ExitProcess,0
main ENDP
END main