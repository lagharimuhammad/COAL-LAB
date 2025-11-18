INCLUDE Irvine32.inc

LoadArray PROTO pArray:PTR DWORD, arrCount:DWORD, multiplier:DWORD

.data
array DWORD 1,2,3,4,5
count DWORD 5

.code
Task5 PROC
    INVOKE LoadArray, ADDR array, count, 10
    mov esi, OFFSET array
    mov ecx, 5
PrintLoop:
    mov eax, [esi]
    call WriteInt
    call Crlf
    add esi, 4
    loop PrintLoop
    exit
Task5 ENDP

LoadArray PROC uses esi edi, pArray:PTR DWORD, arrCount:DWORD, multiplier:DWORD
    mov esi, pArray
    mov ecx, arrCount
    mov ebx, multiplier
    
MultiplyLoop:
    test ecx, ecx
    jz LDone
    mov eax, [esi]
    imul eax, ebx
    mov [esi], eax
    add esi, 4
    dec ecx
    jmp MultiplyLoop
    
LDone:
    ret
LoadArray ENDP

END Task5