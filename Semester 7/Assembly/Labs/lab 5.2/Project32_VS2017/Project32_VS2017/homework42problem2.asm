.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
source WORD "T","h","i","s"," ","i","s"," ","i","t",0
target WORD SIZEOF source DUP(0)
count EQU LENGTHOF source
.code
main PROC
  mov esi,0
  mov ecx,SIZEOF source
L1:
  mov ax,source[esi]
  mov target[esi],ax
  inc esi
  loop L1
  invoke ExitProcess,0
main ENDP
END main