INCLUDE irvine32.inc
.code
main9 PROC
	mov ecx, 101011010110b
	add ecx, 3Ah
	sub ecx, 64o
	add ecx, ebx
	sub ecx, ecx
	add ecx, 5
	Call DumpRegs
	exit
main9 ENDP
END main9