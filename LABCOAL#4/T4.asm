INCLUDE Irvine32.inc
.data
FinalResult WORD ?
.code
Task4 PROC
    mov ax, 012h
    add ax, 014h
    mov bx, 005h
    add bx, 010h
    mov dx, ax
    sub dx, bx
    mov FinalResult, dx
    call DumpRegs
    exit
Task4 ENDP
END Task4
