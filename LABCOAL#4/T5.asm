INCLUDE Irvine32.inc
.data
num1 WORD 1234h
num2 WORD 5678h
.code
Task5 PROC
    mov ax, num1
    mov bx, num2
    xchg ax, bx
    mov num1, ax
    mov num2, bx
    call DumpRegs
    exit
Task5 ENDP
END Task5
