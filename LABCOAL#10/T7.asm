INCLUDE Irvine32.inc

BubbleSort PROTO :PTR DWORD, :DWORD

.data
arr DWORD 64,34,25,12,22,11,90
n DWORD LENGTHOF arr

.code

T7 PROC
    mov esi, OFFSET arr
    mov ecx, n
L1:
    mov eax, [esi]
    call WriteDec
    mov al, ' '
    call WriteChar
    add esi, 4
    loop L1
    call Crlf

    INVOKE BubbleSort, ADDR arr, n

    mov esi, OFFSET arr
    mov ecx, n
L2:
    mov eax, [esi]
    call WriteDec
    mov al, ' '
    call WriteChar
    add esi, 4
    loop L2
    call Crlf

    ret
T7 ENDP

BubbleSort PROC pArr:PTR DWORD, count:DWORD
    mov ebx, count
    dec ebx
outer_loop:
    mov esi, pArr
    mov ecx, ebx
inner_loop:
    mov eax, [esi]
    cmp eax, [esi+4]
    jle no_swap
    xchg eax, [esi+4]
    mov [esi], eax
no_swap:
    add esi, 4
    loop inner_loop
    dec ebx
    jnz outer_loop
    ret
BubbleSort ENDP

END T7
