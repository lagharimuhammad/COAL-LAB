INCLUDE Irvine32.inc

.data

.code
T2 PROC
    xor eax, eax
    mov ax, -128
    shl eax, 16
    sar eax, 16
    call DumpRegs
    exit
T2 ENDP
END T2
