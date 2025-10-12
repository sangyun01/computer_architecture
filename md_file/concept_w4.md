# Arithmetic for Computers

## Addition

### Dealing with Overflow
- Adding positive and negative operands : None  
- Adding two positive operands : Overflow if result sign is **1**  
  → 양수 + 양수 결과의 부호 비트가 1(음수)이면 Overflow  
- Adding two negative operands : Overflow if result sign is **0**  
  → 음수 + 음수 결과의 부호 비트가 0(양수)이면 Overflow  

**Examples**
```
7 + 6 = 13
0111 -> 7
+ 0110 -> 6
------
1101 -> 13

214783647 + 1 = -2 -> Overflow  
(-214783647) + (-214783647) = 0 -> Overflow
```

**주의사항**  
연산 시 반드시 **32bit**로 해야 한다.  
Overflow를 방지하려면 **32bit + 32bit = 33bit**로 계산한다.

---

## Subtraction

Addition과 방법이 유사하다.  
→ a - b = a + (-b)

### Dealing with Overflow
- Subtracting two positive operands : None  
- Subtracting positive from negative operands : Overflow if result sign is **0**  
  → 음수 - 양수 결과의 부호 비트가 0(양수)이면 Overflow  
- Subtracting negative from positive operands : Overflow if result sign is **1**  
  → 양수 - 음수 결과의 부호 비트가 1(음수)이면 Overflow  

즉, **음수를 2의 보수로 변경하여 더하는 연산**을 진행한다.

**Example**
```
7 - 6 = 1
0111 -> 7
0110 = 6 -> 1001 (1의 보수)
1001 + 1 = 1010 (6의 음수 표현)

0111 -> 7
+1010 -> -6
------
1|0001 -> 1  
```

---

## Multiplication

Two types → **분리형**, **결합형**  
구성: multiplicand / multiplier / product  

product = multiplier × multiplicand  

**알고리즘**  
- multiplier의 **LSB**가 1이면 multiplicand를 더하고  
- 0이면 더하지 않는다.  
- 이후 **multiplicand는 left shift**, **multiplier는 right shift**  
- 비트 수만큼 반복한다.

---

### 예제 1 — 분리형

| 단계 | 1st | 2nd | 3rd | 4th |
|------|------|------|------|------|
| **Multiplier** | 1011 | 10110 | 101100 | 1011000 |
| **Multiplicand** | 1100 | 0110 | 0011 | 0001 |
| **Product** | 0000 0000 | 0000 0000 | 0010 1100 | 1000 0100 |

---

### 예제 2 — 분리형

| 단계 | 1st | 2nd | 3rd | 4th |
|------|------|------|------|------|
| **Multiplier** | 1000 | 10000 | 100000 | 1000000 |
| **Multiplicand** | 1001 | 0100 | 0010 | 0001 |
| **Product** | 0000 1000 | 0000 1000 | 0000 1000 | 0100 1000 |

---

### 예제 3 — 결합형

| 단계 | 1st | 2nd | 3rd | 4th |
|------|------|------|------|------|
| **Multiplier** | 1100 | 1100 | 1100 | 1100 |
| **Product** | 0000 1010 → 0000 1010 | 0000 0101 → 1100 0101 | 0110 0010 → 0110 0010 | 0011 0001 → 1111 0001 → 0111 1000 |

**주의사항**  
→ 항상 연산 후에 **shift**를 진행한다.

---

## Division

공식:  
**Dividend = Quotient × Divisor + Remainder**

- 나누기 연산의 경우 **제수(Divisor)**와 **피제수(Dividend)**의 부호가 동일해야 한다.

---

### 예제 1

| 단계 | 1st | 2nd | 3rd | 4th | 5th |
|------|------|------|------|------|------|
| **Remainder** | 0100 1010 | 0100 1010 → 0000 1010 | 0000 1010 | 0000 1010 | 0000 1010 → 0000 0010 |
| **Divisor** | 1000 0000 | 0100 0000 | 0010 0000 | 0001 0000 | 0000 1000 |
| **Quotient** | 0000(neg) | 0001(pos) | 0010(neg) | 0100(neg) | 1001(pos) |

Remainder → 0000 0010  
Divisor → 1000  
Quotient → 1001

---

### 예제 2

| 단계 | 1st | 2nd | 3rd | 4th | 5th |
|------|------|------|------|------|------|
| **Remainder** | 0001 0100 | 0001 0100 → 0000 0100 | 0000 0100 | 0000 0100 → 0000 0000 | 0000 0000 |
| **Divisor** | 0010 0000 | 0001 0000 | 0000 1000 | 0000 0100 | 0000 0010 |
| **Quotient** | 0000(neg) | 0001(pos) | 0010(neg) | 0101(pos) | 1010(neg) |

Remainder → 0000 0000  
Divisor → 0010  
Quotient → 1010
