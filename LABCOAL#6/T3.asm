INCLUDE Irvine32.inc

.data
star BYTE '*'
newline BYTE 0Dh,0Ah,0

.code
T3 PROC
    mov ecx, 5
    mov ebx, 1
outerLoop:
    push ecx
    mov ecx, ebx
innerLoop:
    mov al, star
    call WriteChar
    loop innerLoop
    mov edx, OFFSET newline
    call WriteString
    inc ebx
    pop ecx
    loop outerLoop
    exit
T3 ENDP
END T3
