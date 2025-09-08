INCLUDE Irvine32.inc
.data
zeros BYTE 10 DUP(0)
words WORD 5 DUP(?)
.code
Task4 PROC
    mov esi, OFFSET zeros
    mov edi, OFFSET words
    call DumpRegs
    exit
Task4 ENDP
END Task4
