INCLUDE Irvine32.inc

.data
msg1 BYTE "Enter x: ", 0
msg2 BYTE "Polynomial: 3x3 + 2x2 - 5x + 7", 0Dh, 0Ah, 0
msg3 BYTE "Result: ", 0
msg4 BYTE "Stack trace:", 0Dh, 0Ah, 0
msg5 BYTE "Pushed: 3, 2, -5, 7", 0Dh, 0Ah, 0
msg6 BYTE "Computed: x=", 0
msg7 BYTE ", x2=", 0
msg8 BYTE ", x3=", 0
msg9 BYTE 0Dh, 0Ah, "Final: ", 0

xVal DWORD ?
x2Val DWORD ?
x3Val DWORD ?

.code
T2 PROC
    mov edx, OFFSET msg1
    call WriteString
    call ReadInt
    mov xVal, eax
    
    mov edx, OFFSET msg2
    call WriteString
    
    push 7
    push -5
    push 2
    push 3
    
    mov eax, xVal
    push eax
    push eax
    pop ebx
    pop eax
    push eax
    push ebx
    pop ebx
    pop eax
    imul eax, ebx
    mov x2Val, eax
    
    push x2Val
    push xVal
    pop ebx
    pop eax
    push eax
    push ebx
    pop ebx
    pop eax
    imul eax, ebx
    mov x3Val, eax
    
    pop eax
    push x3Val
    pop ebx
    push ebx
    push eax
    pop eax
    pop ebx
    imul eax, ebx
    push eax
    
    pop eax
    push x2Val
    pop ebx
    push ebx
    push eax
    pop eax
    pop ebx
    imul eax, ebx
    push eax
    
    pop eax
    push xVal
    pop ebx
    push ebx
    push eax
    pop eax
    pop ebx
    imul eax, ebx
    push eax
    
    pop eax
    pop ebx
    push eax
    push ebx
    pop ebx
    pop eax
    add eax, ebx
    push eax
    
    pop eax
    pop ebx
    push eax
    push ebx
    pop ebx
    pop eax
    sub eax, ebx
    push eax
    
    pop eax
    pop ebx
    push eax
    push ebx
    pop ebx
    pop eax
    add eax, ebx
    push eax
    
    pop eax
    
    mov edx, OFFSET msg3
    call WriteString
    call WriteInt
    call Crlf
    
    mov edx, OFFSET msg4
    call WriteString
    mov edx, OFFSET msg5
    call WriteString
    mov edx, OFFSET msg6
    call WriteString
    mov eax, xVal
    call WriteInt
    mov edx, OFFSET msg7
    call WriteString
    mov eax, x2Val
    call WriteInt
    mov edx, OFFSET msg8
    call WriteString
    mov eax, x3Val
    call WriteInt
    mov edx, OFFSET msg9
    call WriteString
    
    mov eax, 3
    mov ebx, x3Val
    imul eax, ebx
    mov ecx, 2
    mov ebx, x2Val
    imul ecx, ebx
    add eax, ecx
    mov ecx, -5
    mov ebx, xVal
    imul ecx, ebx
    sub eax, ecx
    add eax, 7
    
    call WriteInt
    call Crlf
    
    exit
T2 ENDP

END T2