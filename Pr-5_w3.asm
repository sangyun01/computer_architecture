# Pr-5 Given the C code
# g = h + A[8];   # A is an array, g in $s1, h in $s2, the base address of A in $s3

lw $t0, 32($s3)     # 배열 A($s3)에 있는 기저 주소에서 offset 8*4에 위치한 데이터의 값을 t0에 저장한다.
add $s1, $s2, $t0   # g = h + A[8] 연산