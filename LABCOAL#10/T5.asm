INCLUDE Irvine32.inc

.data
prompt BYTE "Enter n: ", 0
resultMsg BYTE "Factorial: ", 0
n DWORD ?

.code
Fact PROC
    push ebp
    mov ebp, esp
    
    mov eax, [ebp + 8]
    cmp eax, 1
    jle base_case
    
    dec eax
    push eax
    call Fact
    
    mov ebx, [ebp + 8]
    imul eax, ebx
    jmp fact_done
    
base_case:
    mov eax, 1
    
fact_done:
    pop ebp
    ret 4
Fact ENDP

T5 PROC
    mov edx, OFFSET prompt
    call WriteString
    call ReadDec
    mov n, eax
    
    push n
    call Fact
    
    mov edx, OFFSET resultMsg
    call WriteString
    call WriteDec
    call Crlf
    
    exit
T5 ENDP
END T5