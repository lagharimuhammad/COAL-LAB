INCLUDE Irvine32.inc
.data
val1 BYTE 65
.code
Task1 PROC
    mov al, val1
    call DumpRegs
    exit
Task1 ENDP
END Task1