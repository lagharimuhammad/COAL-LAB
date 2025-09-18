INCLUDE Irvine32.inc

.data
myByte   BYTE 12h
myWord   WORD 1234h
myDword  DWORD 12345678h

.code
mainQ2 PROC
    mov esi, OFFSET myByte
    mov esi, OFFSET myWord
    mov esi, OFFSET myDword
    mov ax, WORD PTR myDword+2
    mov bx, TYPE myByte     
    mov bx, TYPE myWord     
    mov bx, TYPE myDword    
    call DumpRegs 
    exit

mainQ2 ENDP
END mainQ2
