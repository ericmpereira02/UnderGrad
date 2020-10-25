; TASK 3: the uninitialized data array adds 20,000 bytes


.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data?
someOtherArray DWORD 5000 DUP(?)

.data
sombyte BYTE 1
someSbyte SBYTE -1
someword WORD 500
somesword SWORD -500
somedword DWORD 6.5
somesdword SDWORD -6.5
lolfword FWORD 34359738368
someqword QWORD 3435973836885858
sometbyte TBYTE 1.2
somereal4 REAL4 3.4747
somereal8 REAL8 1.227717172
somereal10 REAL10 1.843843838383838


.code
main proc

	invoke ExitProcess,0
main endp
end main