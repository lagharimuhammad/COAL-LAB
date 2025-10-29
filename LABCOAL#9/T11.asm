INCLUDE Irvine32.inc

.data
num1 QWORD 00000001FFFFFFFFh
num2 QWORD 0000000100000001h
sum QWORD ?

.code
T11 PROC
    lea esi, num1
    lea edi, num2
    mov eax, DWORD PTR [esi]
    add eax, DWORD PTR [edi]
    mov DWORD PTR [sum], eax
    mov eax, DWORD PTR [esi+4]
    adc eax, DWORD PTR [edi+4]
    mov DWORD PTR [sum+4], eax
    call DumpRegs
    exit
T11 ENDP
END T11
