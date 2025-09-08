INCLUDE Irvine32.inc
.data
num1 BYTE -128
num2 BYTE 255
.code
Task2 PROC
    mov al, num1
    mov ah, num2
    call DumpRegs
    exit
Task2 ENDP
END Task2
