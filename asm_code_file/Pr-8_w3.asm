# Pr-8 Given a C code :
#   if (i == j) 
#       f = g + h;
#   else 
#       f = g - h;
# f, g, ... in $s0, $s1, ...

# ANS1) using bne
bne $s3, $s4, Else      # s3와 s4가 다르면 Else로 분기
add $s0, $s1, $s2       # 같다면 false라서 그대로 f = g + h 연산
j Exit                  # Exit으로 분기
Else:                   # label : Else
    sub $s0, $s1, $s2   # 다르다면 f = g - h연산
Exit:                   # 두 경우 모두 동일하게 지나감
    ~~

# ANS2) using beq
beq $s3, $s4, L1        # s3와 s4가 같다면 L1로 분기
sub $s0, $s1, $s2       # 다르다면 f = g - h연산
j Exit                  # Exit으로 분기
L1:                     # label : L1
    add $s0, $s1, $s2   # f = g + h 연산
Exit:
    ~~~