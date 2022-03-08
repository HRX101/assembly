.data#variable declaration follow this line 
array: .space 44 #declaration of 44bytes (as we know int takes 4bytes)
newline : .asciiz "\n"
final: .asciiz "\n the final value is"
mean: .asciiz "\n  the mean value is"
median: .asciiz "\n the median value is"
newl: .asciiz "\n ok"
mode : .asciiz "\n the mode value is : all are mode because each and everyone frequency is same"
.text #instruction follow this line
main: #indicates the start of code 
addi $t0, $zero ,4 #addition immediate between 0 and 4 and store it to $t0 
addi $t1, $zero ,8 #addition immediate between 0 and 8 and store it to $t1 
addi $t2, $zero ,12 #addition immediate between 0 and 12 and store it to $t2 
addi $t3, $zero ,16#addition immediate between 0 and 16 and store it to $t3
addi $t4, $zero ,20#addition immediate between 0 and 20 and store it to $t4 
addi $t5, $zero ,24#addition immediate between 0 and 24 and store it to $t5 
addi $t6, $zero ,28#addition immediate between 0 and 28 and store it to $t6 
addi $t7, $zero ,32#addition immediate between 0 and 32 and store it to $t7 
addi $t8, $zero ,36#addition immediate between 0 and 36 and store it to $t8 
addi $t9, $zero,40#addition immediate between 0 and 40 and store it to $t9

li $s2,0

addi $s0,$zero,0
sw $t0,array($s0) #store word  to array 
    addi $s0,$s0,4 #increase by 4
sw $t1,array($s0)
    addi $s0,$s0,4
sw $t2,array($s0)
    addi $s0,$s0,4
sw $t3,array($s0)
    addi $s0,$s0,4
sw $t4,array($s0)
    addi $s0,$s0,4
sw $t5,array($s0)
    addi $s0,$s0,4
sw $t6,array($s0)
    addi $s0,$s0,4
sw $t7,array($s0)
    addi $s0,$s0,4
sw $t8,array($s0)
    addi $s0,$s0,4
sw $t9,array($s0)


addi $s0,$zero,0
addi $2,$zero ,0
while: #while loop
    beq $s0,40,exit 
    lw $s1,array($s0)
    addi $s0,$s0,4
    li $v0,1 #int to show
    addu $s2 ,$s1 ,$s2 #addition unsinged between unsinged integers
    move $a0,$s1 #copy from register to a0

    
    syscall #system call
    beq $2,$s1,incre
    li $v0,4 #(values) expression evaluation and results of a function
    la $a0,newline
    syscall
    li $v0,1
    move $a0,$s2 #First four parameters for subroutine. Not preserved across procedure calls
    syscall
    li $v0,4
    la $a0,final
    syscall
   
incre:
    li $v0,1
    move $a0,$2
    syscall
    li $v0,4
    la $a0,newl
    syscall
    jal while

    
exit: #exit label
    div $s3,$s2,10
    add $s4,$t4,$t5
    div $s5,$s4,2
    li $v0,4
    la $a0,mean #showing mean value 
    syscall
    li $v0,1
    move $a0,$s3
    syscall
    li $v0,4
    la $a0,median #showing median valeu
    syscall
    li $v0,1
    move $a0,$s5
    syscall
    li $v0,4
    la $a0,mode #showing mode value
    syscall
 



li $v0,10 #end the program
syscall

