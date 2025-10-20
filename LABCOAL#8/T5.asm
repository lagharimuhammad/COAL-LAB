include irvine32.inc

.data
n DWORD 5

.code
T5 PROC
    mov ecx, n
    shr ecx, 1
    inc ecx
    mov ebx, 1
    
upper_half:
    push ecx
    mov ecx, ebx
    call print_stars
    add ebx, 2
    pop ecx
    loop upper_half
    
    mov ecx, n
    shr ecx, 1
    sub ebx, 4
    
lower_half:
    push ecx
    mov ecx, ebx
    call print_stars
    sub ebx, 2
    pop ecx
    loop lower_half
    
    exit
T5 ENDP

print_stars PROC
    push ecx
print_loop:
    mov al, '*'
    call WriteChar
    loop print_loop
    call Crlf
    pop ecx
    ret
print_stars ENDP

END T5