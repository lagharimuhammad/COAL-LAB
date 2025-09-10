INCLUDE Irvine32.inc
.data
num1 BYTE 25
num2 WORD 1200h
num3 DWORD ?
.code
Task1 PROC
    mov al, num1
    movzx eax, BYTE PTR num1
    mov ax, num2
    movzx ebx, WORD PTR num2
    shl ebx, 8
    movzx ecx, BYTE PTR num1
    or ebx, ecx
    mov num3, ebx
    call DumpRegs
    exit
Task1 ENDP
END Task1
