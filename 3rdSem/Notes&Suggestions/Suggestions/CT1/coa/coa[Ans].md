# COA CT1 — Complete Answers

> Same questions as `coa[Ans].txt`, formatted for Markdown.
> Complex / uncommon topics are explained in extra depth.
> Diagrams use plain ASCII inside code blocks so they render everywhere.

---

## Part A: 28/07/2026 — Basics, ISA, Control

### Q1. Define the term Control Unit.

Control Unit (CU) is the part of CPU that controls all other parts. It does NOT calculate itself. It tells ALU, memory, I/O what to do and when.

Functions:

1. Fetch instruction from memory.
2. Decode it.
3. Send control signals to ALU, registers, bus.
4. Maintain timing with clock.

Types: Hardwired (fast) and Microprogrammed (flexible). Think of it like traffic police.

### Q2. Discuss any 3 types of memory used in computer.

1. **RAM** — volatile, temporary. Holds running program. Ex: 8 GB DDR4. SRAM (fast, cache) and DRAM (main memory).
2. **ROM** — non-volatile, permanent. Holds boot code (BIOS).
3. **Cache** — very fast, small, between CPU and RAM. Stores frequently used data (L1/L2/L3).

For 5 marks add: Secondary (SSD/HDD, large, slow, permanent) and Registers (smallest, fastest, inside CPU).

### Q3. Basic components of Instruction Execution Cycle.

Also called Fetch-Decode-Execute cycle.

1. **Fetch**: PC holds address. CU fetches instruction to IR. PC = PC + 1.
2. **Decode**: CU decodes opcode, finds operands and addressing mode.
3. **Fetch Operands**: get data from registers / memory if needed.
4. **Execute**: ALU operates or data moves.
5. **Store/Writeback**: result stored.

```text
[PC] -> Fetch -> [IR]
         |
       Decode
         |
   Fetch Operands
         |
      Execute
         |
   Store Result
         |
     (repeat)
```

### Q4. What is Instruction Set Architecture (ISA)?

ISA is the boundary between software and hardware. It defines what the programmer sees:

1. Instructions (`ADD`, `SUB`, `LOAD`, `STORE`).
2. Registers, memory addressing.
3. Data types, addressing modes.
4. I/O handling.

Ex: x86 (Intel), ARM (mobile), RISC-V. ISA does NOT say how it is built (that is microarchitecture).

### Q5. Any 3 common addressing modes with example.

Addressing mode = how to find the operand.

1. **Immediate**: data is in instruction. `MOV R1, #5`
2. **Direct**: address given. `LOAD R1, [100]`
3. **Register**: operand in register. `ADD R3, R1, R2`
4. **Indirect**: address holds address. `MOV R1, @R2`
5. **Indexed**: base + offset for arrays.

### Q6. Use of Implied, Immediate, Stack addressing mode.

1. **Implied**: operand hidden/fixed. No address field. Saves bits. Ex: `CLC`, `RET`.
2. **Immediate**: fast, no memory access. Ex: `MOV R1, #10`. Use for constants.
3. **Stack**: operands on top of stack (`PUSH`/`POP`). 0-address machine. Good for expression evaluation. Ex: `PUSH A, PUSH B, ADD`.

### Q7. Registers initially 0. Find R1 after sequence.

```text
MOV R1, #6
MOV R2, #5
ADD R3, R1, R1
SUB R1, R3, R2
MULT R3, R1, R1
```

**Steps:**

```text
Start: R1=0, R2=0, R3=0
1. MOV R1,#6    -> R1 = 6
2. MOV R2,#5    -> R2 = 5
3. ADD R3,R1,R1 -> R3 = 6+6 = 12
4. SUB R1,R3,R2 -> R1 = 12-5 = 7
5. MULT R3,R1,R1-> R3 = 7*7 = 49, R1 stays 7
Final: R1=7, R2=5, R3=49
```

**Ans. R1 = 7.**

### Q8. RTL method to describe instruction at R1, R2. — *Expanded*

> **Why RTL?** RTL (Register Transfer Language) shows *exact data movement in each clock*. Examiners want `T0, T1...` steps, not just `R1 = R1 + R2`.

Notation: `A <- B` means copy B into A in one clock. `M[X]` means memory at address X.

Example for `ADD R1, R2` (meaning `R1 = R1 + R2`):

```text
T0: MAR <- PC, PC <- PC + 1
T1: IR <- M[MAR], decode ADD
T2: A <- R1        (copy R1 to temp A)
T3: B <- R2        (copy R2 to temp B)
T4: R1 <- A + B    (ALU add, store in R1)
```

Other examples:

- `MOV R1, R2`: `R1 <- R2` (single transfer).
- `LOAD R1, [X]`: `MAR <- X`, then `R1 <- M[MAR]`.

**How to write in exam:** always start with fetch (`MAR, PC, IR`), then show operand fetch, then execute. Mention the temp registers if ALU needs two inputs.

### Q9. Instruction Cycle, Machine Cycle, T-State. — *Expanded*

This is the most confused trio. Think in sizes:

- **T-State = 1 clock pulse.** Smallest unit. One tiny transfer, e.g. put address on bus, or one memory read pulse. Denoted `T1, T2, T3, T4`.
- **Machine Cycle = group of T-states for ONE bus operation.** E.g. Fetch machine cycle = `T1-T4` to fetch opcode. Memory Read / Memory Write / I/O Read are other machine cycles.
- **Instruction Cycle = full Fetch + Decode + Execute of ONE instruction.** Made of several machine cycles: `M1 (fetch) + M2 (decode/read) + M3 (execute/write)`.

```text
T - T - T - T  = 1 Machine Cycle (e.g. Fetch)
M1 + M2 + M3   = 1 Instruction Cycle
```

Concrete example — `ADD R1, [100]` might take:

```text
M1 (Fetch, 4 T-states): get opcode
M2 (Read, 3 T-states): read Memory[100]
M3 (Execute, 2 T-states): ALU add + store
Instruction Cycle = M1+M2+M3 = 9 T-states total
```

**One-line memory trick:** `T < M < I` (clock < bus-operation < full instruction).

### Q10. Compare Hardware vs Microprogrammed CU.

| Hardware CU | Microprogrammed CU |
|-------------|--------------------|
| Made of gates, flip-flops | Made of memory (control store) |
| Fast | Slower |
| Hard to change (rewire) | Easy to change (rewrite code) |
| RISC uses this | CISC uses this |
| Costly for complex | Cheap for complex |
| No control memory | Needs control memory |

### Q11. Why memory is organized as hierarchy?

CPU is fast, disk is large but slow. No single memory is fast + large + cheap, so we layer them. Top is fast/small/costly, bottom is slow/large/cheap. Uses *locality* (programs reuse nearby data).

```text
Registers (KB, fastest)
    |
Cache L1/L2/L3
    |
Main Memory RAM (GB)
    |
SSD / HDD (TB, slow)
    |
Tape / Cloud (slowest)
```

Average speed ≈ cache, average cost ≈ disk, size ≈ disk.

### Q12. Advantages and disadvantages of RISC.

RISC = Reduced Instruction Set, simple fixed instructions, LOAD/STORE only.

Advantages: fast (1 per cycle, pipelining), simple hardware, less power (ARM), easy compiler optimization.
Disadvantages: more instructions per task, larger code, needs many registers and good compiler.

### Q13. LOAD and STORE architecture.

Rule: only `LOAD`/`STORE` touch memory. All ALU ops use registers. Ex: `LOAD R1,[X], ADD R3,R1,R2, STORE [Y],R3`. Pros: simple, fast pipeline. Cons: more instructions, needs many registers.

### Q14. Why stack is not generally implemented using processor register file? — *Expanded*

1. **Depth unknown.** Calls nest deep + interrupts. Register file has only 16–32 entries.
2. **Need auto pointer.** Stack needs `PUSH/POP` with auto `SP`. Registers need explicit address each time.
3. **Overflow risk.** Deep recursion would overflow registers, but memory stack is MBs/GBs.
4. **Cost.** So stack lives in memory + `SP` register tracks top. Some CPUs cache top 1–2 stack entries in registers for speed, but backing store is memory.

### Q15. Role of stack in subroutine.

1. Saves return address (`CALL` pushes PC, `RET` pops PC).
2. Saves registers.
3. Passes parameters + local variables (stack frame).
4. Supports nesting/recursion (each call gets new frame).

### Q16. Different types of ROMs.

1. **PROM**: write once.
2. **EPROM**: erase by UV, re-write.
3. **EEPROM**: erase electrically.
4. **Flash**: fast EEPROM, block erase (pen drive).
5. **Mask ROM**: factory fixed, cheapest for mass. All non-volatile.

### Q17. Computer Organization vs Architecture.

- **Architecture (WHAT)**: programmer view — ISA, registers, addressing. Ex: Intel vs ARM.
- **Organization (HOW)**: hardware implementation — ALU design, pipeline, cache size. Ex: how ADD is done.
- Same architecture (x86) can have different organization (i5 vs i7).

### Q18. Block diagram of digital computer.

```text
        +--------------+
        | INPUT (kbd)  |
        +------+-------+
               |
        +------v-------+
        |   MEMORY     |
        | RAM+ROM+Cache|
        +------+-------+
               |
 +-------------+-------------+
 |            CPU            |
 | +--------+  +---------+  |
 | |   CU   |<>|  ALU    |  |
 | +--------+  +---------+  |
 |      ^      +---------+  |
 |      |      | REGS    |  |
 |      +------+         |  |
 +---------------------------+
               |
        +------v-------+
        |OUTPUT (scr)  |
        +--------------+
```

1. Input: takes data. 2. Memory: stores program+data. 3. CU: controls flow. 4. ALU: arithmetic/logic. 5. Registers: fast temp. 6. Output: shows result. 7. Buses connect all.

### Q19. 3, 2, 1, 0 address instructions.

- **3-address**: `ADD R3,R1,R2`. Short program, many bits.
- **2-address**: `ADD R1,R2` (= R1+R2). Destroys one input.
- **1-address**: Accumulator. `LOAD A, ADD X`.
- **0-address**: Stack. `PUSH A, PUSH B, ADD`.

### Q20. RISC vs CISC.

| RISC | CISC |
|------|------|
| Few simple instr | Many complex instr |
| Fixed length | Variable length |
| LOAD/STORE only | Memory direct allowed |
| Many registers | Few registers |
| Hardwired CU | Microprogrammed CU |
| Ex: ARM, RISC-V | Ex: x86 Intel |

### Q21. Harvard vs Von Neumann.

- **Von Neumann**: ONE memory for code+data, one bus. Simple, cheap, bottleneck.
- **Harvard**: SEPARATE code/data memory + buses. Fast parallel fetch. Used in microcontrollers and split cache.

```text
Von Neumann:
 CPU <--bus--> [Mem: Code+Data]

Harvard:
 CPU <--bus1--> [Code Mem]
 CPU <--bus2--> [Data Mem]
```

Modern PC = Von Neumann outside, Harvard inside (split I/D cache).

---

## Part B: 26/08/2026 — Arithmetic, IEEE, Adders

### Q22. Fixed point vs floating point.

- **Fixed**: decimal point fixed. Fast, small range. Use: DSP, money. Ex: `5.75 = 0101.11`.
- **Floating**: `M × B^E`. Large range, IEEE 754. Use: science, graphics. Needs FPU, rounding error possible. Ex: `5.75 = 1.4375 × 2^2`.

### Q23. Overflow and underflow. — *Expanded*

- **Overflow**: result too LARGE to fit. Ex: 8-bit signed max 127, `100+50=150` wraps to −106. Detected by `carry-in != carry-out` at MSB, sets `V` flag. Fix: bigger width or saturation.
- **Underflow** (two meanings):
  1. Integer: borrow, e.g. `0 − 1` in unsigned 8-bit → 255.
  2. Floating: result too SMALL (near zero), smaller than smallest normal → becomes 0 or denormal. Ex: `1e-40 / 1e10` in single precision underflows.

### Q24. Ripple Carry vs Carry Lookahead Adder.

| RCA | CLA |
|-----|-----|
| Carry ripples one by one | Carry computed in parallel (G,P) |
| Slow O(n), simple | Fast O(log n), complex |
| Few gates | Many gates |
| Use: small/slow | Use: CPU ALU |

### Q25. Convert 10.625 to IEEE 754 single + double. — *Expanded*

**Step 1 — Binary:**

```text
10 = 1010, 0.625 = 0.101 (0.5 + 0.125)
So 10.625 = 1010.101
```

**Step 2 — Normalize (form 1.xxx × 2^e):**

```text
1010.101 = 1.010101 x 2^3
e = 3, mantissa bits = 010101...
```

**Step 3a — Single (32-bit: 1 sign + 8 exp + 23 mantissa, bias 127):**

```text
Sign = 0
Exp = 127+3 = 130 = 10000010
Mantissa = 010101 + 17 zeros (23 bits)
Bits: 0 | 10000010 | 01010100000000000000000
Hex = 0x412A0000
```

**Step 3b — Double (64-bit: 1 + 11 + 52, bias 1023):**

```text
Sign = 0
Exp = 1023+3 = 1026 = 10000000010
Mantissa = 010101 + 46 zeros
Hex = 0x4025400000000000
```

### Q26. Signed Magnitude vs 2's Complement.

- **Signed Mag**: MSB = sign. `+5=0101, −5=1101`. Two zeros. Needs separate add logic.
- **2's Comp**: negative = invert + 1. `−5 = 1011`. One zero. Same circuit for add/sub. Bigger range (−8 to +7 vs −7 to +7 for 4-bit). Modern CPUs use 2's complement.

### Q27. Any one method of binary division.

**Restoring Division** (like long division): shift left, subtract divisor, if negative restore and `Q0=0`, else `Q0=1`. Example `7/3 (0111/0011)`: `A=0000, Q=0111, M=0011`, loop 4 times. Result `Q=0010 (2), A=0001 (rem 1)`. Non-restoring is faster (no restore, add next step).

### Q28. NaN and +Infinity in IEEE 754. — *Expanded*

Single = 1 sign + 8 exp + 23 mantissa. When exp = 255 (all 1), value is special:

| Exp | Mantissa | Means |
|-----|----------|-------|
| 255 | 0 | Infinity (`+INF=0x7F800000`, `−INF=0xFF800000`). From `1/0`, overflow. |
| 255 | non-zero | NaN (Not a Number). From `0/0`, `sqrt(−1)`. Quiet vs Signaling. |
| 0 | 0 | Zero (±0). |
| 0 | non-zero | Denormal (tiny numbers). |

**Intuition:** Infinity = too big to represent, NaN = meaningless result. Any operation with NaN gives NaN. `INF − INF` = NaN.

### Q29. 16-bit custom float (1 sign + 6 exp + 9 mantissa). Represent −1.6 × 10^63. — *Expanded*

```text
Bias = 2^(6-1) - 1 = 31
Max usable biased exp = 62 (63 reserved for INF/NaN)
True max exp = 62 - 31 = 31
Max value ~ 2^32 ~ 4.29 x 10^9
Wanted: 1.6 x 10^63 ~ 2^209 (since 10^63 ~ 2^209)
Needed exp 209 >> 31 -> OVERFLOW
Representation = -Infinity:
 S=1, E=111111, M=000000000
 Bits: 1 111111 000000000 = 0xFC00
```

If the question meant a small value like −1.61063 ≈ `−1.10011 × 2^0`: `S=1, E=31=011111, M=100110...`. Show bias calc + comparison for full marks even if overflow.

### Q30. Best/worst case of Booth's algorithm. — *Expanded*

Booth looks at pairs `Q0, Q-1` and skips runs of 0s/1s with only shifts.

- **Best case**: long runs of 0s or 1s. Ex: `01111000` needs only 2 add/sub instead of 4. Few `0→1` / `1→0` transitions.
- **Worst case**: alternating `010101...`. Every bit causes add or sub. Same or slower than normal shift-add.
- Modern Booth-2/Booth-3 recodes multiple bits to reduce worst case. In exam: draw one best and one worst example string.

### Q31. Find value in IEEE single precision format. (Generic method)

1. Split: `S (1) | E (8) | M (23)`.
2. `Exp_true = E_biased − 127`.
3. `Value = (−1)^S × 1.M × 2^Exp_true`.

Example `0x412A0000` = `0 10000010 010101...`: `S=0, E=130, M=1.010101`, `Exp=3`, value = `1.010101 × 2^3 = 1010.101 = 10.625`. If `E=255,M=0` → INF; `E=255,M≠0` → NaN; `E=0` → denormal/zero.

### Q32. 4-bit Ripple Carry Adder.

```text
A3B3   A2B2   A1B1   A0B0
  |      |      |      |
 FA3 <- FA2 <- FA1 <- FA0
  |      |      |      |
  S3     S2     S1     S0
 C4 <--- C3 <-- C2 <-- C1 <-- C0=0
```

Each FA: `Si = Ai xor Bi xor Ci`, `Ci+1 = AiBi + Ci(Ai xor Bi)`. Carry ripples 0→4. Delay = 4 × FA. Simple but slow.

### Q33. Flowchart for Booth multiplication.

```text
 START
   |
 A=0, Q=multiplier, M=multiplicand
 Q-1=0, Count=n
   |
 +--<Count>0?--No--> STOP (Ans=A,Q)
 |     |
 |    Yes
 |     |
 |   Q0,Q-1 = ?
 |   00/11: ASR(A,Q,Q-1)
 |   01: A=A+M, then ASR
 |   10: A=A-M, then ASR
 |     |
 |   Count--
 |     |
 +-----+
```

ASR = arithmetic shift right (sign kept). `n` steps for `n`-bit numbers.

### Q34. Solve 14/3 using restoring and non-restoring. — *Expanded*

`14=1110, 3=0011`, 4-bit. Expected `Q=0100 (4), R=0010 (2)`, check `3×4+2=14`.

**Restoring** (`A=0000, Q=1110, M=0011`): repeat 4× — shift AQ left, `A=A−M`. If `A<0` restore (`A=A+M`, `Q0=0`), else `Q0=1`. After 4 cycles `Q=0100, A=0010`.

**Non-restoring**: same start, but if `A<0`, do NOT restore. Next step ADD M instead of SUB. Rule: if `A≥0`: shift, SUB; if `A<0`: shift, ADD. Final correction: if `A<0`, `A=A+M`. Same answer, fewer adds.

> Exam tip: draw a 4-row table with columns `Cycle | A | Q | Action`. Final Q/R line alone gets step marks.

### Q35. M=0110 (6), Q=0011 (3), Booth's algorithm.

`M=0110, −M=1010`, `n=4`:

```text
Init: A=0000, Q=0011, Q-1=0
C1: 10 -> A=A-M=1010, ASR -> A=1101,Q=0001,Q-1=1
C2: 11 -> ASR only      -> A=1110,Q=1000,Q-1=1
C3: 01 -> A=A+M=0100,ASR-> A=0010,Q=0100,Q-1=0
C4: 00 -> ASR only      -> A=0001,Q=0010,Q-1=0
Result: A_Q = 0001 0010 = 18. So 6x3=18.
```

### Q36. How non-restoring is derived from restoring? — *Expanded*

Restoring wastes one add (subtract, then add back when `A<0`). Observe two steps combined:

```text
Restore: A = A + M, then next: A = 2A - M
Combined: A = 2(A+M) - M = 2A + M
```

So instead of restoring, keep negative A and next cycle do `A = 2A + M` (shift then ADD). One operation saved per 0-bit. Needs final correction if A negative at end. Same hardware + mux, faster.

### Q37. Propagation delay + reduce with CLA. — *Expanded*

- **Propagation delay** = time for an input change to appear at output. Each gate adds ns. Total = gates on longest (critical) path.
- In RCA, carry must ripple through `n` full adders, so delay = `n × t_FA` (~2n gate levels). 32-bit RCA is ~64 levels — too slow for CPU clock.
- CLA computes all carries in parallel with Generate/Propagate logic (2-level AND-OR), so delay ≈ 2–3 gates independent of `n` for a 4-bit block. Bigger widths use grouped/hierarchical CLA.

### Q38. Why CLA is called fast parallel adder?

Because it does NOT wait for previous carry. All `C1..C4` are made together from inputs using G,P equations. Parallel = O(1) delay vs RCA O(n). 4/16/32-bit addition takes almost same short time. Cost: more gates.

### Q39. Carry generation equation for 4-bit CLA. — *Expanded*

For bit `i`: `Gi = Ai · Bi` (this bit *creates* a carry alone), `Pi = Ai xor Bi` (this bit *passes* incoming carry forward). `C0` given.

```text
C1 = G0 + P0·C0
C2 = G1 + P1·G0 + P1·P0·C0
C3 = G2 + P2·G1 + P2·P1·G0 + P2·P1·P0·C0
C4 = G3 + P3·G2 + P3·P2·G1 + P3·P2·P1·G0
     + P3·P2·P1·P0·C0
Sum: Si = Pi xor Ci
```

All C in 2 levels (AND then OR). Read `C2` as: carry out of bit 1 exists if bit 1 generates, OR bit 1 passes what bit 0 generated, OR both pass `C0`.

### Q40. From full adder, define Gi, Pi, parallel use.

Full adder carry: `Ci+1 = AiBi + Ci(Ai+Bi)`. Define `Gi = Ai·Bi`, `Pi = Ai xor Bi`. Then `Ci+1 = Gi + Pi·Ci`. Expand as in Q39 to get all C without waiting. Hardware: G,P in 1 gate, 2-level AND-OR for each C, XOR for sum. Parallel because Ci needs only original A,B,C0, not Ci−1 output.

### Q41. Advantages/disadvantages of Booth.

Advantages: fewer adds for runs of 1s, handles signed directly, regular VLSI structure.
Disadvantages: worst case (`0101...`) slower, needs extra `Q-1` + control + ASR, variable data-dependent time unless modified Booth.

---

> Exam tips:
>
> 1. For 5 marks always draw FIG. + 4–5 lines.
> 2. For numericals show STEPS table, final Q/R or Hex.
> 3. Use same headings in exam for readability.
