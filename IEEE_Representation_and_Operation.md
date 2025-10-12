# Arithmetic for Computers

## Representation and Operation

### IEEE Floating Point Format
- **32bit:** Sign(1) | Exponent(8) | Fraction(23)  
- **64bit:** Sign(1) | Exponent(11) | Fraction(52)

---

### Sign Bit
| Value Type | Bit |
|-------------|-----|
| Positive | 0 |
| Negative | 1 |

---

### Exponent
| Format | Bias | Formula |
|---------|------|----------|
| 32bit | 127 | actual exponent = Exponent - Bias |
| 64bit | 1023 | actual exponent = Exponent - Bias |

즉,  
\( Exponent = actual\ exponent + Bias \)

---

### Fraction
- Normalized range: **1.0 ~ 2.0** → 즉 **1.~~**로 시작하는 수이다.

| Example | Normalized form |
|----------|-----------------|
| 0.101 | 1.01 × 2⁻¹ |
| 101.01 | 1.0101 × 2² |

---

## Examples

### Example 1 — Represent **-0.75** in IEEE

(-) → negative → sign bit = **1**  
곱하기 2를 반복하며 변환:
```
0.75(0...) → 1.5(.0..) → 0.5(.1..) → 1.0(.10..) → 0(.1100...)
즉, 0.75 = 0.11
```

```
0.11 = 1.1 × 2⁻¹
fraction = .100000...000
exponent(32bit) = -1 + 127 = 126 → 0111 1110
exponent(64bit) = -1 + 1023 = 1022 → 011 1111 1110
```

| bit | sign | exponent | fraction |
|------|------|-----------|-----------|
| 32bit | 1 | 0111 1110 | 100..0 (0→22EA) |
| 64bit | 1 | 011 1111 1110 | 100..0 (0→51EA) |

---

### Example 2 — Represent **0.625** in IEEE

(+) → positive → sign bit = **0**  
곱하기 2를 반복하며 변환:
```
0.625(0...) → 1.25(.0..) → 0.25(.1..) → 0.5(.1..) → 0.5(.10...) → 1.0(.10..) → 0(.101...)
즉, 0.625 = 0.101
```

```
0.101 = 1.01 × 2⁻¹
fraction = .010000...000
exponent(32bit) = -1 + 127 = 126 → 0111 1110
exponent(64bit) = -1 + 1023 = 1022 → 011 1111 1110
```

| bit | sign | exponent | fraction |
|------|------|-----------|-----------|
| 32bit | 0 | 0111 1110 | 0100..0 (0→21EA) |
| 64bit | 0 | 011 1111 1110 | 0100..0 (0→50EA) |

---

### Example 3 — Represent **-3.75** in IEEE

(-) → negative → sign bit = **1**  
```
3.75 = 3 + 0.75
3 → 11.
0.75 → 1.5(.00..) → 0.5(.10..) → 1.0(.10..) → 0(.1100...)
즉, 3.75 = 11.11
```

```
11.11 = 1.111 × 2¹
fraction = .111000...000
exponent(32bit) = 1 + 127 = 128 → 1000 0000
exponent(64bit) = 1 + 1023 = 1024 → 100 0000 0000
```

| bit | sign | exponent | fraction |
|------|------|-----------|-----------|
| 32bit | 1 | 1000 0000 | 11100..0 (0→20EA) |
| 64bit | 1 | 100 0000 0000 | 11100..0 (0→49EA) |
