INCLUDE Irvine32.inc
.data
p BYTE "Enter number: ",0
np BYTE "Not all prime",0
lm BYTE "Largest prime = ",0
nums DWORD 4 DUP(?)
.code

T6 PROC
call Clrscr
mov ecx,4
lea edi, nums

readLoop:
mov edx, OFFSET p
call WriteString
call ReadInt
mov [edi], eax
add edi,4
loop readLoop

lea esi, nums
mov ecx,4

checkLoop:
mov eax, [esi]
push eax
call CheckPrime
add esp,4
cmp eax,1
jne notAllPrime
add esi,4
loop checkLoop
jmp allPrime

notAllPrime:
mov edx, OFFSET np
call WriteString
call Crlf
ret

allPrime:
lea eax, nums
push eax
call LargestPrime
add esp,4
call Crlf
ret
T6 ENDP

CheckPrime PROC
push ebp
mov ebp, esp

mov eax, [ebp+8]
cmp eax,2
jl notPrime

mov ebx, eax
mov ecx,2

primeLoop:
mov edx,0
mov eax, ebx
div ecx
cmp edx,0
je notPrime

inc ecx

mov edx, ecx
imul edx, ecx

cmp edx, ebx
jle primeLoop

mov eax,1
jmp finish

notPrime:
mov eax,0

finish:
pop ebp
ret 4
CheckPrime ENDP

LargestPrime PROC
push ebp
mov ebp, esp

mov esi, [ebp+8]
mov ecx,4
mov edi,0

findLoop:
mov eax, [esi]
cmp eax, edi
jle next
mov edi, eax
next:
add esi,4
loop findLoop

mov edx, OFFSET lm
call WriteString
mov eax, edi
call WriteInt

pop ebp
ret 4
LargestPrime ENDP

END T6