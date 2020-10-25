; TASK 3: the uninitialized data array adds 20,000 bytes


.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data?
someOtherArray DWORD 5000 DUP(?)

.data
su DWORD 0
m DWORD 1
t DWORD 2
w DWORD 3
r DWORD 4
f DWORD 5
sa DWORD 7
someArray DWORD su, m, t, w, r, f, sa


.code
main proc

	invoke ExitProcess,0
main endp
end main