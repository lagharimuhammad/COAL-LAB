INCLUDE irvine32.inc
.data
result DWORD ?
.code
main2 PROC
	mov eax, 95
	sub eax, 31
	add eax, 240
	sub eax, 125
	mov result, eax
	call DumpRegs
	exit
main2 ENDP
END main2