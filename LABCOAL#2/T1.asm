INCLUDE irvine32.inc
.data
result DWORD ?
.code
main PROC
	mov eax, 25
	add eax, 47
	add eax, 88
	add eax, 64
	add eax, 120h
	add eax, 27o
	sub eax, 0Ah
	mov result, eax
	call DumpRegs
	exit
main ENDP
END main