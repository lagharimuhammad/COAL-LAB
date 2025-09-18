INCLUDE Irvine32.inc

.data
arr1 BYTE 10,20,30,40
arr2 WORD 100h,200h,300h
arr3 DWORD 5 DUP(0)

.code
mainQ3 PROC
    mov ax, LENGTHOF arr1   
    mov bx, LENGTHOF arr2   
    mov cx, LENGTHOF arr3   
    mov ax, SIZEOF arr1     
    mov bx, SIZEOF arr2     
    mov cx, SIZEOF arr3     
    exit
mainQ3 ENDP
END mainQ3
