COUNT = 5
LIMIT EQU 10

INCLUDE Irvine32.inc
.data
Result WORD ?
.code
Task2 PROC
    mov ax, COUNT
    add ax, LIMIT
    inc ax
    mov Result, ax
    call DumpRegs
    exit
Task2 ENDP
END Task2
