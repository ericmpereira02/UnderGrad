.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
_one DWORD 16


.code
main PROC

FINIT
FILD _one ; _one should be defined as dword 1
; .... also load dword _two
FCOM  ; compares _two, _one...... cf FCOMI
FNSTSW AX ; no wait for exceptions
SAHF
JNBE label_success
JMP label_failure
label_success:
; print a happy message
label_failure:
; exit
main ENDP
END main