.data
newline : .asciiz "\n"
myArray: .word 100:10 #Declare an array in RAM having 3 elements each initialized to 100

.text
main:
 add $t0, $zero, 0
while:
 beq $t0, 40, exit
 lw $t6, myArray($t0)
 addi $t0, $t0, 4
 li $v0, 1
 move $a0, $t6
 syscall
#Print a new line
 li $v0, 4
 la $a0, newline
 syscall
 j while
exit:
 li $v0, 10
 syscall 