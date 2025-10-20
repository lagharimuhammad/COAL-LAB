INCLUDE Irvine32.inc

.data
msg1 BYTE "A=5, B=3, C=4, D=2", 0Dh, 0Ah, 0
msg2 BYTE "Step1 (A+B): ", 0
msg3 BYTE "Step2 ((A+B)*C): ", 0
msg4 BYTE "Final ((A+B)*C)-D: ", 0

.code
T3 PROC
    mov edx, OFFSET msg1
    call WriteString
    
    push 5
    push 3
    call Proc1
    push eax
    
    mov edx, OFFSET msg2
    call WriteString
    call WriteInt
    call Crlf
    
    pop eax
    push eax
    push 4
    call Proc2
    push eax
    
    mov edx, OFFSET msg3
    call WriteString
    call WriteInt
    call Crlf
    
    pop eax
    push eax
    push 2
    call Proc3
    
    mov edx, OFFSET msg4
    call WriteString
    call WriteInt
    call Crlf
    
    exit
T3Z ENDP

Proc1 PROC
    push ebp
    mov ebp, esp
    
    mov eax, [ebp+12]
    push eax
    mov eax, [ebp+8]
    pop ebx
    add eax, ebx
    
    pop ebp
    ret 8
Proc1 ENDP

Proc2 PROC
    push ebp
    mov ebp, esp
    
    mov eax, [ebp+12]
    push eax
    mov eax, [ebp+8]
    pop ebx
    imul eax, ebx
    
    pop ebp
    ret 8
Proc2 ENDP

Proc3 PROC
    push ebp
    mov ebp, esp
    
    mov eax, [ebp+12]
    push eax
    mov eax, [ebp+8]
    mov ebx, eax
    pop eax
    sub eax, ebx
    
    pop ebp
    ret 8
Proc3 ENDP

END T3