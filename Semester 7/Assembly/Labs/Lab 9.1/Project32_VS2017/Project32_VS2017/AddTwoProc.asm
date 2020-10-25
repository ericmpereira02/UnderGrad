; Demonstrate the AddTwo Procedure     (AddTwo.asm)

; Demonstrates different procedure call protocols.

INCLUDE AddTwo.inc


.data
word1 WORD 1234h
word2 WORD 4111h
sum DWORD ?



AddTwo PROC
; Adds two integers, returns sum in EAX.
; The RET instruction cleans up the stack.

    push ebp
    mov  ebp,esp
    mov  eax,[ebp + 12]   	; first parameter
    add  eax,[ebp + 8]		; second parameter
    pop  ebp
	mov sum, eax
    ret  8				; clean up the stack
AddTwo ENDP

END main