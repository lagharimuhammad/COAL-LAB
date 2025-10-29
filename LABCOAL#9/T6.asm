INCLUDE Irvine32.inc

.data
a1 QWORD 0000000200000003h
a2 QWORD 0000000300000004h
result QWORD ?

.code
T6 PROC
    lea esi, a1
    lea edi, a2

    mov eax, DWORD PTR [esi]
    add eax, DWORD PTR [edi]
    mov DWORD PTR [result], eax

    mov eax, DWORD PTR [esi+4]
    adc eax, DWORD PTR [edi+4]
    mov DWORD PTR [result+4], eax

    call DumpRegs
    exit
T6 ENDP
END T6
