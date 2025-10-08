# Computer Architecture Summary

---

## 🔸 APP ↔ System Software(OS) ↔ Hardware

시스템은 **애플리케이션 ↔ 시스템 소프트웨어 ↔ 하드웨어**의 계층 구조로 구성된다.

### System Software의 구성
1. **Compiler**
   - HLL(High-Level Language) 코드를 Machine Code로 번역
   - 예: HLL 코드(C언어) → Binary 코드
   - 대표 예시: **GCC**

2. **Operating System (OS)**
   - Service code를 제공 (예: Linux, Windows)
   - 주요 기능  
     - **Handling input/output**  
     - **Managing memory and storage**  
     - **Scheduling tasks & sharing resources**
   - 암기 → OS는 “Handling, Managing, Scheduling”, 즉 복잡한 처리를 담당한다.

---

## 🔸 Components of a Computer

### 1. Input / Output
- **User-interface devices**: 키보드, 마우스 등 입력 장치  
- **Storage devices**: Disk(SSD, HDD) → Memory로 데이터 전송  
- **Network adapters**: 통신 기능 담당

---

### 2. Memory

| 구분 | 설명 | 예시 |
|------|------|------|
| **Primary (Main) Memory** | CPU가 직접 접근하는 휘발성 메모리 (DRAM) | RAM |
| **Secondary Memory** | 보조기억장치로 비휘발성이며 접근속도 느림, CPU 직접 접근 불가 (Disk → RAM으로 Load 필요) | SSD, HDD |
| **Cache Memory** | 휘발성이며, 자주 쓰는 데이터를 CPU 내부/근처에 저장해 속도 향상 | L1, L2, L3 Cache |
| **ROM** | 부팅에 필요한 최소 데이터(BIOS)를 저장하는 비휘발성 메모리 | BIOS ROM |

---

### 3. Processor (CPU)

#### ✅ 구성
- **Datapath** : 실제 데이터 연산 수행  
  - 구성요소: ALU, Registers, MUX, Buses
- **Control Unit** : 메모리에서 가져온 명령어를 해석(Decode)하고 제어신호 생성  
  → Datapath의 동작을 지시함.

#### 요약
> CPU에 들어온 명령어를 Control Unit에서 해석(Decode)하고,  
> 그 명령어에 따라 Datapath가 산술 연산, 논리 연산, 데이터 이동·저장 등을 수행한다.

---

## 🔸 ISA (Instruction Set Architecture)

- **정의**: Hardware와 Low-level Software 간의 인터페이스
- **특징**
  - 매우 중요한 **추상화(abstraction)** 계층
  - 하드웨어 세부구조를 몰라도 소프트웨어 작성 가능
  - **Portability (이식성)**  
    - 하드웨어가 바뀌어도 소프트웨어 수정 없이 실행 가능  
    - 예: Word, Excel(x86 버전)은 Windows와 Mac(Intel)에서 동일하게 작동 → ✅ Portability  
      한글은 Mac(ARM 구조)에선 별도 설치 필요 → ❌ Portability
  - **Contract (규약)**  
    - 명령 실행 방식, 사용 가능한 레지스터, 데이터 접근/조작 방법을 정의

---

## 🔸 Moore’s Law

> **IC(집적회로) 용량은 18~24개월마다 약 2배로 증가한다.**

- 1~2년 주기로 트랜지스터 수가 2배 → 성능 2배, 비용 절반
- 반도체 발전 속도를 나타내는 경험적 법칙

---

## 🔸 Performance (성능)

| 용어 | 의미 |
|------|------|
| **Response time** | 사용자 관점의 총 실행시간 |
| **Latency** | 지연 시간 |
| **Execution time** | 실제 실행 시간 |

\[
\text{Response time} = \text{Latency} + \text{Execution time}
\]

- 성능은 **실행시간이 짧을수록** 좋음  
  → \[
  \text{Performance} = \frac{1}{\text{Execution time}}
  \]

### 프로세스 간 비교
\[
\frac{Performance_A}{Performance_B} = \frac{Execution_B}{Execution_A} = n
\]
- n < 1 → B가 (1/n)배 더 성능이 좋다.  
- n = 1 → 성능 동일  
- n > 1 → A가 n배 더 성능이 좋다.

---

## 🔸 Elapsed Time vs CPU Time

| 용어 | 관점 | 의미 |
|------|------|------|
| **Elapsed Time** | 시스템 관점 | 프로그램 시작~종료까지 전체 시간 |
| **CPU Time** | CPU 관점 | CPU가 실제 처리한 시간 |
|  |  | \[
CPU\ Time = User\ CPU\ Time + System\ CPU\ Time
\] |

따라서,
\[
Response\ Time = Latency + User\ CPU\ Time + System\ CPU\ Time
\]

---

## 🔸 CPU Time 계산

### Clock 개념
| 항목 | 단위 | 관계 |
|------|------|------|
| **Clock Frequency (Clock Rate)** | [Hz] | \( f = \frac{1}{T} \) |
| **Clock Period** | [s] | \( T = \frac{1}{f} \) |

### CPU Time 계산식
\[
CPU\ Time = CPU\ Clock\ Cycles \times Clock\ Cycle\ Time = \frac{CPU\ Clock\ Cycles}{Clock\ Frequency}
\]

\[
Response\ Time = Latency + CPU\ Clock\ Cycles \times Clock\ Cycle\ Time + System\ CPU\ Time
\]

---

## 🔸 CPI (Clock Cycles Per Instruction)

- 명령어 1개를 실행하는 데 필요한 평균 클록 사이클 수  
- 예: `mul` 명령어의 CPI = 4  
- \[
CPU\ Clock\ Cycles = CPI \times Instructions
\]

여러 명령어의 합은 **superposition**으로 더할 수 있다.  
\[
Average\ CPI = \frac{Total\ CPI}{Instructions}
\]

따라서,
\[
Response\ Time = Latency + CPI \times Instructions \times Clock\ Cycle\ Time + System\ CPU\ Time
\]

---

## 🔸 MIPS (Millions of Instructions Per Second)

> 초당 실행 가능한 명령어 수 (단위: 백만 개, Million)

\[
MIPS = \frac{Instructions}{Execution\ Time \times 10^6}
\]

- CPU가 1초에 몇 백만 개의 명령어를 처리할 수 있는지를 나타냄.
- 값이 높을수록 일반적으로 빠르지만, ISA별 명령 복잡도에 따라 실제 성능 비교에는 한계가 있음.

---