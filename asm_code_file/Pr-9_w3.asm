# Pr-9 Given a C code : # i in $s3, k in $s5, address in $s6
# while (save[i] == k)
#   i += 1;

Loop:
    sll $t1, $s3, 2     # 주소에 접근하려면 4i에 있으므로 *4를 해준다.
    add $t1, $s6, $t1   # save[i]의 주소는 base address + offset
    lw $t0, 0($t1)      # lw $t0, $t1($s6)를 사용할 수 없기에 위의 과정으로 표현. constant 값만 가능 $t1은 불가
    bne $t0, $s5, Exit  # 다르다면 Exit으로 분기
    addi $s3, $s3, 1    # i += 1 -> add $s3, $s3, 1는 불가 1은 register가 아니므로
    j Loop
Exit:
    ~~~
