INCLUDE Irvine32.inc

.data 
msg1 BYTE "Initial value: ", 0
msg2 BYTE "New Value: ", 0

.code
main PROC
mov edx, OFFSET msg1
call WriteString
mov eax, 10
call WriteInt
call Crlf
mov eax, 10

repitition:
cmp eax, 0
jl done
sub eax, 3
jmp repitition

done:
mov edx, OFFSET msg2
call WriteString
call WriteInt
call Crlf
exit
main ENDP
END main