# Major Formulas in Computer Architecture

## 1. Performance

- **Definition of Response Time (Latency, Execution Time)**

$\text{Performance}_X = \frac{1}{\text{Execution Time}_X}$

- **Relative Performance Comparison**  
When comparing two systems \(X\) and \(Y\):

$\frac{\text{Performance}_X}{\text{Performance}_Y} = \frac{\text{Execution Time}_Y}{\text{Execution Time}_X}$

---

## 2. CPU Time

- **Definition**

$\text{CPU Time} = \text{User CPU Time} + \text{System CPU Time}$

- **Explanation**
  - *User CPU Time*: User mode, running actual instructions of the program  
  - *System CPU Time*: Kernel mode, handling hardware access  
  - In performance analysis, we usually consider **User CPU Time**.

---

## 3. CPU Clocking

- **Clock Frequency and Period**

$\text{Clock Frequency} = \frac{1}{\text{Clock Period}}$

- **Execution Time (= User CPU Time)**

$\text{CPU Time} = \text{CPU Clock Cycles} \times \text{Clock Cycle Time}$

> 총 CPU 작동시간 = 총 CPU 사이클 × 사이클 당 소요시간

---

## 4. CPI (Clock Cycles Per Instruction)

- **Definition**: Average number of cycles each instruction requires

- **Using the concept of CPI**  
  - $\text{CPU Time} = \text{CPU Clock Cycles} \times \text{Clock Cycle Time}$  
  - $\text{CPU Clock Cycles} = \text{Instruction Count} \times \text{CPI}$

- **If each instruction has different cycles**

$\text{Clock Cycles} = \sum_i ( \text{CPI}_i \times \text{Instruction Count}_i )$

- **Conclusion**

$\text{CPU Time} = \text{Instruction Count} \times \text{CPI} \times \text{Clock Cycle Time} = \frac{\text{Instruction Count} \times \text{CPI}}{\text{Clock Rate}}$

Or in ratio form:

$= \left(\frac{\text{Instructions}}{\text{Program}}\right) \times \left(\frac{\text{Clock Cycles}}{\text{Instruction}}\right) \times \left(\frac{\text{Seconds}}{\text{Clock Cycle}}\right)$

---

## 5. Amdahl's Law (Pitfall)

$T_{\text{improved}} = \frac{T_{\text{affected}}}{\text{Improvement Factor}} + T_{\text{unaffected}}$

---

## 6. MIPS (Million Instructions Per Second)

- **Definition**

$\text{MIPS} = \frac{\text{Instruction Count}}{\text{Execution Time} \times 10^6} = \frac{\text{Clock Rate}}{\text{CPI} \times 10^6}$

- **Meaning**: The number of million instructions executed per second.

---
