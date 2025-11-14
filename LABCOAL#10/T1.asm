INCLUDE Irvine32.inc

.data
num1 DWORD 5
num2 DWORD 4
num3 DWORD 3
resultMsg BYTE "Product: ", 0

.code
ThreeProd PROC
    push ebp
    mov ebp, esp
    
    mov eax, [ebp + 8]
    imul eax, [ebp + 12]
    imul eax, [ebp + 16]
    
    mov edx, OFFSET resultMsg
    call WriteString
    call WriteDec
    call Crlf
    
    pop ebp
    ret 12
ThreeProd ENDP

T1 PROC
    push num3
    push num2
    push num1
    call ThreeProd
    
    exit
T1 ENDP
END T1