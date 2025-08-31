INCLUDE irvine32.inc
.code
main6 PROC
	mov edx, eax
	add edx, 3
	add edx, ebx
	sub edx, ecx
	add edx, 12h
	sub edx, 45o
	add edx, 89d
	Call DumpRegs
	exit
main6 ENDP
END main6