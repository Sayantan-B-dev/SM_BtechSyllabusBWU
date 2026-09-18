# Implementing 8-bit ALU Arithmetic Operations and Flags with HDL

**Course:** Computer Organization and Architecture Lab  
**Module:** 4 | **Lecture:** 4  
**Date:** 02-Oct-2026  
**Faculty:** DR. SUBHANKAR SHOME  
**CO:** CO 4  
**Learning Methodology:** Simulation  
**Reference:** Book & Lab Manual

## Lab Objectives

- Implement add, subtract, increment, decrement in an ALU slice.
- Generate Zero, Carry, Overflow and Negative flags.
- Understand signed vs unsigned overflow detection.

## Theory

**Flags** summarize the result for the control unit:
- **Zero (Z):** result is all zeros.
- **Carry (C):** 9th bit of unsigned addition (or borrow for subtraction).
- **Overflow (V):** signed overflow — carry into MSB differs from carry out of MSB.
- **Negative (N):** MSB of result (sign bit).

**Overflow rule:** `V = carry_in(7) XOR carry_out(7)`.

| sel | Operation | Expression |
|---|---|---|
| 000 | ADD | A + B |
| 001 | SUB | A - B |
| 010 | INC A | A + 1 |
| 011 | DEC A | A - 1 |
| 100 | Pass A | A |
| 101 | Pass B | B |

## VHDL Code

```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_arith_8bit is
  port (
    a        : in  std_logic_vector(7 downto 0);
    b        : in  std_logic_vector(7 downto 0);
    sel      : in  std_logic_vector(2 downto 0);
    result   : out std_logic_vector(7 downto 0);
    zero     : out std_logic;
    carry    : out std_logic;
    overflow : out std_logic;
    negative : out std_logic
  );
end entity;

architecture behavioral of alu_arith_8bit is
  signal r9 : unsigned(8 downto 0);
begin
  process (a, b, sel)
    variable cin7, cout7 : std_logic;
  begin
    case sel is
      when "000" => r9 <= unsigned("0" & a) + unsigned("0" & b);
      when "001" => r9 <= unsigned("0" & a) - unsigned("0" & b);
      when "010" => r9 <= unsigned("0" & a) + 1;
      when "011" => r9 <= unsigned("0" & a) - 1;
      when "100" => r9 <= unsigned("0" & a);
      when "101" => r9 <= unsigned("0" & b);
      when others => r9 <= (others => '0');
    end case;
  end process;

  result   <= std_logic_vector(r9(7 downto 0));
  carry    <= r9(8);
  zero     <= '1' when r9(7 downto 0) = "00000000" else '0';
  negative <= r9(7);
  -- signed overflow: carry into bit7 XOR carry out of bit7
  overflow <= (a(7) and b(7) and not r9(7)) or
              (not a(7) and not b(7) and r9(7)) when sel = "000" else '0';
end architecture;
```

## Testbench Code

```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_alu_arith_8bit is
end entity;

architecture sim of tb_alu_arith_8bit is
  signal a, b   : std_logic_vector(7 downto 0) := (others => '0');
  signal sel    : std_logic_vector(2 downto 0) := (others => '0');
  signal result : std_logic_vector(7 downto 0);
  signal zero, carry, overflow, negative : std_logic;
begin
  uut: entity work.alu_arith_8bit
    port map (a => a, b => b, sel => sel, result => result,
              zero => zero, carry => carry,
              overflow => overflow, negative => negative);

  process begin
    -- 127 + 1 = 128: signed overflow, negative set, no unsigned carry
    a <= std_logic_vector(to_unsigned(127, 8));
    b <= std_logic_vector(to_unsigned(1, 8));
    sel <= "000"; wait for 10 ns;
    -- 255 + 1 = 0: zero + carry set
    a <= std_logic_vector(to_unsigned(255, 8));
    b <= std_logic_vector(to_unsigned(1, 8));
    sel <= "000"; wait for 10 ns;
    -- 20 - 10 = 10
    a <= std_logic_vector(to_unsigned(20, 8));
    b <= std_logic_vector(to_unsigned(10, 8));
    sel <= "001"; wait for 10 ns;
    -- 10 - 20 = 246 (borrow, negative set)
    a <= std_logic_vector(to_unsigned(10, 8));
    b <= std_logic_vector(to_unsigned(20, 8));
    sel <= "001"; wait for 10 ns;

    wait;
  end process;
end architecture;
```

## Expected Output / Waveform

```
A=127 B=1  sel=000 | result=128 Z=0 C=0 V=1 N=1
A=255 B=1  sel=000 | result=0   Z=1 C=1 V=0 N=0
A=20  B=10 sel=001 | result=10  Z=0 C=0 V=0 N=0
A=10  B=20 sel=001 | result=246 Z=0 C=1 V=0 N=1
```

## Conclusion

Arithmetic slice with four flags verified. Overflow case (127+1) vs carry case (255+1) demonstrates the signed/unsigned distinction the CPU uses for branch decisions.
