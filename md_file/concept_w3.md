-   Instructions : Language of the Computer

\*\* Instruction SET \*\*\* Classification by types - Arithmetic
Instruction one destination + Two sources ex. add a, b, c \# a = b + c
Pr-1 Given the C code below, write the compiled MIPS code. 1) a = b +
c + d; 2) f = (g + h) - (i + j);

        Using Register Operands
            - 32 * 32bit
                -> why 32bit : reason why MIPS using Word size => 4byte = 32bit
            - Temporary Registers   : $t0 ~ $t9 -> 계산을 하는데 있어 임시로 사용하는 값들
                $t0 ~ $t7 : reg's 8-15
                $t8 ~ $t9 : reg's 24-25
            - Saved Registers       : $s0 ~ $s7 -> 보존을 해야하는 값들
                $s0 ~ $s7 : reg's 16-23
        Pr-2
        Given the C code below, write the compiled MIPS code.(access variables via register operands)
            1) f = (g + h) - (i + j); # f, g, h, i, j  stored in $s0, .. $s4
        
    - Memory Instructions
        - Using Memory Operands
        - Arithmetic Operations require Data Transfer Instructions
        - To access memory, need memory address
        - Endian
            - Big Endian : MSB -> low, LSB -> high
            - Little Endian : LSB -> low, MSB -> high
        - Memory operands(Three) : destination, offset, base address
            lw dest, offset(base address)
        - Immediate operands 
            add $s3, $s3, -4 -> usually using loop memory access
            $zero means 0 -> usually using data copy

        Pr-3
        Given a 32-bit (4-byte) integer value in hexadecimal 0x12345678 and the memory address 0-3,
        compare the values stored in each address in ‘Big Endian’ vs. ‘Little Endian’.
        | address | Big | Little |
        ---
        | 0 | 12 | 78 |
        | 1 | 34 | 56 |
        | 2 | 56 | 34 |
        | 3 | 78 | 12 |

        Pr-4
        Given a 32-bit (4-byte) integer value in hexadecimal 0x34125678 and the memory address 0-3,
        compare the values stored in each address in ‘Big Endian’ vs. ‘Little Endian’.
        | address | Big | Little |
        ---
        | 0 | 34 | 78 |
        | 1 | 12 | 56 |
        | 2 | 56 | 12 |
        | 3 | 78 | 34 |

        Pr-4'
        Given two consecutive 32-bit (4-byte) integer values in hexadecimal 
        0x12345678 and 0x34125678 stored sequentially in memory addresses 0–7, 
        compare the values stored in each address in ‘Big Endian’ vs. ‘Little Endian’.
        | address | Big | Little |
        ---
        | 0 | 12 | 78 |
        | 1 | 34 | 56 |
        | 2 | 56 | 34 |
        | 3 | 78 | 12 |
        | 4 | 34 | 78 |
        | 5 | 12 | 56 |
        | 6 | 56 | 12 |
        | 7 | 78 | 34 |

        Pr-5
        Given the C code
        g = h + A[8];   # A is an array, g in $s1, h in $s2, the base address of A in $s3

        Pr-6
        Given the C code
        A[12] = h + A[8];   # h in $s2, base address of A in $s3

        2s' comlement Signed Integers
        x = -x_n-1*2^(n-1) + x_n-2*2^(n-2) + .. +x_0*2^0
        Range : -2^(n-1) ~ 2^(n-1) - 1
        negative value -> MSB -> Signed bit -> 1 -> negative
        negative value 값 확인하는 법
        ex) -10
        -10 -> 10 -> 1010_2 -> 1's : 0101_2 -> 2's : 0110_2

        MIPS Instruction set
            addi : extend immediate value
            lb, lh, : extend loaded byte/halfword
            beq, bne : extend the displacement

        ex)
        lb
            2   -> 0000 0010 (02) => 0000 ... 0000 0010 (0x0000_0002)
            -2  -> 1111 1110 (FE) => 1111 ... 1111 1110 (0xFFFF_FFFE)
        lh
            2   -> 0000 0000 0000 0010(0002) => 0000 ... 0000 0010 (0x0000_0002)
            -2  -> 1111 1111 1111 1110(FFFE) => 1111 ... 1111 1110 (0xFFFF_FFFE)   

    - Logical Instructions
        |Operation|C|MIPS|
        |shift left|<<|<sll|
        |shift right|>>|srl|
        |Bitwise AND|&|and, andi|
        |Bitwise OR| "|" | or |
        |Bitwise NOT| ~ | nor|
        sll : Shift Left Logical -> *2
        srl : Shift Right Logical -> /2
        AND
            ex) and $t0, $t1, $t2
                $t2 : 0000 0000 0000 0000 0000 1101 1100 0000 
                $t1 : 0000 0000 0000 0000 0011 1100 0000 0000
                $t0 : 0000 0000 0000 0000 0000 1100 0000 0000
        OR
            ex) or $t0, $t1, $t2
                $t2 : 0000 0000 0000 0000 0000 1101 1100 0000 
                $t1 : 0000 0000 0000 0000 0011 1100 0000 0000
                $t0 : 0000 0000 0000 0000 0011 1101 1100 0000
        NOT
            ex) nor $t0, $t1, $zero
                    why nor? -> B = 0($zero)
                        -> if A = 0 -> ~(0|0) -> A = 1
                        -> if A = 1 -> ~(1|0) -> A = 0 
                $t1 : 0000 0000 0000 0000 0011 1100 0000 0000
                $t0 : 1111 1111 1111 1111 1100 0011 1111 1111
                
    - Conditional Instructions (조건 분기)
        beq rs, rt, L1
            if (rs == rt) -> L1으로 jump
        bne rs, rt, L1
            if (rs != rt) -> L1으로 jump
        j L1
            항상 L1으로 jump
        slt rd, rs, rt
            if (rs < rt) -> rd = 1, else rd = 0
        slti rt, rs, constant
            if (rs < constant) -> immediatly rt = 1, else rt = 0
        sltu rd, rs, rt -> unsigned
        ex)
            $s0 = 1111 1111 1111 1111 1111 1111 1111 1111
            $s1 = 0000 0000 0000 0000 0000 0000 0000 0001
            slt $t0, $s0, $s1
                -> s0 = -1, s1 = 1
                s0 < s1 -> t0 = 1
            sltu $t0, $s0, $s1
                -> s0 = 2^32 - 1, s1 = 1
                s0 > s1 -> t0 = 0

        Pr-8
            Given a C code : # f, g, ... in $s0, $s1, ...
            if (i == j) 
                f = g + h;
            else 
                f = g - h;
        
        Pr-9
            Given a C code : # i in $s3, k in $s5, address in $s6
            while (save[i] == k)
                i += 1;

    - Branch / Jump Instructions
        PC : Program Counter
        sp : stack pointer
        ra : return address
        ex1)
            Memory address | function
            0x0004 | def add(int a, int b)
            0x0008 |    c = a + b;
            0x000C |    return c;
            ...
            0x1024 | h = add(4,7)
            0x1028 | ...
            -> 주소 1024에서 가다가 add 함수를 만나 jal func로 0004로 이동한다.
            이때 ra = 1028을 가르키고 있다. 0004 -> 0008 -> 000C에서 return C(jr $ra)로 인하여 1028의 주소로 복귀한다.

    - Floating Point Instructions
    - Pseudo Instructions

\*\*\* Classification by formats - R-format \| op \| rs \| rt \| rd \|
shamt \| funct \| --- \|6\|5\|5\|5\|5\|6\| op : operation code(opcode)
-\> always 0 in R-format rs : first source register number rt : second
source register number rd : destination register number shamt : shift
amout funct : function code (extension opcode) ex) add \$t0, \$s1,
$2  |000000|$s1\|$s2|$t0\|0\|add\| \|000000\|17\|18\|8\|0\|32\|
\|000000\|10001\|10010\|01000\|00000\|100000\|
\|00000010001100100100000000100000\| \|0000 0010 0011 0010 0100 0000
0010 0000\| \|02324020_16\|

    - I-format
        | op | rs | rt | constant or address |
        ---
        |6|5|5|16|
        rt : destination or source register number
        constant : 2^-15 ~ 2^15 - 1
        address : offset added to base address in rs
        
        Pr-7
        C code : A[300] = h + A[300] # h -> $s2
        express the R-format & I-format to hexadecimal
            Ans:
                0x8D2804D0
                0x02484020
                0xAD2804D0 

    - J-format

    - Floating Point Instructions format
