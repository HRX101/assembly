.data#variable declaration follow this line 
str: .asciiz "here the final ans of A*B+20/C-D is "
.text #instruction follow this line
main: #indicates start of the code 
li $t0 ,5 #load immediate , 1st value A is 5 #t0...#t9 temporary variables
li $t1, 6 # 2nd value B is 6
li $t2, 5 #3rd value C is 5
li $t3, 8 #4th value D is 8
li $2,20 # 20 in $2 
div $t4,$2,$t2 #division performance 20/5($t2)
mul $t5,$t0,$t1 #multiplication performance 5*6 and store in $t5
add $t6,$t5,$t4 #addition performance 30 + 4
sub $t7,$t6,$t3 #subtraction 34-8=26  
end:
li $v0, 4 #syscall 4 (print_str)
la $a0, str #string to be printed
syscall #print the string
li $v0, 1 #syscall 1 (print_int)
move $a0, $t7 #integer to be printed
syscall
li $v0, 10 #syscall 10 to exit the program
syscall

