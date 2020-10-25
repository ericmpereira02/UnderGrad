INCLUDE Irvine32.inc

BUFMAX = 128

.data

packed1 DWORD ?

buffer BYTE BUFMAX+1 DUP(0)

.code

 

main PROC 

call Clrscr

mov eax, 11223344

mov edi, OFFSET buffer

call PackedToAsc

call Display

;integer

mov eax, 12345678

mov edi, OFFSET buffer

call PackedToAsc

call Display

mov eax,10203045

mov edi, OFFSET buffer

call PackedToAsc

call Display

mov eax,17224854

mov edi, OFFSET buffer

call PackedToAsc

call Display

mov eax,55345618

mov edi, OFFSET buffer

call PackedToAsc

call Display

exit

main ENDP

 

PackedToAsc PROC

mov esi,0

mov packed1, eax

mov ecx, LENGTHOF packed1

 

Label1:

add BYTE PTR [edi], packed1[esi]

aaa

or BYTE PTR [edi], 30h

inc esi

inc edi

loop Label1

ret

PackedToAsc ENDP

 

Display PROC

mov edi, OFFSET buffer

call WritingString

call Crlf

call Crlf

ret

Display ENDP

 end main