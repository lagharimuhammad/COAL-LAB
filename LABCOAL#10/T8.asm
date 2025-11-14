INCLUDE Irvine32.inc

TakeInput PROTO
Armstrong PROTO :DWORD
Display PROTO :DWORD

.data
msg1 BYTE "Enter a number: ",0
msg2 BYTE "ESP = ",0
msgArm BYTE "Armstrong",0
msgNot BYTE "Not Armstrong",0
num DWORD ?

.code

T8 PROC
    INVOKE TakeInput
    INVOKE Armstrong, num
    INVOKE Display, eax
    ret
T8 ENDP

TakeInput PROC
    mov edx, OFFSET msg1
    call WriteString
    call ReadInt
    mov num, eax
    mov edx, OFFSET msg2
    call WriteString
    mov eax, esp
    call WriteDec
    call Crlf
    ret
TakeInput ENDP

Armstrong PROC val:DWORD
    mov eax, val
    mov ebx, eax
    mov ecx, 0
L1:
    mov edx, 0
    mov edi, ebx
    mov ebx, 10
    div ebx
    mov ebx, edi
    mov edx, eax
    mov eax, ebx
    mov ebx, eax
    imul ebx, ebx
    imul ebx, eax
    add ecx, ebx
    mov eax, edx
    mov ebx, eax
    test eax, eax
    jnz L1
    mov eax, ecx
    mov ebx, val
    cmp eax, ebx
    sete al
    movzx eax, al
    mov edx, OFFSET msg2
    call WriteString
    mov eax, esp
    call WriteDec
    call Crlf
    ret
Armstrong ENDP

Display PROC res:DWORD
    mov edx, OFFSET msg2
    call WriteString
    mov eax, esp
    call WriteDec
    call Crlf
    mov eax, res
    cmp eax, 1
    jne N1
    mov edx, OFFSET msgArm
    call WriteString
    jmp D1
N1:
    mov edx, OFFSET msgNot
    call WriteString
D1:
    call Crlf
    ret
Display ENDP

END T8