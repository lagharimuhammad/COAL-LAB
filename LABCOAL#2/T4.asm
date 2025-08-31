INCLUDE irvine32.inc
.data
result DWORD ?
.code
main4 PROC
	mov eax, 11010110b
	sub eax, 9C4h
	add eax, 220
	add eax, 18
	add eax, 1011110b
	sub eax, 0Dh
	add eax, 12
	mov result, eax
	call DumpRegs
	exit
main4 ENDP
END main4