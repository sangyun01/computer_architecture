# Pr-1 Given the C code below, write the compiled MIPS code.
# 1) a = b + c + d;

add a, b, c # a = b + c
add a, a, d # a = (b + c) + d

# 2) f = (g + h) - (i + j);

add t0, g, h   # t0 = g + h
add t1, i, j   # t1 = i + j
sub f, t0, t1  # f = t0 - t1 = (g + h) - (i + j)