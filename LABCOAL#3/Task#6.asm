INCLUDE Irvine32.inc
.code
Task6 PROC
    mov ax, 10
    add ax, 20
    mov bx, 5
    add bx, 2
    sub ax, bx
    call DumpRegs
    exit
Task6 ENDP
END Task6
