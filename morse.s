;CS1 Coursework 2
;08/12/2019

;Seyed Mohammad Reza Shahrestani
;K19019925

;this program outputs the first three letters of my name and lights up a LED through PORTB.
;this program has loop of 50, which means it loops for 50 times.
;the first three letters will be shown in normal order, if the iteration is odd.
;the first three letters will be shown in reverse order, if the iteration is even.
;if the iteration is divisible by 5, it checkes the iteration for odd and even,
;if the iteration was odd, the program will show 'sey5',
;and if the iteration is even, it will show 'yes5'.




.equ SREG, 0x3f
.equ PORTB, 0x05
.equ DDRB, 0x04

.org 0

main:   ldi r16, 0
	out SREG, r16

	ldi r16, 0x0F
	out DDRB, r16

        ldi r20, 50	;initialising number of the loops
        ldi r29 ,0	;this register is reserved to check the modulus of 5
	
	ldi r21 ,0	;used for checking odd and even iteration
	ldi r23 ,2	;used for checking odd and even iteration
	ldi r24, 1	;used for checking odd and even iteration
	ldi r26, 5	;used for checking iterations of 5 modulus
	ldi r27 ,10	;used for checking iterations of 5 modulus


;this function copies the iteration of loops into a new register, 
;then keeps subtracting 2
;till the number is either 1 or 0,
;if the result is 1, it means that the iteration is odd and it calls the odd method,
;if the result is 0, it means that the iteration is even and it calles the even method.


	mov r22,r20	
checker:
	sub r22, r23
	cp r22 ,r24
	breq even	;branch if the cp condition has been met
	cp r22, r21
	breq odd	;branch if the cp condition has been met
	rjmp checker    ;keeps looping till the result is either 1 or 0
	ret


;this function checkes if the iteration is divisible by either 5 or 10
;if its divisible by 5, it calles the five method
;and if its divisible by 10, it calles the ten method
;and its neigher, it calles the checker method.

fivechecker:
	cp r29, r26      
	breq five
	cp r29 ,r27
	breq ten
	call checker	
	ret

;this method is called when the iteration is odd and divisible by 5 

five: 
;letter S
        call ss

;letter E
	call ee

;letter Y
	call yy

;number 5
	call numFive
	
	dec r20		;decrementing r20, in order to finish the loop.
	dec r22		;we decrement this value for the checker method, to be able to track the odd/even iteration.
	inc r29		;this register is used to track the modulus 5 iteration.
	
	cp r20 ,r21	;compares iteration of loops with number 0, 
	breq sleep	;if the condition has met, it branch to sleep,
	call fivechecker	;if not calles the fivechecker method again.
	ret


;this method is called when the iteration is even and divisible by 5

ten:
;letter Y
        call yy

;letter E
        call ee

;letter S
	call ss

;numbrer 5
	call numFive

	dec r20
	dec r22
	ldi r29 ,0	;resets the modulus 5 iteration
	
	cp r20 ,r21
	breq sleep
	call fivechecker
	ret


;this method is called when the iteration is odd

odd:
;letter S
        call ss

;letter E
	call ee

;letter Y
	call yy	
	
	dec r20
	dec r22
	inc r29

	cp r20 ,r21
	breq sleep
	call fivechecker

     
;this method is called when the iteration is even

even:
;letter Y
        call yy

;letter E
        call ee

;letter S
	call ss

	dec r20
	dec r22
	inc r29

	cp r20 ,r21
	breq sleep
	call fivechecker
        
		
;this method keeps the LED switched off.
;it uses infinite loop, 

sleep:
	nop
;off   
	ldi r16, 0x00
	out PORTB, r16
	call sleep
	ret

;switches on the LED for 0.6 s and the off for 0.2 s.
dash:	
;on
	ldi r16, 0x01
	out PORTB, r16
	
	call long	;long loop, 600 ms.

;off   
	ldi r16, 0x00
	out PORTB, r16

	ldi r19, 20
	call short	;short loop, 200 ms.
	ret

;switches on the LED for 0.2 s and the off for 0.2 s.
dot: 
;on

	ldi r16, 0x01
	out PORTB, r16
	
	call short	

;off   
	ldi r16, 0x00
	out PORTB, r16

	ldi r19, 20
	call short
	ret


;long loop, 600 ms
long:   call short
	call short
	call short
 	ret

;short loop, 200 ms
short:  ldi r19, 20
	call delay
	ret

;these 2 methods handle the process of delay.
;in order to have 200 ms dealy, we need to use 'nop' in a loop,
;the maximum value we can give to a register is 255 (less than 8 bits), and this loops for less than 200ms
;the way we can increase the delay is, we can use 2 or more register to make the loop.
;in this case we're using 2 registers, one with value of 255 and the other with 125 to have 200ms delay.

delay:
	 ldi r17,255
	 ldi r18,125
	
loop:    
	 nop 
	 dec r17
	 cpi r17, 0
	 brne loop
         ldi r17,255
	 dec r18
	 cpi r18, 0
	 brne loop
	 ldi r18,125
	 dec r19
	 cpi r19, 0
	 brne loop
	 ret

;letter S in morse code
;	. . .
ss:
	 call dot
	 call dot
	 call dot
         call short 
         call short
         ret

;letter E in morse code
;	.
ee: 
         call dot
	 call short
	 call short
         ret

;letter Y in morse code
;	_ . _ _
yy:
         call dash
         call dot
         call dash
	 call dash
         call short 
         call short
         ret

;number five in morse code
;	. . . . .
numFive:    
         call dot 
         call dot
         call dot
         call dot
         call dot
         call short 
         call short
         ret
        
;thank you for reading my code ;)