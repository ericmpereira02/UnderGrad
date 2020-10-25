; Library Test #1: Integer I/O (InputLoop.asm)
; Tests the Clrscr, Crlf, DumpMem, ReadInt, SetTextColor,
; WaitMsg, WriteBin, WriteHex, and WriteString procedures.
include Irvine32.inc
.data
COUNT = 4
YellowTextOnGray = yellow + (blue * 16)
DefaultColor = lightGray + (black * 16)
arrayD SDWORD 12345678h,1A4B2000h,3434h,7AB9h
prompt BYTE "Press any key... ",0
.code
main PROC



mov eax,YellowTextOnGray
call SetTextColor
call Clrscr ; clear the screen


mov dh, 12
mov dl, 40
call Gotoxy
mov al, 'X'
call WriteChar 
call GetMaxXY
sub dl, 1h 
mov dh, dl
mov dl, 40
mov dh, 29
call Gotoxy
call WaitMsg

main ENDP
END main

