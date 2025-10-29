INCLUDE Irvine32.inc

.data
num1 SWORD -5
num2 SWORD 6
res SDWORD ?

.code
T7 PROC
    mov ax, num1
    imul num2
    mov res, eax
    call DumpRegs
    exit
T7 ENDP
END T7
