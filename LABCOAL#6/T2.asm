INCLUDE Irvine32.inc

.data
num DWORD 5

.code
T2 PROC
    mov ecx, 11

print:
    mov eax, num
    call WriteInt
    call CrLf

    inc num
    loop print

    exit
T2 ENDP
END T2
