#first 10 fibonacci numbers
.data
str1: .asciiz "The first 10 fibonacci numbers are:\n" # set str1 to this
space: .asciiz " \n " # set space to a pace represented by \n

.text
li $s0, 1 #1
li $s1, 1 #2
li $s2, 0  # place to store sum
li $s3, 35 #threshold
li $t0, 0 #loop counter i

#print string and initial values
li $v0, 4
la $a0, str1
syscall

li $v0, 1
move $a0, $s0
syscall

li $v0, 4
la $a0, space
syscall

li $v0, 1
move $a0, $s1
syscall

#loop
loop:
bge $s1,$s3,done #check if i is greater than threshold, if so jump to "done"
add $s2, $s0, $s1 # add current number to sum

li $v0, 4
la $a0, space
syscall

li $v0, 1
move $a0, $s2
syscall

move $s0, $s1
move $s1, $s2

addi $t0,$t0,1 #increment loop counter i

j loop #repeat

#exit
done:
li $v0, 10
syscall