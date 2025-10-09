# Instructions : Language of the Computer

## Instruction SET

### Classification by types

#### Arithmetic Instruction

one destination + Two sources

**ex.**

``` mips
add a, b, c # a = b + c
```

**Pr-1**<br>
Given the C code below, write the compiled MIPS code.

``` c
1) a = b + c + d;
2) f = (g + h) - (i + j);
```

#### Using Register Operands

-   32 * 32bit<br>
    → why 32bit : reason why MIPS using Word size => 4byte = 32bit
-   **Temporary Registers** : `$t0` ~ `$t9` → 계산 시 임시로 사용하는
    값들
    -   `$t0`~`$t7` : reg's 8--15<br>
    -   `$t8`~`$t9` : reg's 24--25
-   **Saved Registers** : `$s0` ~ `$s7` → 보존해야 하는 값들
    -   `$s0`~`$s7` : reg's 16--23

**Pr-2**<br>
Given the C code below, write the compiled MIPS code (access variables
via register operands).

``` c
1) f = (g + h) - (i + j);  // f, g, h, i, j stored in $s0..$s4
```

------------------------------------------------------------------------

### Memory Instructions

-   Using Memory Operands
-   Arithmetic Operations require Data Transfer Instructions
-   To access memory, need memory address

#### Endian

-   **Big Endian** : MSB → low, LSB → high
-   **Little Endian** : LSB → low, MSB → high

#### Memory Operand

``` mips
lw dest, offset(base)
```

#### Immediate Operand

``` mips
add $s3, $s3, -4  # usually using loop memory access
```

`$zero` means 0 → usually used for data copy

------------------------------------------------------------------------

### Practice Problems

**Pr-3**<br>
Given a 32-bit (4-byte) integer value `0x12345678` and memory address
0--3, compare 'Big Endian' vs. 'Little Endian'.

| Address | Big | Little |
|----------|-----|--------|
| 0 | 12 | 78 |
| 1 | 34 | 56 |
| 2 | 56 | 34 |
| 3 | 78 | 12 |

**Pr-4**  
Value = `0x34125678`, memory address 0–3  

| Address | Big | Little |
|----------|-----|--------|
| 0 | 34 | 78 |
| 1 | 12 | 56 |
| 2 | 56 | 12 |
| 3 | 78 | 34 |

---

**Pr-4′**  
Two consecutive 32-bit integer values (`0x12345678` and `0x34125678`)  
stored in address 0–7.  

| Address | Big | Little |
|----------|-----|--------|
| 0 | 12 | 78 |
| 1 | 34 | 56 |
| 2 | 56 | 34 |
| 3 | 78 | 12 |
| 4 | 34 | 78 |
| 5 | 12 | 56 |
| 6 | 56 | 12 |
| 7 | 78 | 34 |


**Pr-5**

``` c
g = h + A[8];  // A: array, g in $s1, h in $s2, base address of A in $s3
```

**Pr-6**

``` c
A[12] = h + A[8];  // h in $s2, base address of A in $s3
```

------------------------------------------------------------------------

### 2's Complement Signed Integers

$$x = -x_{n-1}2^{n-1} + x_{n-2}2^{n-2} + ... + x_0 2^0$$

**The range is:**

$$
-2^{(n-1)} \sim 2^{(n-1)} - 1
$$


**Negative value** → MSB = 1 (sign bit)

**Example**<br>
-10 → 10 → 1010₂ → 1's: 0101 → 2's: 0110

------------------------------------------------------------------------

### MIPS Instruction Set

  Instruction    Extended Field         Description
  -------------- ---------------------- ------------------------
  `addi`         immediate              extend immediate value
  `lb`, `lh`     loaded byte/halfword   sign-extend
  `beq`, `bne`   displacement           extend displacement

**ex)**

``` text
lb
  2  -> 0000 0010 (02) => 0000 ... 0000 0010 (0x0000_0002)
 -2  -> 1111 1110 (FE) => 1111 ... 1111 1110 (0xFFFF_FFFE)
lh
  2  -> 0000 0000 0000 0010(0002) => 0000 ... 0000 0010 (0x0000_0002)
 -2  -> 1111 1111 1111 1110(FFFE) => 1111 ... 1111 1110 (0xFFFF_FFFE)
```

------------------------------------------------------------------------

### Logical Instructions
| Operation     | C    | MIPS        |
|----------------|------|-------------|
| Shift Left     | <<   | sll         |
| Shift Right    | >>   | srl         |
| Bitwise AND    | &    | and, andi   |
| Bitwise OR     | \|   | or          |
| Bitwise NOT    | ~    | nor         |

-   **sll** : Shift Left Logical → ×2<br>
-   **srl** : Shift Right Logical → ÷2

**Example -- AND**

``` mips
and $t0, $t1, $t2
```

    $t2 : 0000 0000 0000 0000 0000 1101 1100 0000
    $t1 : 0000 0000 0000 0000 0011 1100 0000 0000
    $t0 : 0000 0000 0000 0000 0000 1100 0000 0000

**Example -- OR**

``` mips
or $t0, $t1, $t2
```

    $t2 : 0000 0000 0000 0000 0000 1101 1100 0000
    $t1 : 0000 0000 0000 0000 0011 1100 0000 0000
    $t0 : 0000 0000 0000 0000 0011 1101 1100 0000

**Example -- NOT**

``` mips
nor $t0, $t1, $zero  # why nor? because B=0($zero)
# if A=0 → ~(0|0)=1
# if A=1 → ~(1|0)=0
```

    $t1 : 0000 0000 0000 0000 0011 1100 0000 0000
    $t0 : 1111 1111 1111 1111 1100 0011 1111 1111

------------------------------------------------------------------------

### Conditional Instructions (조건 분기)

``` mips
beq rs, rt, L1   # if (rs == rt) → jump to L1
bne rs, rt, L1   # if (rs != rt) → jump to L1
j L1             # unconditional jump
```

**Set-on-Less-Than Instructions**

``` mips
slt rd, rs, rt     # if (rs < rt) → rd=1 else 0
slti rt, rs, const # if (rs < const) → rt=1 else 0
sltu rd, rs, rt    # unsigned
```

**Example**

    $s0 = 1111...1111
    $s1 = 0000...0001
    slt  $t0, $s0, $s1   # s0=-1, s1=1 → t0=1
    sltu $t0, $s0, $s1   # s0=2^32-1, s1=1 → t0=0

**Pr-8**

``` c
if (i == j)
    f = g + h;
else
    f = g - h;
```

**Pr-9**

``` c
while (save[i] == k)
    i += 1;
```

-   i in \$s3, k in \$s5, address in \$s6

------------------------------------------------------------------------

### Branch / Jump Instructions

  Register   역할
  ---------- -----------------
  PC         Program Counter
  sp         Stack Pointer
  ra         Return Address

**Example**

    0x0004 | def add(int a, int b)
    0x0008 |   c = a + b;
    0x000C |   return c;
    ...
    0x1024 | h = add(4,7)
    0x1028 | ...

→ 주소 1024에서 `jal func` 실행 → 0004로 이동<br>
→ `$ra = 1028`을 가리킴<br>
→ 0004 → 0008 → 000C → `jr $ra`로 복귀 (1028)

------------------------------------------------------------------------

### Classification by Formats

#### R-format

  op   rs   rt   rd   shamt   funct
  ---- ---- ---- ---- ------- -------
  6    5    5    5    5       6

-   `op` : opcode (R-format에서는 항상 0)<br>
-   `rs` : first source register<br>
-   `rt` : second source register<br>
-   `rd` : destination register<br>
-   `shamt` : shift amount<br>
-   `funct` : function code (extension opcode)

**Example — R-format (`add $t0, $s1, $s2`)**

| 구분 | 내용 |
|------|------|
| Instruction | `add $t0, $s1, $s2` |
| Field 구분 | \|000000\|$s1\|$s2\|$t0\|0\|add\| |
| Field (10진수) | \|000000\|17\|18\|8\|0\|32\| |
| Field (2진수) | \|000000\|10001\|10010\|01000\|00000\|100000\| |
| 전체 비트열 | 00000010001100100100000000100000 |
| 4비트 구분 | 0000 0010 0011 0010 0100 0000 0010 0000 |
| 16진수 표현 | 0x02324020 |

#### I-format

  op   rs   rt   constant or address
  ---- ---- ---- ---------------------
  6    5    5    16

-   `rt`: destination or source register<br>
-   `constant`: 2\^-15 ~ 2\^15 - 1<br>
-   `address`: offset added to base address in `rs`

**Pr-7**

``` c
A[300] = h + A[300]  // h -> $s2
```

**Answer**

    0x8D2804D0
    0x02484020
    0xAD2804D0

#### J-format

*(설명 생략)*

#### Floating Point Instructions Format

*(설명 생략)*
