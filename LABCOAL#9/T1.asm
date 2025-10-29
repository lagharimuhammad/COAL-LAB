INCLUDE Irvine32.inc

.data
value DWORD 1234

.code
T1 PROC
    mov eax, DWORD PTR value
    mov ebx, eax
    shl eax, 4
    mov ecx, ebx
    shl ecx, 2
    add eax, ecx
    add eax, ebx
    call DumpRegs
    exit
T1 ENDP
END T1
