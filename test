##print an array
.data
list1: .word 1, 55, 20, 7, 11, 22, 88, 26, 58, 32
size: .word 10
string1: .asciiz "\nThe input array is:\n"
.text
main:
#print string
la $a0, string1
li $v0, 4
syscall
#print numbers
la $a1, list1
lw $a0, size

# print the numbers!
print_list:
.data
space: .asciiz " "
.text
move $t1, $a1 #initialize array address
li $t2, 0  # initialize loop counter
move $t3, $a0 #load array size
printing_loop:
beq $t2, $t3, last

lw $a0,($t1)
li $v0, 1
syscall
la $a0, space
li $v0, 4
syscall

addi $t2, $t2, 1 #increment loop counter
addi $t1, $t1, 4 #increment array address
j printing_loop
last:
#completed printing exit program
li $v0, 10
syscall

# END OF PROGRAM
