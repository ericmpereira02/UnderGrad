ExitProcess proto
.data
myDword DWORD 80000000h
.code
main proc
  mov rax,0FFFFFFFFFFFFFFFFh
  mov al,BYTE PTR myDword
  mov eax,myDword
  movsxd rax, myDword
  mov ecx,0
  call ExitProcess
main endp
end
