INCLUDE Irvine32.inc

.data
msgOn db "bit 0 is on", 0
msgOff db "bit 0 is off", 0

.code
main1 PROC
mov al, 10101010b
mov bl, 11001100b
mov cl, 11110000b
and al, 01010101b
and bl, 01010101b
and cl, 01010101b
or al, 01010101b
or bl, 01010101b
or cl, 01010101b
xor al, 11111111b
xor bl, 11111111b
xor cl, 11111111b

test al, 1
jz bit_off

mov edx, OFFSET msgOn
call WriteString
jmp done

bit_off:
mov edx, OFFSET msgOff
call WriteString

done:
call DumpRegs
call Crlf
exit
main1 ENDP
END main1

