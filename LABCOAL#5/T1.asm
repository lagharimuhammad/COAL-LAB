INCLUDE Irvine32.inc

.code
mainQ1 PROC
    mov AL, 7Fh
    add AL, 1
    mov AL, 7Fh
    sub AL, 80h
    call DumpRegs
    exit
mainQ1 ENDP
END mainQ1
