; Demonstrate the AddTwo Procedure     (AddTwo.asm)

; Demonstrates different procedure call protocols.

INCLUDE AddTwo.inc


.code
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

END