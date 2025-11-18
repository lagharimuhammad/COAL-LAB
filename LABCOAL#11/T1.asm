INCLUDE Irvine32.inc

Scan_String PROTO

.data
Str1 BYTE "127&j~3#A@#*#H45^",0

.code
Task1 PROC
INVOKE Scan_String
call WriteInt
exit
Task1 ENDP

Scan_String PROC
mov esi, OFFSET Str1
mov al, '#'
mov ecx, LENGTHOF Str1
cld
repne scasb
jnz NotFound
dec edi
sub edi, OFFSET Str1
mov eax, edi
ret
NotFound:
mov eax, -1
ret
Scan_String ENDP

END Task1