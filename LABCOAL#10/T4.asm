INCLUDE Irvine32.inc

.data
prompt BYTE "Enter a number: ", 0
resultMsg BYTE "Square: ", 0

.code
LocalSquare PROC
    enter 4, 0
    
    mov edx, OFFSET prompt
    call WriteString
    call ReadDec
    mov [ebp - 4], eax
    
    mov eax, [ebp - 4]
    imul eax, eax
    
    mov edx, OFFSET resultMsg
    call WriteString
    call WriteDec
    call Crlf
    
    leave
    ret
LocalSquare ENDP

T4 PROC
    call LocalSquare
    exit
T4 ENDP
END T4