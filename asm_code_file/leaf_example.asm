# example C code
#   int leaf_example (int g, h, i, j) {
#       int f;
#       f = (g + h) - (i + j);
#       return f;
#   }
# arguments g..j -> $a0 ~ $a3
# f in $s0 (hence, need to save $s0 on the stack)
# Result i $v0