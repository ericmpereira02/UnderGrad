INCLUDE Irvine32.inc

.data
success BYTE "a happy message",0

_one REAL4 1.0
_two REAL4 2.0

.code
main PROC

	FINIT
	FILD _one ; _one should be defined as dword 1
	FILD _two ; .... also load dword _two
	FCOM  ; compares _two, _one...... cf FCOMI
	FNSTSW AX ; no wait for exceptions
	SAHF
	JNBE label_success
	JMP label_failure
	label_success:
	MOV EDX, OFFSET success
	CALL WriteString
	; print a happy message
	label_failure:
	; exit

	exit
main ENDP

END main
