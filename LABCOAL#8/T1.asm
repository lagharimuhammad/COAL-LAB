INCLUDE Irvine32.inc

.data
    matrixA BYTE 12, 15, 7, 9          
                                        
    matrixB BYTE 8, 10, 3, 5           
           
    

    resultMatrix BYTE 4 DUP(0)
    

    addHeader    BYTE "MATRIX ADDITION", 0
    subHeader    BYTE "MATRIX SUBTRACTION", 0
    resultMsg    BYTE "Result: [", 0
    closeBracket BYTE "]", 0
    spaces       BYTE "        [", 0
    endBracket   BYTE "]", 0
    sumMsg       BYTE "Total Sum: ", 0

.code
main PROC

    mov edx, OFFSET addHeader
    call WriteString
    call Crlf
    
    call MatrixAdd
    call DisplayMatrix
    call MatrixSum
    call Crlf
    
    mov edx, OFFSET subHeader
    call WriteString
    call Crlf
    
    call MatrixSub
    call DisplayMatrix
    call MatrixSum
    
    exit
main ENDP

MatrixAdd PROC
    pushad                          ; Save all general-purpose registers
    
    mov ecx, 4                      ; Loop counter (4 elements)
    mov esi, 0                      ; Array index
    
AddLoop:
    movzx eax, matrixA[esi]        ; Load A[i] (zero-extend byte to dword)
    push eax                        ; Push A[i] onto stack
    
    movzx eax, matrixB[esi]        ; Load B[i]
    push eax                        ; Push B[i] onto stack
    
    ; Perform addition using stack
    pop ebx                         ; Pop B[i] into ebx
    pop eax                         ; Pop A[i] into eax
    add eax, ebx                    ; EAX = A[i] + B[i]
    
    mov resultMatrix[esi], al       ; Store result
    inc esi                         ; Move to next element
    loop AddLoop
    
    popad                           ;
    ret
MatrixAdd ENDP


MatrixSub PROC
    pushad                          
    
    mov ecx, 4                      
    mov esi, 0                      
    
SubLoop:
    movzx eax, matrixA[esi]        
    push eax                        
    
    movzx eax, matrixB[esi]        
    push eax                        
    
    ; Perform subtraction using stack
    pop ebx                         
    pop eax                         
    sub eax, ebx                   
    
    mov resultMatrix[esi], al       
    inc esi                         
    loop SubLoop
    
    popad                           
    ret
MatrixSub ENDP

MatrixSum PROC
    pushad                          
    mov ecx, 4                      
    mov esi, 0                      
    mov ebx, 0                      
    
SumLoop:
    movzx eax, resultMatrix[esi]   
    push eax                        
    pop eax                         
    add ebx, eax                    
    inc esi
    loop SumLoop
    

    mov edx, OFFSET sumMsg
    call WriteString
    

    mov eax, ebx
    call WriteDec
    call Crlf
    
    popad                         
    ret
MatrixSum ENDP

DisplayMatrix PROC
    pushad                         
    
    mov edx, OFFSET resultMsg
    call WriteString
    
    movzx eax, resultMatrix[0]
    call WriteDec
    mov al, ' '
    call WriteChar
    
    movzx eax, resultMatrix[1]
    call WriteDec
    
    mov edx, OFFSET closeBracket
    call WriteString
    call Crlf
    
    mov edx, OFFSET spaces
    call WriteString
    
    movzx eax, resultMatrix[2]
    call WriteDec
    mov al, ' '
    call WriteChar
    
    movzx eax, resultMatrix[3]
    call WriteDec
    
    mov edx, OFFSET endBracket
    call WriteString
    call Crlf
    
    popad                     
    ret
DisplayMatrix ENDP

END main