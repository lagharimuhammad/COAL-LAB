INCLUDE Irvine32.inc

Scan_String2 PROTO

.data
Str1 BYTE "Hello #World#",0
msg1 BYTE "Searching for character: ",0
msg2 BYTE "In string: ",0
msg3 BYTE "Position found: ",0
msg4 BYTE "Character not found",0

.code
Task2 PROC
    mov edx, OFFSET msg1
    call WriteString
    mov al, '#'
    call WriteChar
    call Crlf    
    mov edx, OFFSET msg2
    call WriteString
    mov edx, OFFSET Str1
    call WriteString
    call Crlf
    call Crlf    
    push '#'
    push OFFSET Str1
    call Scan_String2    
    mov edx, OFFSET msg3
    call WriteString    
    cmp eax, -1
    je ShowNotFound    
    call WriteInt
    call Crlf
    jmp Done    
ShowNotFound:
    mov edx, OFFSET msg4
    call WriteString
    call Crlf    
Done:
    exit
Task2 ENDP

Scan_String2 PROC
    push ebp
    mov ebp, esp   
    mov edi, [ebp+8]
    mov al, BYTE PTR [ebp+12]
    mov ecx, LENGTHOF Str1
    cld
    repne scasb
    jnz NotFound2    
    dec edi
    sub edi, [ebp+8]
    mov eax, edi
    jmp End2
NotFound2:
    mov eax, -1    
End2:
    mov esp, ebp
    pop ebp
    ret 8
Scan_String2 ENDP

END Task2