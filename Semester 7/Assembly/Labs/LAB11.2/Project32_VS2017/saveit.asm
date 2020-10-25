; Windows Application                   (WinApp.asm)

; This program displays a resizable application window and
; several popup message boxes.
; Thanks to Tom Joyce for creating a prototype
; from which this program was derived.

INCLUDE Irvine32.inc
INCLUDE GraphWin.inc

;==================== DATA =======================
.data

;FOR HEAP
FILL_VAL EQU 0FFh
hHeap   DWORD ?		; handle to the process heap





AppLoadMsgTitle BYTE "Application Loaded",0
AppLoadMsgText  BYTE "This window displays when the WM_CREATE "
	            BYTE "message is received",0

PopupTitle Byte "Popup Window",0
PopupText byte "This window was activated by a BUTTON down message at x="
popupx BYTE 4 DUP(?)
            BYTE 0 
	       BYTE "WM_LBUTTONDOWN message",0
PopupTextSize BYTE 4 

ARRAY_SIZE DWORD ($-PopupText)
buffer dword 55 DUP (?)

GreetTitle BYTE "Main Window Active",0
GreetText  BYTE "This window is shown immediately after "
	       BYTE "CreateWindow and UpdateWindow are called.",0

CloseMsg   BYTE "WM_CLOSE message received",0

ErrorTitle  BYTE "Error",0
WindowName  BYTE "ASM Windows App",0
className   BYTE "ASMWin",0

; Define the Application's Window class structure.
MainWin WNDCLASS <NULL,WinProc,NULL,NULL,NULL,NULL,NULL, \
	COLOR_WINDOW,NULL,className>

msg	      MSGStruct <>
winRect   RECT <>
hMainWnd  DWORD ?
hInstance DWORD ?

;=================== CODE =========================
.code
WinMain PROC



; Get a handle to the current process.
	INVOKE GetModuleHandle, NULL
	mov hInstance, eax
	mov MainWin.hInstance, eax

; Load the program's icon and cursor.
	INVOKE LoadIcon, NULL, IDI_APPLICATION
	mov MainWin.hIcon, eax
	INVOKE LoadCursor, NULL, IDC_ARROW
	mov MainWin.hCursor, eax

; Register the window class.
	INVOKE RegisterClass, ADDR MainWin
	.IF eax == 0
	  call ErrorHandler
	  jmp Exit_Program
	.ENDIF

; Create the application's main window.
; Returns a handle to the main window in EAX.
	INVOKE CreateWindowEx, 0, ADDR className,
	  ADDR WindowName,MAIN_WINDOW_STYLE,
	  CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,
	  CW_USEDEFAULT,NULL,NULL,hInstance,NULL
	mov hMainWnd,eax

; If CreateWindowEx failed, display a message & exit.
	.IF eax == 0
	  call ErrorHandler
	  jmp  Exit_Program
	.ENDIF

; Show and draw the window.
	INVOKE ShowWindow, hMainWnd, SW_SHOW
	INVOKE UpdateWindow, hMainWnd

; Display a greeting message.
	INVOKE MessageBox, hMainWnd, ADDR GreetText,
	  ADDR GreetTitle, MB_OK

; Begin the program's message-handling loop.
Message_Loop:
	; Get next message from the queue.
	INVOKE GetMessage, ADDR msg, NULL,NULL,NULL

	; Quit if no more messages.
	.IF eax == 0
	  jmp Exit_Program
	.ENDIF

	; Relay the message to the program's WinProc.
	INVOKE DispatchMessage, ADDR msg
    jmp Message_Loop

Exit_Program:
	  INVOKE ExitProcess,0
WinMain ENDP

WinProc PROC,
	hWnd:DWORD, localMsg:DWORD, wParam:DWORD, lParam:DWORD
; The application's message handler, which handles
; application-specific messages. All other messages
; are forwarded to the default Windows message
; handler.
;-----------------------------------------------------


mov DX, 0
		mov BX, 10
		mov AX, WORD PTR lparam
		div BX
		xor DX, 30h
		mov popupx + 3, DL
		mov DX, 0
		div BX
		xor DX, 30h
		mov popupx + 2, DL
		mov DX, 0
		div BX
		xor DX, 30h
		mov popupx + 1, DL
		mov DX, 0
		div BX
		xor DX, 30h
		mov popupx + 0, DL
	mov eax, localMsg

	.IF eax == WM_LBUTTONDOWN		; mouse button?
		
		INVOKE GetProcessHeap		; get handle to prog's heap
		.IF eax == NULL			; failed?
			call	WriteWindowsMsg
			jmp	WinProcExit
		.ELSE
			mov	hHeap,eax		; success
		.ENDIF

		call	allocate_array
	jnc	arrayOk		; failed (CF = 1)?
	call	WriteWindowsMsg
	call	Crlf
	jmp	WinProcExit

arrayOk:				; ok to fill the array
	call	Crlf


		cld
		mov esi, OFFSET PopupText
		mov edi, offset buffer
		mov ecx, Array_Size
		rep movsb
		
		mov eax, localMsg

	  INVOKE MessageBox, hWnd, ADDR PopupText,
	    ADDR PopupTitle, MB_OK

			; free the array
		INVOKE HeapFree, hHeap, 0, buffer

		
	  jmp WinProcExit

	  


	.ELSEIF eax == WM_CREATE		; create window?
	  INVOKE MessageBox, hWnd, ADDR AppLoadMsgText,
	    ADDR AppLoadMsgTitle, MB_OK
	  jmp WinProcExit
	.ELSEIF eax == WM_CLOSE		; close window?
	  INVOKE MessageBox, hWnd, ADDR CloseMsg,
	    ADDR WindowName, MB_OK
	  INVOKE PostQuitMessage,0
	  jmp WinProcExit
	.ELSE		; other message?
	  INVOKE DefWindowProc, hWnd, localMsg, wParam, lParam
	  jmp WinProcExit
	.ENDIF

WinProcExit:
	ret
WinProc ENDP

;---------------------------------------------------
ErrorHandler PROC
; Display the appropriate system error message.
;---------------------------------------------------
.data
pErrorMsg  DWORD ?		; ptr to error message
messageID  DWORD ?
.code
	INVOKE GetLastError	; Returns message ID in EAX
	mov messageID,eax

	; Get the corresponding message string.
	INVOKE FormatMessage, FORMAT_MESSAGE_ALLOCATE_BUFFER + \
	  FORMAT_MESSAGE_FROM_SYSTEM,NULL,messageID,NULL,
	  ADDR pErrorMsg,NULL,NULL

	; Display the error message.
	INVOKE MessageBox,NULL, pErrorMsg, ADDR ErrorTitle,
	  MB_ICONERROR+MB_OK

	; Free the error message string.
	INVOKE LocalFree, pErrorMsg
	ret
ErrorHandler ENDP

allocate_array PROC USES eax
;
; Dynamically allocates space for the array.
; Receives: nothing
; Returns: CF = 0 if allocation succeeds.
;--------------------------------------------------------
	INVOKE HeapAlloc, hHeap, HEAP_ZERO_MEMORY, ARRAY_SIZE
	
	.IF eax == NULL
	   stc				; return with CF = 1
	.ELSE
	   mov buffer, eax		; save the pointer
	   clc				; return with CF = 0
	.ENDIF

	ret
allocate_array ENDP


END WinMain