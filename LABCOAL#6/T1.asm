INCLUDE Irvine32.inc

.data
msg1 BYTE "welcome",0
msg2 BYTE "uou should not see this line",0
msg3 BYTE "goodbye",0

.code
T1 PROC
    mov edx, OFFSET msg1
    call WriteString
    call CrLf

    jmp skip

    mov edx, OFFSET msg2
    call WriteString
    call CrLf

skip:
    mov edx, OFFSET msg3
    call WriteString
    call CrLf

    exit
T1 ENDP
END T1
