INCLUDE Irvine32.inc

.data
myArray DWORD 45, 23, 67, 12, 89, 34, 56, 78, 90, 11
        DWORD 32, 54, 76, 98, 21, 43, 65, 87, 19, 41
minMsg BYTE "Minimum: ", 0
maxMsg BYTE "Maximum: ", 0

.code
MinMaxArray PROC
    push ebp
    mov ebp, esp
    push esi
    push ecx
    
    mov esi, [ebp + 8]
    mov ecx, 20
    
    mov eax, [esi]
    mov ebx, [esi]
    
find_loop:
    mov edx, [esi]
    cmp edx, eax
    jge check_max
    mov eax, edx
    
check_max:
    cmp edx, ebx
    jle next_element
    mov ebx, edx
    
next_element:
    add esi, 4
    loop find_loop
    
    push ebx
    mov edx, OFFSET minMsg
    call WriteString
    call WriteDec
    call Crlf
    
    pop eax
    mov edx, OFFSET maxMsg
    call WriteString
    call WriteDec
    call Crlf
    
    pop ecx
    pop esi
    pop ebp
    ret 4
MinMaxArray ENDP

T3 PROC
    push OFFSET myArray
    call MinMaxArray
    
    exit
T3 ENDP
END T3