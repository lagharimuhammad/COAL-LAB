INCLUDE Irvine32.inc

.data
prompt1 BYTE "Enter first number: ", 0
prompt2 BYTE "Enter second number: ", 0
espMsg BYTE "ESP value: ", 0
resultMsg BYTE "GCD: ", 0
num1 DWORD ?
num2 DWORD ?

.code
Display PROC
    push ebp
    mov ebp, esp
    
    mov edx, OFFSET espMsg
    call WriteString
    mov eax, esp
    call WriteHex
    call Crlf
    
    mov eax, [ebp + 8]
    mov edx, OFFSET resultMsg
    call WriteString
    call WriteDec
    call Crlf
    
    pop ebp
    ret 4
Display ENDP

GCD PROC
    push ebp
    mov ebp, esp
    
    mov edx, OFFSET espMsg
    call WriteString
    mov eax, esp
    call WriteHex
    call Crlf
    
    mov eax, [ebp + 8]
    mov ebx, [ebp + 12]
    
gcd_loop:
    cmp ebx, 0
    je gcd_done
    mov edx, 0
    div ebx
    mov eax, ebx
    mov ebx, edx
    jmp gcd_loop
    
gcd_done:
    push eax
    call Display
    
    pop ebp
    ret 8
GCD ENDP

TakeInput PROC
    push ebp
    mov ebp, esp
    
    mov edx, OFFSET espMsg
    call WriteString
    mov eax, esp
    call WriteHex
    call Crlf
    
    mov edx, OFFSET prompt1
    call WriteString
    call ReadDec
    mov num1, eax
    
    mov edx, OFFSET prompt2
    call WriteString
    call ReadDec
    mov num2, eax
    
    push num2
    push num1
    call GCD
    
    pop ebp
    ret
TakeInput ENDP

T2 PROC
    call TakeInput
    exit
T2 ENDP
END T2