INCLUDE Irvine32.inc

.data
val1 QWORD 0000000200000000h
val2 QWORD 0000000100000001h
result QWORD ?

.code
T10 PROC
    lea esi, val1
    lea edi, val2
    mov eax, DWORD PTR [esi]
    sub eax, DWORD PTR [edi]
    mov DWORD PTR [result], eax
    mov eax, DWORD PTR [esi+4]
    sbb eax, DWORD PTR [edi+4]
    mov DWORD PTR [result+4], eax
    call DumpRegs
    exit
T10 ENDP
END T10
