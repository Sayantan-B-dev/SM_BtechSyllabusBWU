# ALU Testbench and Simulation Methodology with HDL

**Course:** Computer Organization and Architecture Lab  
**Module:** 4 | **Lecture:** 5  
**Date:** 03-Oct-2026  
**Faculty:** DR. SUBHANKAR SHOME  
**CO:** CO 4  
**Learning Methodology:** Simulation  
**Reference:** Book & Lab Manual

## Lab Objectives

- Write a self-checking testbench using assert statements.
- Cover all ALU opcodes with directed + edge-case vectors.
- Read waveforms: verify result 1 delta after select changes.

## Theory

A **directed testbench** drives known inputs and checks outputs with `assert`. A **self-checking** testbench counts errors instead of relying on visual waveform inspection.

**Test plan for 3-bit sel ALU (8 ops):**
1. Two normal vectors per opcode (e.g. A=20/B=10, A=240/B=15).
2. Edge vectors: A=0/B=0, A=255/B=255, A=255/B=1.
3. Flag checks on arithmetic ops (zero, carry).

## VHDL Code

```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_alu_selfcheck is
end entity;

architecture sim of tb_alu_selfcheck is
  signal a, b   : std_logic_vector(7 downto 0) := (others => '0');
  signal sel    : std_logic_vector(2 downto 0) := (others => '0');
  signal result : std_logic_vector(7 downto 0);
  signal errors : integer := 0;

  procedure check(got, expected : std_logic_vector(7 downto 0);
                  msg : string;
                  signal err : inout integer) is
  begin
    if got /= expected then
      report "FAIL: " & msg & " got=" &
        integer'image(to_integer(unsigned(got))) & " exp=" &
        integer'image(to_integer(unsigned(expected))) severity error;
      err <= err + 1;
    end if;
  end procedure;
begin
  uut: entity work.alu_8bit
    port map (a => a, b => b, sel => sel, result => result);

  process begin
    a <= x"14"; b <= x"0A";          -- 20, 10
    sel <= "000"; wait for 10 ns;    -- ADD
    check(result, x"1E", "20+10", errors);
    sel <= "001"; wait for 10 ns;    -- SUB
    check(result, x"0A", "20-10", errors);
    sel <= "010"; wait for 10 ns;    -- AND
    check(result, x"00", "20 AND 10", errors);
    sel <= "011"; wait for 10 ns;    -- OR
    check(result, x"1E", "20 OR 10", errors);

    a <= x"FF"; b <= x"01";
    sel <= "000"; wait for 10 ns;    -- 255+1 = 0 (wrap)
    check(result, x"00", "255+1 wrap", errors);

    a <= x"00"; b <= x"00";
    sel <= "001"; wait for 10 ns;    -- 0-0 = 0
    check(result, x"00", "0-0", errors);

    report "Simulation finished with " &
      integer'image(errors) & " errors." severity note;
    wait;
  end process;
end architecture;
```

## Procedure

1. Compile `alu_8bit.vhd` then `tb_alu_selfcheck.vhd`.
2. Simulate for 100 ns; watch `result` settle after each `sel` change.
3. Check transcript: zero `FAIL` lines and final `0 errors` note.
4. Add one vector of your own (e.g. shift ops) with a `check` call.

## Expected Output / Waveform

```
# Simulation finished with 0 errors.
A=14 B=0A sel=000 | result=1E
A=14 B=0A sel=001 | result=0A
A=FF B=01 sel=000 | result=00
```

## Conclusion

Self-checking testbench methodology verified: all directed vectors pass, and the error counter gives a single pass/fail verdict without manual waveform reading.
