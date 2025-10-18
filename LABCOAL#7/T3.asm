INCLUDE Irvine32.inc

.data
msgPrompt db "Enter upto 5 numbers (0 to stop): ",0
msgCount db "Valid non-zero numbers entered: ",0
numbers dw 5 dup(?)
count db 0

.code
main PROC
mov edx, OFFSET msgPrompt
call WriteString
call Crlf

mov ecx, 5
mov esi, OFFSET numbers
mov byte ptr count, 0

inputLoop:
call ReadInt
mov [esi], ax

test eax, eax
jz endInput

inc count 
add esi, 2
loopnz inputLoop

endInput:
mov edx, OFFSET msgCount
call WriteString
movzx eax, count
call WriteDec
call Crlf

mov ecx, 0 
mov cl, count
cmp ecx, 0
je exitProgram
mov esi, OFFSET numbers
displayLoop:
movsx eax, word ptr [esi]
call WriteInt
call Crlf
add esi, 2
loop displayLoop

exitProgram:
exit
main ENDP
END main