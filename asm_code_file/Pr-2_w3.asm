# Pr-2 Given the C code below, write the compiled MIPS code.(access variables via register operands)
# 1) f = (g + h) - (i + j);
# f, g, h, i, j  stored in $s0, .. $s4

add $t0, $s1, $s2 # t0 = g + h
add $t1, $s2, $s3 # t1 = i + j
sub $s0, $t0, $t1 # f = t0 - t1 = (g + h) - (i + j)