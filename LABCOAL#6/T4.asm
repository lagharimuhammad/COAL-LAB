INCLUDE Irvine32.inc

.data
msg1 BYTE "Welcome to COAL Lab 06",13,10,0
msg2 BYTE "Program Ended",13,10,0

.code
main PROC
    call ClrScr
    mov edx, OFFSET msg1
    call WriteString
    mov eax, 2000
    call Delay
    mov edx, OFFSET msg2
    call WriteString
    exit
main ENDP
END main