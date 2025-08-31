INCLUDE irvine32.inc
.data
result DWORD ?
.code
main5 PROC
	mov eax, 111b
	sub eax, 12
	add eax, 1F3h
	sub eax, 745o
	mov result, eax
	call DumpRegs
	exit
main5 ENDP
END	main5