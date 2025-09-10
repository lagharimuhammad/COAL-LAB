INCLUDE Irvine32.inc
.data
valA SBYTE -15
valB BYTE 25
valC WORD ?
.code
Task3 PROC
    movsx ax, BYTE PTR valA
    movzx bx, BYTE PTR valB
    add ax, bx
    sub ax, 5
    mov valC, ax
    call DumpRegs
    exit
Task3 ENDP
END Task3
