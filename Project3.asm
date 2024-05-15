##Project 2: sorting an array of numbers
.data
list1: .word 1, 55, 20, 7, 11, 0, 2, -1, 10, 45
str1: .asciiz "\nBefore sorting\n"
str2: .asciiz "\nAfter sorting:\n"
space: .asciiz " "
size: .word 10
.text
main:
la $a1, list1
lw $a2, size
# print the unsorted array
print_list1:
#print string
la $a0, str1
li $v0, 4
syscall
move $t1, $a1
li $t2, 0
move $t3, $a2
printing_loop1:
beq $t2, $t3, exit
lw $a0,($t1)
li $v0, 1
syscall
la $a0, space
li $v0, 4
syscall
addi $t2, $t2, 1 #update loop counter
addi $t1, $t1, 4 #update address
j printing_loop1
exit:
move $t1, $a1
li $t2, 1
move $t3, $a2 #sort numbers
sort_list:
beq $t2, $t3, print_list2 #check if done
lw $s0, 0($t1)#read list[0] into $s0
lw $s1, 4($t1)#read list[1] into $s1
blt $s0, $s1, continue #if a[0] < a[1], continue, else swap using $s5 as temporary variable

#swap numbers
move $s5, $s0
move $s0, $s1
move $s1, $s5
#update the list after swap
sw $s0, 0($t1) #write to array
sw $s1, 4($t1) #write to array
li $t2, 0
move $t1, $a1
j sort_list
continue:
#update counter by 1 and address by 4
addi $t2, $t2, 1
addi $t1, $t1, 4
j sort_list
# print the sorted array
print_list2:
la $a0, str2
li $v0,4
syscall
lw $a0, size
move $t1, $a1
li $t2, 0
move $t3, $a2
printing_loop2:
beq $t2, $t3, last
lw $a0,($t1)
li $v0, 1
syscall
la $a0, space
li $v0, 4
syscall
#update counter by 1 and address by 4
addi $t2, $t2, 1
addi $t1, $t1, 4
j printing_loop2
#exit program after printing the sorted array
last:
li $v0, 10
syscall
