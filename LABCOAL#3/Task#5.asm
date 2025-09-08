INCLUDE Irvine32.inc
.code
Task5 PROC
    mov bx, 65
    mov bx, 041h
    mov bx, 01000001b
    mov bx, 'A'
    call DumpRegs
    exit
Task5 ENDP
END Task5
