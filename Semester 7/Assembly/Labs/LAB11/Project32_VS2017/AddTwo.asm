; Win32 Console Example #1                (Console1.asm)

; This program calls the following Win32 Console functions:
; GetStdHandle, ExitProcess, WriteConsole

INCLUDE Irvine32.inc


BufSize = 80

.data
endl EQU <0dh,0ah>			; end of line sequence
bytesReadfirst   DWORD ?
bufferfirst BYTE BufSize DUP(?)
bufferfirstlength DWORD ($-bufferfirst)
bytesReadlast   DWORD ?
bufferlast BYTE BufSize DUP(?)
bufferlastlength DWORD ($-bufferlast)
bytesReadage   DWORD ?
bufferage BYTE BufSize DUP(?)
bufferagelength DWORD ($-bufferage)
bytesReadphone   DWORD ?
bufferphone BYTE BufSize DUP(?)
bufferphonelength DWORD ($-bufferphone)
stdInHandle HANDLE ?


firstname LABEL BYTE
	BYTE "input first name ", endl
firstnamesize DWORD ($-firstname)

lastname LABEL BYTE
	BYTE "input last name ", endl
lastnamesize DWORD ($-lastname)

age LABEL BYTE
	BYTE "input age ", endl
agesize DWORD ($-age)

phone LABEL BYTE
	BYTE "input phone number ", endl
phonesize DWORD ($-phone)

someEnd label byte
	Byte " ", endl
someEndSize DWORD ($-someEnd)

consoleHandle HANDLE 0     ; handle to standard output device
bytesWritten  DWORD ?      ; number of bytes written
bytesRead   DWORD ?

.code
main PROC
  ; Get the console output handle:
	INVOKE GetStdHandle, STD_OUTPUT_HANDLE
	mov consoleHandle,eax

		; Get handle to standard input
	INVOKE GetStdHandle, STD_INPUT_HANDLE
	mov	stdInHandle,eax

  ; Write a string to the console:
	INVOKE WriteConsole,
	  consoleHandle,		; console output handle
	  ADDR firstname,	; returns num bytes written
	  firstnamesize,
	  ADDR byteswritten,
	  0					; not used

	  	; Wait for user input
	INVOKE ReadConsole, stdInHandle, ADDR bufferfirst,
	  BufSize, ADDR bytesRead, 0

	INVOKE WriteConsole,
	  consoleHandle,		; console output handle
	  ADDR lastname,	; returns num bytes written
	  lastnamesize,
	  ADDR byteswritten,
	  0					; not used

	  	; Wait for user input
	INVOKE ReadConsole, stdInHandle, ADDR bufferlast,
	  BufSize, ADDR bytesRead, 0

	INVOKE WriteConsole,
	  consoleHandle,		; console output handle
	  ADDR age,	; returns num bytes written
	  agesize,
	  ADDR byteswritten,
	  0					; not used

	  	; Wait for user input
	INVOKE ReadConsole, stdInHandle, ADDR bufferage,
	  BufSize, ADDR bytesRead, 0

	  INVOKE WriteConsole,
	  consoleHandle,		; console output handle
	  ADDR phone,	; returns num bytes written
	  phonesize,
	  ADDR byteswritten,
	  0					

	  	
	INVOKE ReadConsole, stdInHandle, ADDR bufferphone,
	  BufSize, ADDR bytesRead, 0


	  	  	  	INVOKE WriteConsole,
	  consoleHandle,		
	  ADDR someEnd,	
	  someEndSize,
	  ADDR byteswritten,
	  0			

	INVOKE WriteConsole,
	  consoleHandle,		
	  ADDR bufferfirst,	
	  bufferfirstlength,
	  ADDR byteswritten,
	  0					

	  	  	INVOKE WriteConsole,
	  consoleHandle,		
	  ADDR someEnd,	
	  someEndSize,
	  ADDR byteswritten,
	  0					

	  	INVOKE WriteConsole,
	  consoleHandle,		; console output handle
	  ADDR bufferlast,	;lreturns num bytes written
	  bufferlastlength,
	  ADDR byteswritten,
	  0					; not 

	  	  	INVOKE WriteConsole,
	  consoleHandle,		; console output handle
	  ADDR someEnd,	; returns num bytes written
	  someEndSize,
	  ADDR byteswritten,
	  0					; not used

	  	INVOKE WriteConsole,
	  consoleHandle,		; console output handle
	  ADDR bufferage,	; returns num bytes written
	  bufferagelength,
	  ADDR byteswritten,
	  0					; not used

	  	  	INVOKE WriteConsole,
	  consoleHandle,		; console output handle
	  ADDR someEnd,	; returns num bytes written
	  someEndSize,
	  ADDR byteswritten,
	  0					; not used

	  	INVOKE WriteConsole,
	  consoleHandle,		; console output handle
	  ADDR bufferphone,	; returns num bytes written
	  bufferphonelength,
	  ADDR byteswritten,
	  0					; not used

	  	INVOKE WriteConsole,
	  consoleHandle,		; console output handle
	  ADDR someEnd,	; returns num bytes written
	  someEndSize,
	  ADDR byteswritten,
	  0					; not used


	INVOKE ExitProcess,0
main ENDP
END main