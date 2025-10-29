INCLUDE Irvine32.inc

.data
val1 DWORD 0FFFFFFFFh
val2 DWORD 1
sumLow DWORD ?
sumHigh DWORD ?

.code
T9 PROC
    mov eax, val1
    add eax, val2
    mov sumLow, eax
    mov eax, 0
    adc eax, 0
    mov sumHigh, eax
    call DumpRegs
    exit
T9 ENDP
END T9
