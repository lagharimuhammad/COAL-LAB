INCLUDE irvine32.inc
.code
main7 PROC
	mov eax, 4C2h
	sub eax, ebx
	add eax, 72o
	add eax, 55d
	sub eax, 11101011b
	add eax, 180
	call DumpRegs
	exit
main7 ENDP
END main7