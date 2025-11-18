INCLUDE Irvine32.inc

IsCompare PROTO

.data
s1 BYTE "abcd",0
s2 BYTE "abce",0
msg1 BYTE "Comparing: ",0
msg2 BYTE " vs ",0
msgResult BYTE "Result: ",0
msgEqual BYTE " (strings are equal)",0
msgGreater BYTE " (s1 > s2)",0
msgLess BYTE " (s1 < s2)",0

.code
Task3 PROC
    mov edx, OFFSET msg1
    call WriteString
    mov edx, OFFSET s1
    call WriteString
    mov edx, OFFSET msg2
    call WriteString
    mov edx, OFFSET s2
    call WriteString
    call Crlf
    
    push OFFSET s2
    push OFFSET s1
    call IsCompare
    
    push eax                
    mov edx, OFFSET msgResult
    call WriteString
    pop eax
    push eax
    call WriteInt
    
    pop eax
    cmp eax, 0
    je ShowEqual
    cmp eax, 1
    je ShowGreater
    mov edx, OFFSET msgLess
    jmp ShowMsg
ShowEqual:
    mov edx, OFFSET msgEqual
    jmp ShowMsg
ShowGreater:
    mov edx, OFFSET msgGreater
ShowMsg:
    call WriteString
    call Crlf
    
    exit
Task3 ENDP

IsCompare PROC
    push ebp
    mov ebp, esp
    mov esi, [ebp+8]   
    mov edi, [ebp+12]     
CompareLoop:
    mov al, [esi]
    mov bl, [edi]
    cmp al, bl
    jne NotEqual
    test al, al         
    je Equal            
    inc esi
    inc edi
    jmp CompareLoop    
NotEqual:
    movzx eax, al
    movzx ebx, bl
    cmp eax, ebx
    ja Greater
    jb Less    
Equal:
    mov eax, 0
    jmp Done    
Greater:
    mov eax, 1
    jmp Done    
Less:
    mov eax, -1 
Done:
    mov esp, ebp
    pop ebp
    ret 8
IsCompare ENDP

END Task3