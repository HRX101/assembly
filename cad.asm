.data #variable declaration 
newline: .asciiz "hello world" #label
.text
main:
li $t0,2
li $t1,3
add $t3,$t0,$t1
sub $t4,$t0,$t1
mul $t5,$t0,$t1
div $t6,$t0,$t1
end:
li $v0,4
la $a0,newline
syscall 
li $v0,1
move $a0,$t3
syscall
li $v0,1
move $a0,$t4
syscall
li $v0,1
move $a0,$t5
syscall
li $v0,1
move $a0,$t6
syscall