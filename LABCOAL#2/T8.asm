INCLUDE irvine32.inc
.code
main8 PROC
	mov ebx, 6F1h
	sub ebx, eax
	add ebx, 92d
	add ebx, 47o
	sub ebx, 11011001b
	add ebx, 6Ch
	call DumpRegs
	exit
main8 ENDP
END main8