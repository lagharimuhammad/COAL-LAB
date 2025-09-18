INCLUDE Irvine32.inc

.data
arrayB BYTE 11h, 22h, 33h
arrayW WORD 4444h, 5555h, 6666h

.code
mainQ4 PROC
    mov esi, OFFSET arrayB
    mov al, [esi]
    inc esi
    mov al, [esi]
    inc esi
    mov al, [esi]
    mov esi, OFFSET arrayW
    mov ax, [esi]
    add esi, TYPE arrayW
    mov ax, [esi]
    add esi, TYPE arrayW
    mov ax, [esi]

    exit
mainQ4 ENDP
END mainQ4
