INCLUDE irvine32.inc
.data
result DWORD ?
.code
main3 PROC
	mov eax, 1011106
	add eax, 50Ah
	add eax, 67d
	add eax, 1010001b
	add eax, 0Fh
	mov result, eax
	call DumpRegs
	exit
main3 ENDP
END main3