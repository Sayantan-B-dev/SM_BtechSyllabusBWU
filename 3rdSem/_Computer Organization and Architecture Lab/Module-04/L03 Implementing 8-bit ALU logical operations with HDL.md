# Implementing 8-bit ALU Logical Operations with HDL

**Course:** Computer Organization and Architecture Lab  
**Module:** 4 | **Lecture:** 3  
**Date:** 02-Oct-2026  
**Faculty:** DR. SUBHANKAR SHOME  
**CO:** CO 4  
**Learning Methodology:** Simulation  
**Reference:** Book & Lab Manual

## Lab Objectives

- Implement AND, OR, XOR, NOT operations for 8-bit operands in VHDL.
- Understand bitwise vs logical operation on vectors.
- Simulate with complementary patterns (e.g. 0xF0 vs 0x0F).

## Theory

**Bitwise operations** apply independently to each bit position `i`: `result(i) = a(i) OP b(i)`. In VHDL `std_logic_1164`, `and`/`or`/`xor` work element-wise on vectors of equal length, while `not` is unary.

**Operation table (sel):**

| sel | Operation | Expression |
|---|---|---|
| 000 | AND | a AND b |
| 001 | OR | a OR b |
| 010 | XOR | a XOR b |
| 011 | NOT A | NOT a |
| 100 | NAND | NOT (a AND b) |
| 101 | NOR | NOT (a OR b) |

## VHDL Code

```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_logic_8bit is
  port (
    a      : in  std_logic_vector(7 downto 0);
    b      : in  std_logic_vector(7 downto 0);
    sel    : in  std_logic_vector(2 downto 0);
    result : out std_logic_vector(7 downto 0)
  );
end entity;

architecture behavioral of alu_logic_8bit is
begin
  process (a, b, sel)
  begin
    case sel is
      when "000" => result <= a AND b;
      when "001" => result <= a OR b;
      when "010" => result <= a XOR b;
      when "011" => result <= NOT a;
      when "100" => result <= NOT (a AND b);
      when "101" => result <= NOT (a OR b);
      when others => result <= (others => '0');
    end case;
  end process;
end architecture;
```

## Testbench Code

```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_alu_logic_8bit is
end entity;

architecture sim of tb_alu_logic_8bit is
  signal a, b   : std_logic_vector(7 downto 0) := (others => '0');
  signal sel    : std_logic_vector(2 downto 0) := (others => '0');
  signal result : std_logic_vector(7 downto 0);
begin
  uut: entity work.alu_logic_8bit
    port map (a => a, b => b, sel => sel, result => result);

  process begin
    a <= x"F0"; b <= x"0F";
    sel <= "000"; wait for 10 ns;
    sel <= "001"; wait for 10 ns;
    sel <= "010"; wait for 10 ns;
    sel <= "011"; wait for 10 ns;
    sel <= "100"; wait for 10 ns;
    sel <= "101"; wait for 10 ns;

    a <= x"AA"; b <= x"55";
    sel <= "000"; wait for 10 ns;
    sel <= "001"; wait for 10 ns;

    wait;
  end process;
end architecture;
```

## Expected Output / Waveform

```
A=F0 B=0F sel=000 | result=00
A=F0 B=0F sel=001 | result=FF
A=F0 B=0F sel=010 | result=FF
A=F0 B=0F sel=011 | result=0F
A=F0 B=0F sel=100 | result=FF
A=F0 B=0F sel=101 | result=00
A=AA B=55 sel=000 | result=00
A=AA B=55 sel=001 | result=FF
```

## Conclusion

Verified all six bitwise operations. Complementary inputs (F0/0F, AA/55) confirm every bit position independently.
