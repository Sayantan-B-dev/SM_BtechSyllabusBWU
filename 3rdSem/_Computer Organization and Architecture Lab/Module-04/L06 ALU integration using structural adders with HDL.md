# ALU Integration Using Structural Adders with HDL

**Course:** Computer Organization and Architecture Lab  
**Module:** 4 | **Lecture:** 6  
**Date:** 03-Oct-2026  
**Faculty:** DR. SUBHANKAR SHOME  
**CO:** CO 4  
**Learning Methodology:** Simulation  
**Reference:** Book & Lab Manual

## Lab Objectives

- Instantiate Half Adder / Full Adder / CPA components inside an ALU (structural style).
- Contrast behavioral `+` operator (L01) with structural adder chain.
- Verify both styles give identical results.

## Theory

**Behavioral** (`a + b`) lets the synthesis tool choose the adder. **Structural** explicitly chains 8 full adders (ripple carry). Functionally identical; structurally the ripple version shows carry propagation delay, motivating the CLA studied in Module-03.

**Ripple chain:** `c0 = Cin`, `sum(i) = a(i) XOR b(i) XOR c(i)`, `c(i+1) = (a(i) AND b(i)) OR (c(i) AND (a(i) XOR b(i)))`.

## VHDL Code

```vhdl
library ieee;
use ieee.std_logic_1164.all;

-- 1-bit full adder building block (from Module-02)
entity fa_1bit is
  port (
    a, b, cin : in  std_logic;
    sum, cout : out std_logic
  );
end entity;

architecture rtl of fa_1bit is
begin
  sum  <= a XOR b XOR cin;
  cout <= (a AND b) OR (cin AND (a XOR b));
end architecture;

-- 8-bit ripple adder built from 8 full adders
library ieee;
use ieee.std_logic_1164.all;

entity ripple_8bit is
  port (
    a    : in  std_logic_vector(7 downto 0);
    b    : in  std_logic_vector(7 downto 0);
    cin  : in  std_logic;
    sum  : out std_logic_vector(7 downto 0);
    cout : out std_logic
  );
end entity;

architecture structural of ripple_8bit is
  signal c : std_logic_vector(8 downto 0);
begin
  c(0) <= cin;
  gen: for i in 0 to 7 generate
    fa: entity work.fa_1bit
      port map (a => a(i), b => b(i), cin => c(i),
                sum => sum(i), cout => c(i+1));
  end generate;
  cout <= c(8);
end architecture;

-- ALU add/sub slice reusing the structural adder
library ieee;
use ieee.std_logic_1164.all;

entity alu_struct_addsub is
  port (
    a      : in  std_logic_vector(7 downto 0);
    b      : in  std_logic_vector(7 downto 0);
    sub    : in  std_logic;  -- 0=add, 1=sub
    result : out std_logic_vector(7 downto 0);
    cout   : out std_logic
  );
end entity;

architecture structural of alu_struct_addsub is
  signal b_eff : std_logic_vector(7 downto 0);
begin
  -- for subtraction: invert B and set Cin=1 (2's complement)
  b_eff <= b XOR (7 downto 0 => sub);
  u_add: entity work.ripple_8bit
    port map (a => a, b => b_eff, cin => sub,
              sum => result, cout => cout);
end architecture;
```

## Testbench Code

```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_alu_struct is
end entity;

architecture sim of tb_alu_struct is
  signal a, b   : std_logic_vector(7 downto 0) := (others => '0');
  signal sub    : std_logic := '0';
  signal result : std_logic_vector(7 downto 0);
  signal cout   : std_logic;
begin
  uut: entity work.alu_struct_addsub
    port map (a => a, b => b, sub => sub, result => result, cout => cout);

  process begin
    a <= x"14"; b <= x"0A"; sub <= '0'; wait for 10 ns;  -- 20+10=30
    sub <= '1'; wait for 10 ns;                          -- 20-10=10
    a <= x"FF"; b <= x"01"; sub <= '0'; wait for 10 ns;  -- 255+1, cout=1
    wait;
  end process;
end architecture;
```

## Expected Output / Waveform

```
A=14 B=0A sub=0 | result=1E cout=0
A=14 B=0A sub=1 | result=0A cout=1
A=FF B=01 sub=0 | result=00 cout=1
```

## Conclusion

Structural ALU slice verified against behavioral results. Links Module-02 adders → Module-03 CLA motivation → Module-04 ALU → Module-05 CPU datapath.
