.data
modeState:    .asciiz "Mode:"

newline: .asciiz "\n"
mean: .asciiz "\n Mean value is :"
meandot: .asciiz "."
median: .asciiz "\n the median value is : "
array:   .word 1, 1, 1, 1, 1, 2, 3, 3, 4, 5
    
length:  .word 10
mode: .word 0
    
.text

main:


#loop through the array to calculate mode

la $t0 array #array's starting address
li $t1 0     #loop index,
lw $t2 length  #length
li $t4, 1 #previous
li $t6, 1 #intial
li $t7, 0 #individualCount
li $t8, 0 #modeValue
li $t9, 0 #modeCount
li $s0 0
li $s4,5
li $s5,6
li $s6,0
li $s7,0
ModeLoop:
lw $t5 ($t0)   #get array[i]
add $s0,$t5,$s0
add $s6,$s6,1
bne $s4,$s6 ,medians
#li $v0,1
#move $a0,$t5
add $s7,$t5,$s7
#syscall

medians:
    bne $s5,$s6 ,medians1
    #li $v0,1
    #move $a0,$t5
    #syscall
    add $s7,$t5,$s7
    medians1:




    
    


#when a new value in encountered in the array
bne $t4 ,$t5 , updateifneeded

back:
addi $t7 $t7 1 #individualcount++
addi $t1 $t1 1 #i = i+1
add $t0 $t0 4 #update array address
li $t4 ,0
addi $t4 , $t5, 0
blt $t1 $t2 ModeLoop


#printing mode statement
li $v0,4
la $a0, modeState
syscall


move $a0 $t8
li $v0 1
syscall

#giving space of a line
li $v0,4
la $a0, newline
syscall

meando:
    li $s1,10
    div $s0,$s1 
    mflo $s2
    mfhi $s3
    li $v0,4
    la $a0,mean
    syscall
    li $v0,1
    move $a0,$s2
    syscall
    li $v0,4
    la $a0,meandot
    syscall
    li $v0,1
    move $a0,$s3
    syscall
 
mediando:
    li $s8,2 
  #  li $v0,1
   # move $a0,$s7
   # syscall
    div $s7,$s8
    mflo $t1
    mfhi $t2

    li $v0,4
    la $a0,median
    syscall
    li $v0,1
    move $a0,$t1
    syscall
    li $v0,4
    la $a0,meandot
    syscall
  
    li $t3,10
    li $t4,2
    mul $t5,$t2,$t3
    div $t6,$t5,$t4
    li $v0,1
    move $a0,$t6
    syscall



li $v0 10
syscall
.end main

updateifneeded:
#if the count greater that earlier mode count
bgt $t7, $t9, changeMode
next:
li $t6 ,0
addi $t6 , $t5, 0
#reintializing individual count
li $t7, 0
j back

changeMode:
#changing modevalue
li $t8 ,0
addi $t8 , $t4, 0
#changing modeCount
li $t9 ,0
addi $t9 , $t7, 0
j next

