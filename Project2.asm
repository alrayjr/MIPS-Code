#program that accepts two numbers and print the largest number
.data
str1: .asciiz "Enter number 1:\n" # declare asciiz type varible with name str1
str2: .asciiz "Enter number 2:\n"
str3: .asciiz "Enter number 3:\n"
str4: .asciiz "\nThe result is:\n"
.text
la $a0,str1 #load string 1 into a0 
li $v0,4 # print sting in a0 (4 = predefined mars service to print string in a0 )
syscall # transfer control to OS to display whats happening 
#first number
li $v0,5 #read integer from user (5 = v0 mars service to read integer)
syscall #tranfer control to OS ( basically show user whats happening and ask them for number
move $s0,$v0 #get a (grab read integer that was stored in v0 and move it to s0)

la $a0,str2 #same as above but different string obviously
li $v0,4
syscall

#second number
li $v0,5#same as above but different integer obviously
syscall
move $s1,$v0 #get b, store it in s1

la $a0,str3 #same as above but different string obviously
li $v0,4
syscall

#third number
li $v0,5#same as above but different integer obviously
syscall
move $s2,$v0 #get c, store it in s2



la $a0,str4 # load string 4 into a0
li $v0,4
syscall

#compare
bge $s0,$s1,label # bge = branch if s0 >= s1, if so branch to "label"
bge $s2,$s1,label
move $a0,$s1 #print b since it is greater (actually it moves s1 into a0 so that it can be printed with the v0 argument)
li $v0,1 #argument to print integer in a0
syscall
j exit #jump to "exit"

label: #branch spot
bge $s2,$s0,spot
move $a0,$s0 #print a since it is greater or equal to b
li $v0,1 #same as above
syscall
j exit 

spot:
move $a0, $s2 #s3 is biggest
li $v0,1
syscall

exit: #jump spot
li $v0,10 #load argument to end execution of program
syscall #call end of program arguemnt
