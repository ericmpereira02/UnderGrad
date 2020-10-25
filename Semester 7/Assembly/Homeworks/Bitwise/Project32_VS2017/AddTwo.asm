INCLUDE Irvine32.inc

.data
byteArray BYTE 81h,20h,33h
.code
main PROC
shr byteArray+2,1
rcr byteArray+1,1
rcr byteArray,1

exit
	
main ENDP
END main