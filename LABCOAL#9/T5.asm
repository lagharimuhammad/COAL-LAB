INCLUDE Irvine32.inc

.data
val1 SDWORD 200
val2 SDWORD 50
val3 SDWORD 5
temp1 SDWORD ?
temp2 SDWORD ?

.code
T5 PROC
    mov eax, val2
    cdq
    idiv val3
    mov temp1, eax

    mov eax, val1
    cdq
    idiv val2
    mov temp2, eax

    mov eax, temp1
    imul eax, temp2
    mov val1, eax

    call DumpRegs
    exit
T5 ENDP
END T5
