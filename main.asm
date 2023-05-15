start:

generateNumber:
jmp one

off:
mov p0, #0ffh
mov p1, #0ffh
ret

delay:
mov r2, #0fh
loop: djnz r2, loop
ret

zero:
mov p0, #11011011b
mov p1, #11000011b
acall off
mov p0, #11100111b
mov p1, #10111101b
acall off
acall delay
;acall zero
jmp generateNumber

one:
mov p0, #11100111b
mov p1, #10000001b
acall off
mov p0, #11011011b
mov p1, #10111101b
acall off
acall delay
acall one
