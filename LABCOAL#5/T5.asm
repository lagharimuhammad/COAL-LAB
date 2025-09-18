INCLUDE Irvine32.inc

.data
arrayD DWORD 1000h,2000h,3000h,4000h

.code
mainQ5 PROC
    mov eax, arrayD[1*TYPE arrayD]
    mov ebx, arrayD[3*TYPE arrayD]
    exit

mainQ5 ENDP
END mainQ5
