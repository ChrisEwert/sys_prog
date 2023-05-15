start:

generateNumber:
jmp six

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
;jmp zero
jmp generateNumber

one:
mov p0, #11100111b
mov p1, #10000001b
acall off
mov p0, #11011011b
mov p1, #10111101b
acall off
acall delay
;jmp one
jmp generateNumber

two:
mov p0, #11000011b
mov p1, #10110101b
acall off
mov p0, #11111011b
mov p1, #11110001b
acall off
mov p0, #11011111b
mov p1, #10001111b
acall off
acall delay
;jmp two
jmp generateNumber

three:
mov p0, #11000011b
mov p1, #10110101b
acall off
mov p0, #11111011b
mov p1, #10000001b
acall off
acall delay
;jmp three
jmp generateNumber

four:
mov p0, #11011111b
mov p1, #11100001b
acall off
mov p0, #11100111b
mov p1, #11101111b
acall off
mov p0, #11111011b
mov p1, #10000001b
acall off
acall delay
;jmp four
jmp generateNumber

five:
mov p0, #11000011b
mov p1, #10110101b
acall off
mov p0, #11011111b
mov p1, #11110001b
acall off
mov p0, #11111011b
mov p1, #10001111b
acall off
acall delay
;jmp five
jmp generateNumber

six:
mov p0, #11000011b
mov p1, #10110101b
acall off
mov p0, #11011111b
mov p1, #10000001b
acall off
mov p0, #11111011b
mov p1, #10001111b
acall off
acall delay
;jmp five
jmp generateNumber