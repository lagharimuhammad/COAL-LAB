INCLUDE Irvine32.inc

.data 
msgInput db "Enter three numberss: ", 0
msgUnsign db "Largest (unsigned) = ", 0
msgSign db "Largest (signed) = ", 0
n1 WORD ?
n2 WORD ?
n3 WORD ?
largestUnsign WORD ?
largestSign WORD ?

.code 
main PROC
mov edx, OFFSET msgInput
call WriteString
call Crlf

call ReadInt
mov n1, ax

call ReadInt
mov n2, ax

call ReadInt
mov n3, ax

mov ax, n1
mov bx, n2
mov cx, n3

cmp ax, bx
jae compare1_3_unsigned 
mov ax, bx

compare1_3_unsigned:
cmp ax, cx
jae display_unsigned
mov ax, cx

display_unsigned:
mov largestUnsign, ax
mov edx, OFFSET msgUnsign
call WriteString
movzx eax, largestUnsign
call WriteDec
call Crlf

mov ax, n1
mov bx, n2
mov cx, n3

cmp ax, bx
jae compare1_3_signed 
mov ax, bx

compare1_3_signed:
cmp ax, cx
jge display_signed
mov ax, cx

display_signed:
mov largestSign, ax
mov edx, OFFSET msgSign
call WriteString
movsx eax, largestSign
call WriteInt
call Crlf
exit
main ENDP
END main