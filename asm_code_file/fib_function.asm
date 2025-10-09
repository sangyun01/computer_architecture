fib:
    addi $sp, $sp, -12
    sw $ra, 8($sp)
    sw $a0, 4($sp)
    slti $t0, $a0, 2        # a0(:= n) < 2 -> $t0 = 1
    beq $t0, $zero, L1      # if t0 = 0 -> branch L1 
    addi $v0, $a0, 0    # copy the a0 value to v0(:=n)
    addi $sp, $sp, 12       # return sp
    jr $ra      
L1:
    addi $a0, $a0, -1       # n(:= n-1) = n - 1
    jal fib                 # jump fib function and argument is (n-1)
    sw $v0, 0($sp)          # store the value 0($sp)
    lw $a0, 4($sp)  
    addi $a0, $a0, -2
    jal fib
    lw $t1, 0($sp)
    add $v0, $v0, $t1
    lw $a0, 4($sp)
    lw $ra, 8($sp)
    addi $sp, $sp, 12
    jr $ra

...

main:
    addi $a0, $zero, 5
    jal fib
    addi $a1, $zero, $v0