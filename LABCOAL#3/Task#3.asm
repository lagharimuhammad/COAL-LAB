INCLUDE Irvine32.inc
.data
greeting BYTE "Good Night",0
.code
Task3 PROC
    mov edx, OFFSET greeting
    call WriteString
    call Crlf
    exit
Task3 ENDP
END Task3
