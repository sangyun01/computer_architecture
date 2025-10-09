# example C code
#   int leaf_example (int g, h, i, j) {
#       int f;
#       f = (g + h) - (i + j);
#       return f;
#   }
# arguments g..j -> $a0 ~ $a3
# f in $s0 (hence, need to save $s0 on the stack)
# Result i $v0

# 상황 : j leaf_example로 분기가 된 상태, s0에 있는 값을 그대로 반환 시 유지를 해야함 -> using stack

addi $sp, $sp, -4   # Stack을 사용하기 위해 sp를 -4하여 공간 할당
sw $s0, 0($sp)      # 할당된 공간에 기존의 $s0값 저장

# 연산
add $t0, $a0, $a1   # t0 = g + h   
add $t1, $a2, $a3   # t1 = i + j
sub $s0, $t0, $t1   # f = (g + h) - (i + j)

# 결과 저장
add $v0, $s0, $zero # v0에 계산 결과 copy

# stack 값 load
lw $s0, 0($sp)      # sp에 있는 값을 s0에 저장
addi $sp, $sp, 4    # sp 복귀(공간 반환)

jr $ra              # return address