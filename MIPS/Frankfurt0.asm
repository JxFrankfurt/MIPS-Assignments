#Jackson Frankfurt
#MIPS assembly language
#Assignment: GotYourNumber
#Description: Guess a number between 1 and 1,000,000 in as few guesses as possible with the hint of 

	#hint for lower->upper: look at ascii: AND the value with 223. A and a are same except for the second to MSB
	
	
	#important Syscalls: 1, 4, 12, 10
	#1: print integer from $a0
	#4: print string from $a0
	#12: read character to $v0
	#10: end program

	.data
	crlf:	.byte 10 13 0
	instr:	.asciiz	"Please think of a number between 1 and 1,000,000"
	prompt:	.asciiz "Too (H)igh, too (L)ow, or (E)qual"
	guessp:	.asciiz "My guess is: "
	lowguess:	.word 1
	highguess:	.word 1000000
	myguess:	.word 500000
	numguess:	.word 0
	.align 2
	htext:	.ascii "H"
	.align 2
	etext:	.ascii "E"
	.align 2
	ltext:	.ascii "L"
	correct:	.asciiz "I got it right wowowowow"
	#what is mask for? mask helps us convert from lowercase to uppercase character when they input "e", "l", "h"
	mask:	.word 223
	
	.text
	begin:
	#print instr
	la $a0, instr
	addi $v0, $zero, 4
	syscall
	
	#print prompt
	la $a0, prompt
	addi $v0, $zero, 4
	syscall
	
	#print "My guess is: "
guess:	la $a0, guessp
	addi $v0, $zero, 4
	syscall
	
	#print myguess
	la $a0, guessp
	addi $v0, $zero, 1
	syscall
	
	#input character from user
	addi $v0, $zero, 4
	syscall
	#$v0 has a character in it that I need to compare
	
	#if E -> jump out and
	lw $t0, etext
	beq $v0, $t0, iGuessedRight
	
	#else if H or L, increment counter of number of failures
	
	
	#calculate new myguess value based on H or L
		#calculate based on H
	
	
	#compare numguess to 20 and if greater, jump to a failure exit
	
	#jump to print myguess
	
iGuessedRight: 
	la $a0, correct
	addi $v0, $zero, 4
	syscall
	addi $v0, $zero, 10
	syscall
