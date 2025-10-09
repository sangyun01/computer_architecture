# example C code
#   int fact (int n) {
#       if (n < 1)
#           return f;
#       else
#           return n * fact(n - 1);
#   }
# arguments n -> $a0
# Result in $v0

# 상황 fact 함수 -> 재귀함수
# 결과에는 돌아올 주소와 n이 필요하다. -> 공간 2*4 = 8만큼 필요

Fact:
    addi $sp, $sp, -8   # 공간 할당
    sw $ra, 4($sp)      # 가르키는 sp + 4에 돌아올 주소 저장
    sw $a0, 0($sp)      # 가르키는 sp에 n값 저장

    slti $t0, $a0, 1    # 상수 1이랑 비교하므로 slti 사용 -> n < 1 -> t0 = 1
    beq $t0, $zero, L1  # n이 1 이상이면 L1 분기 / tip -> 재귀함수다 -> 만족하지 않으면 뺑뺑이 분기 시켜라.
    addi $v0, $zero, 1  # n < 1이라서, 이제 0!부터 시작하기 위한 단계 -> 복귀 단계다
    addi $sp, $sp, 8    # 복귀할 차례라서 따로 sp가 필요 없었으므로, sp 공간 반환
    jr $ra              # 현재의 ra로 이동 -> 루프 내부였다면 L1의 jal Fact 다음으로 간다.

L1:
    addi $a0, $a0, -1   # n - 1
    jal Fact            # why using jal? -> j는 안돌아올 때, jal은 돌아와야할 때 씀, jump and link
    lw $a0, 0($sp)      # n값 가져옴 : 0 -> 1(이때부터 가져옴) -> 2 -> 
    lw $ra, 4($sp)      # 복귀 주소 가져온다.
    addi $sp, $sp, 8    # 공간 반환
    mul $v0, $v0, $a0    # 1 -> 1*1 -> 1*2 -> 2*3 -> 6*4 ...
    jr $ra              # 2번째 이후라면 복귀는 jal Fact 다음으로 복귀한다.
                        # 처음이라면 기존의 함수 가는 곳으로