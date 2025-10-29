INCLUDE Irvine32.inc

.data
timeStamp WORD 0110101110010110b
bMinutes BYTE ?

.code
T3 PROC
    mov ax, timeStamp
    shr ax, 5
    and al, 3Fh
    mov bMinutes, al
    call DumpRegs
    exit
T3 ENDP
END T3
