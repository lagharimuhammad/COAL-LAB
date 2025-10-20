INCLUDE Irvine32.inc

.data
    msg1 BYTE "Enter sentence: ", 0
    msg2 BYTE "Word Count: ", 0
    msg3 BYTE "Stack Push Order: ", 0
    msg4 BYTE "Stack Pop Order: ", 0
    msg5 BYTE "Reversed sentence: ", 0
    inputBuf BYTE 256 DUP(?)
    word1 BYTE 100 DUP(?)
    word2 BYTE 100 DUP(?)
    word3 BYTE 100 DUP(?)
    word4 BYTE 100 DUP(?)
    word5 BYTE 100 DUP(?)
    reversedBuf BYTE 256 DUP(?)

.code
q4 PROC
    mov edx, OFFSET msg1
    call WriteString
    mov edx, OFFSET inputBuf
    mov ecx, 256
    call ReadString
    
    lea esi, inputBuf
    lea edi, word1
    xor ebx, ebx
    
ParseWords:
    mov al, [esi]
    cmp al, 0
    je DoneParse
    cmp al, ' '
    je SkipSpace
    
CopyWord:
    mov al, [esi]
    cmp al, 0
    je EndWord
    cmp al, ' '
    je EndWord
    mov [edi], al
    inc esi
    inc edi
    jmp CopyWord
    
EndWord:
    mov BYTE PTR [edi], 0
    inc ebx
    add edi, 100
    jmp ParseWords
    
SkipSpace:
    inc esi
    jmp ParseWords
    
DoneParse:
    mov edx, OFFSET msg2
    call WriteString
    mov eax, ebx
    call WriteInt
    call Crlf
    
    mov edx, OFFSET msg3
    call WriteString
    call Crlf
    
    push ebx
    lea edi, word1
    mov ecx, 0
    
ShowPush:
    cmp ecx, ebx
    jge DonePush
    push ecx
    push edi
    mov edx, edi
    call WriteString
    call Crlf
    pop edi
    add edi, 100
    pop ecx
    inc ecx
    jmp ShowPush
    
DonePush:
    pop ebx
    
    mov edx, OFFSET msg4
    call WriteString
    call Crlf
    
    push ebx
    mov ecx, ebx
    dec ecx
    imul ecx, 100
    lea edi, word1
    add edi, ecx
    
ShowPop:
    cmp ebx, 0
    je DoneShow
    push edi
    push ebx
    mov edx, edi
    call WriteString
    call Crlf
    pop ebx
    pop edi
    sub edi, 100
    dec ebx
    jmp ShowPop
    
DoneShow:
    pop ebx
    
    mov edx, OFFSET msg5
    call WriteString
    
    lea esi, reversedBuf
    mov ecx, ebx
    dec ecx
    imul ecx, 100
    lea edi, word1
    add edi, ecx
    
BuildReversed:
    cmp ebx, 0
    je DoneReversed
    
    push esi
    push edi
    push ebx
    
CopyToResult:
    mov al, [edi]
    cmp al, 0
    je DoneCopy
    mov [esi], al
    inc esi
    inc edi
    jmp CopyToResult
    
DoneCopy:
    pop ebx
    pop edi
    pop esi
    
    push esi
    push ebx
    
FindEnd:
    mov al, [esi]
    cmp al, 0
    je FoundEnd
    inc esi
    jmp FindEnd
    
FoundEnd:
    pop ebx
    cmp ebx, 1
    je NoSpace
    mov BYTE PTR [esi], ' '
    inc esi
    
NoSpace:
    pop esi
    sub edi, 100
    dec ebx
    jmp BuildReversed
    
DoneReversed:
    mov edx, OFFSET reversedBuf
    call WriteString
    call Crlf
    
    exit
q4 ENDP
END q4