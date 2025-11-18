INCLUDE Irvine32.inc

Str_Reverse PROTO pStr:PTR BYTE

.data
myStr BYTE "Reverse Me",0

.code
Task4 PROC
    INVOKE Str_Reverse, ADDR myStr
    mov edx, OFFSET myStr
    call WriteString
    exit
Task4 ENDP

Str_Reverse PROC uses esi edi, pStr:PTR BYTE
    mov esi, pStr
    mov edi, esi
    xor ecx, ecx
FindLen:
    cmp BYTE PTR [edi+ecx], 0
    je DoReverse
    inc ecx
    jmp FindLen
DoReverse:
    dec ecx
    add edi, ecx
SwapLoop:
    cmp edi, esi
    jl Done
    mov al, [esi]
    mov bl, [edi]
    mov [esi], bl
    mov [edi], al
    inc esi
    dec edi
    jmp SwapLoop
Done:
    mov eax, 0
    ret
Str_Reverse ENDP

END Task4