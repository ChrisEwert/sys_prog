ZUF8R EQU 0x20

mov A, #00h

start:
; schauen ob Button gedrückt
; wenn ja, neue Zahl
jnb p2.0, generateNumber
jz start

handleResult:
; aktuellen Akku-Inhalt anzeigen
cjne A, #01b, biggerThanOne
jmp one

biggerThanOne:
cjne A, #010b, biggerThanTwo
jmp two

biggerThanTwo:
cjne A, #011b, biggerThanThree
jmp three

biggerThanThree:
cjne A, #0100b, biggerThanFour
jmp four

biggerThanFour:
cjne A, #011b, biggerThanFive
jmp five

biggerThanFive:
jmp six

; schleife
jmp start

generateNumber:
ZUFALL:	mov	A, ZUF8R   ; initialisiere A mit ZUF8R
	jnz	ZUB
	cpl	A
	mov	ZUF8R, A
ZUB:	anl	a, #10111000b
	mov	C, P
	mov	A, ZUF8R
	rlc	A
	mov	ZUF8R, A

; modulo 6
mov B, #0110b
div AB
mov A, B
inc A
jmp handleResult

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
jmp start

one:
mov p0, #11100111b
mov p1, #10000001b
acall off
mov p0, #11011111b
mov p1, #11111101b
acall off
mov p0, #11011011b
mov p1, #10111111b
acall off
acall delay
;jmp one
jmp start

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
jmp start

three:
mov p0, #11000011b
mov p1, #10110101b
acall off
mov p0, #11111011b
mov p1, #10000001b
acall off
acall delay
;jmp three
jmp start

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
jmp start

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
jmp start

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
jmp start

end