INCLUDE Irvine32.inc

.data
valAX WORD 0001h
valBX WORD 1234h
res1 WORD ?
res2 WORD ?

.code
T4 PROC
    mov ax, valAX
    mov bx, valBX
    mov dx, ax

    shr ax, 1
    rcr bx, 1
    mov res1, bx

    mov ax, dx
    mov bx, valBX
    shrd bx, ax, 1
    mov res2, bx

    call DumpRegs
    exit
T4 ENDP
END T4
