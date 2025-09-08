INCLUDE Irvine32.inc
.code
Task7 PROC
    mov eax, 10000h
    add eax, 40000h
    sub eax, 20000h
    call DumpRegs
    exit
Task7 ENDP
END Task7
