#calculate factorial of number entered by the user
#Complete the program by writing the Factorial function what was covered in lecture
.data
	string1: .asciiz "\nEnter the number greater than 0: \n"
	string2: .asciiz "\nThe factorial is:\n"
	error_string: .asciiz "\nThe number entered is less than 0\n"
.text
#print string1
	la $a0, string1 # load address of string into a0
	li $v0,4  #print string in a0
	syscall
#accept number from user
	li $v0, 5 # ask for integer
	syscall
	move $s0, $v0 #save the number entered by the user into $s0 register
#check if the number entered is >0
	bltz $s0, error
	move $a0, $s0 #pass the number n as argument for the factorial function
#call factorial function
	jal factorial
	move $s1,$v0 #move the result into $s1
	la $a0,string2 #move string to printable area
	li $v0,4 # get ready to print
	syscall # print string
#printthe result
	li $v0, 1 #print int command loaded
	move $a0, $s1 #into to print
	syscall
j exit #jump to exit duh
error:
	la $a0,error_string
	li $v0,4
syscall

exit:
	li $v0, 10
	syscall
factorial:
	move $t0, $s0 #move so given integer to t0
	beq $t0, $zero, zeroCase #case where zero is given
	addi $t1, $s0,  -1 #t1 = given number -1
	beq $t1, 0, oneCase #case where given number is 1
	facmultiply: # factorial loop
		mul $t0,$t0,$t1 #multiply t0 by t1(t0-1), store result in t0
		addi $t1,$t1,-1 #subtract 1 from t1
		bne $t1,0, facmultiply #do it again until t1 is 1
	oneCase:
	move $v0, $t0 #move result to v0
jr $ra #return to caller
	zeroCase:
	addi $t0, $t0, 1 #add 1
	move $v0, $t0 #move result to v0
jr $ra #return to caller

