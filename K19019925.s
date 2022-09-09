;my k number is : 19019925
;my initial is: m.s
;I added the fifth LED to the left side of the most-left led and I connected the positive side of the led to the D12 port and the other side to the GND using a resistor.

.equ SREG, 0x3f
.equ PORTB, 0x05

.equ DDRB, 0x04
.org 0
main: 
	ldi r16,0
	out SREG, r16
	ldi r16, 0x1F
	out DDRB, r16

	ldi r17, 0x01
	out PORTB, r17

	ldi r16, 255
	ldi r17, 255
	ldi r18, 255

loop1:
	dec r16
	brne loop1
	dec r17
	brne loop1 
	dec r18
	brne loop1

	ldi r18, 0x09
	out PORTB, r18

	ldi r16, 255
	ldi r17, 255
	ldi r18, 255
loop2:
	dec r16
	brne loop2
	dec r17
	brne loop2
	dec r18
	brne loop2

	ldi r18, 0x00
	out PORTB, r18

	ldi r16, 255
	ldi r17, 255
	ldi r18, 255
loop3:
	dec r16
	brne loop3
	dec r17
	brne loop3
	dec r18
	brne loop3

	ldi r18, 0x01
	out PORTB, r18

	ldi r16, 255
	ldi r17, 255
	ldi r18, 255
loop4:
	dec r16
	brne loop4
	dec r17
	brne loop4
	dec r18
	brne loop4

	ldi r18, 0x09
	out PORTB, r18

	ldi r16, 255
	ldi r17, 255
	ldi r18, 255
loop5:
	dec r16
	brne loop5
	dec r17
	brne loop5
	dec r18
	brne loop5

	ldi r18, 0x09
	out PORTB, r18

	ldi r16, 255
	ldi r17, 255
	ldi r18, 255
loop6:
	dec r16
	brne loop6
	dec r17
	brne loop6
	dec r18
	brne loop6

	ldi r18, 0x02
	out PORTB, r18

	ldi r16, 255
	ldi r17, 255
	ldi r18, 255
loop7:
	dec r16
	brne loop7
	dec r17
	brne loop7
	dec r18
	brne loop7

	ldi r18, 0x05
	out PORTB, r18

	ldi r16, 255
	ldi r17, 255
	ldi r18, 255

loop8:
	dec r16
	brne loop8
	dec r17
	brne loop8
	dec r18
	brne loop8

	ldi r18, 0x0C
	out PORTB, r18

	ldi r16, 255
	ldi r17, 255
	ldi r18, 255
loop9:
	dec r16
	brne loop9
	dec r17
	brne loop9
	dec r18
	brne loop9

	ldi r18, 0x1B
	out PORTB, r18

	ldi r16, 255
	ldi r17, 255
	ldi r18, 255
loop10:
	dec r16
	brne loop10
	dec r17
	brne loop10
	dec r18
	brne loop10

	ldi r18, 0x12
	out PORTB, r18

	ldi r16, 255
	ldi r17, 255
	ldi r18, 255
		
