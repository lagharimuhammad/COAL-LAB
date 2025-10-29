INCLUDE Irvine32.inc

.data
num1 SDWORD -125
num2 SDWORD 5
quot SDWORD ?
rem SDWORD ?

.code
T8 PROC
    mov eax, num1
    cdq
    idiv num2
    mov quot, eax
    mov rem, edx
    call DumpRegs
    exit
T8 ENDP
END T8
