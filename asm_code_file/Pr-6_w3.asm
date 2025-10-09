# Pr-6 Given the C code
# A[12] = h + A[8];
# h in $s2, base address of A in $s3

lw $t0, 32($s3)     # 배열 A($s3)에 있는 기저 주소에서 offset 8*4에 위치한 데이터의 값을 t0에 저장한다.
add $t0, $s2, $t0   # t0 = h + A[8]
sw $t0, 48($s3)     # 이 t0의 값을 A($s3)에 있는 기저 주소에서 offset 12*4에 위치한 주소에 데이터를 저장한다.