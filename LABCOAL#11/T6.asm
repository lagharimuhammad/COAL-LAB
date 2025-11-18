INCLUDE Irvine32.inc

Get_frequencies PROTO pTarget:PTR BYTE, pFreqTable:PTR DWORD

.data
target BYTE "AAEBDC FBB C",0
freqTable DWORD 256 DUP(0)

.code
Task6 PROC
    INVOKE Get_frequencies, ADDR target, ADDR freqTable
    mov esi, OFFSET freqTable
    mov ecx, 256
PrintFreqs:
    mov eax, [esi]
    test eax, eax
    jz Skip
    push ecx
    push esi
    mov edx, esi
    sub edx, OFFSET freqTable
    shr edx, 2
    mov eax, edx
    call WriteChar
    mov al, ':'
    call WriteChar
    mov al, ' '
    call WriteChar
    pop esi
    push esi
    mov eax, [esi]
    call WriteDec
    call Crlf
    pop esi
    pop ecx
Skip:
    add esi, 4
    loop PrintFreqs
    exit
Task6 ENDP

Get_frequencies PROC uses esi edi, pTarget:PTR BYTE, pFreqTable:PTR DWORD
    mov esi, pTarget
    mov edi, pFreqTable
    cld
ScanLoop:
    lodsb
    cmp al, 0
    je Done
    movzx eax, al
    mov ebx, edi
    shl eax, 2
    add ebx, eax
    inc DWORD PTR [ebx]
    jmp ScanLoop
Done:
    ret
Get_frequencies ENDP

END Task6