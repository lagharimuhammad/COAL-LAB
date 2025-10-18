INCLUDE Irvine32.inc

.data
prompt BYTE "Enter two numbers: ", 0
msgT BYTE "True", 0
msgF BYTE "False", 0
a DWORD ?
b DWORD ?

.code
main PROC
mov edx, OFFSET prompt
call WriteString
call Crlf

call ReadInt
mov a, eax

call ReadInt
mov b, eax

mov eax, a
mov ebx, b

cmp eax, ebx
jle conditionalFalse
cmp eax, 100
jge conditionalFalse

conditionalTrue:
mov edx, OFFSET msgT
call WriteString
call Crlf
jmp Done

conditionalFalse:
mov edx, OFFSET msgF
call WriteString
call Crlf

Done:
exit
main ENDP
END main