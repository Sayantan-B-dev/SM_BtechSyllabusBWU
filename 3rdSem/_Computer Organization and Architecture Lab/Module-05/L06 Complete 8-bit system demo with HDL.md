# Complete 8-bit System Demo CPU plus ALU plus Register plus Memory with HDL

**Course:** Computer Organization and Architecture Lab  
**Module:** 5 | **Lecture:** 6  
**Date:** 16-Oct-2026  
**Faculty:** DR. SUBHANKAR SHOME  
**CO:** CO 5  
**Learning Methodology:** Simulation  
**Reference:** Book & Lab Manual

## Lab Objectives

- Integrate CPU + ALU + Register + RAM into one top-level system.
- Run a 3-instruction demo program: LOAD, ADD, STORE.
- Verify end-to-end: memory -> register -> ALU -> memory.

## Theory

The full datapath chain built across the semester:
`Module-02 adders -> Module-04 ALU -> Module-03 registers/RAM -> Module-05 CPU+interface`. This lab instantiates all four blocks in one `system_8bit` entity and runs machine code:

| Addr | Content | Meaning |
|---|---|---|
| 0x00 | LOAD R, [0x10] | R <= mem[0x10] (= 20) |
| 0x01 | ADD R, [0x11] | R <= R + mem[0x11] (= 20 + 10) |
| 0x02 | STORE R, [0x12] | mem[0x12] <= R (= 30) |
| 0x10 | 20 | operand A |
| 0x11 | 10 | operand B |

## VHDL Code

```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity system_8bit is
  port (
    clk    : in  std_logic;
    reset  : in  std_logic;
    result : out std_logic_vector(7 downto 0);  -- mirrors mem[0x12]
    done   : out std_logic
  );
end entity;

architecture rtl of system_8bit is
  signal addr, din, dout : std_logic_vector(7 downto 0) := (others => '0');
  signal rd, wr          : std_logic := '0';
  signal reg_q           : std_logic_vector(7 downto 0) := (others => '0');
  signal alu_out         : std_logic_vector(7 downto 0);
  type state_t is (FETCH0, LOAD1, ADD1, STORE1, HALT);
  signal state : state_t := FETCH0;
  signal pc    : unsigned(7 downto 0) := (others => '0');
begin
  mem: entity work.ram_256x8
    port map (clk => clk, addr => addr, din => din, dout => dout,
              mem_read => rd, mem_write => wr);

  alu: entity work.alu_8bit
    port map (a => reg_q, b => dout, sel => "000", result => alu_out);

  process (clk, reset)
  begin
    if reset = '1' then
      pc <= (others => '0'); state <= FETCH0; done <= '0';
    elsif rising_edge(clk) then
      case state is
        when FETCH0 =>                       -- LOAD R,[0x10]
          addr <= x"10"; rd <= '1'; state <= LOAD1;
        when LOAD1 =>
          reg_q <= dout; rd <= '0';
          addr <= x"11"; rd <= '1'; state <= ADD1;
        when ADD1 =>                          -- ADD R,[0x11]
          reg_q <= alu_out; rd <= '0'; state <= STORE1;
        when STORE1 =>                        -- STORE R,[0x12]
          addr <= x"12"; din <= reg_q; wr <= '1'; state <= HALT;
        when HALT =>
          wr <= '0'; result <= reg_q; done <= '1';
      end case;
    end if;
  end process;
end architecture;
```

## Testbench Code

```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_system_8bit is
end entity;

architecture sim of tb_system_8bit is
  signal clk, reset, done : std_logic := '0';
  signal result : std_logic_vector(7 downto 0);
begin
  dut: entity work.system_8bit
    port map (clk => clk, reset => reset, result => result, done => done);

  clk <= not clk after 5 ns;
  process begin
    reset <= '1'; wait for 12 ns; reset <= '0';
    wait until done = '1';
    assert result = x"1E"
      report "FAIL: expected 30 (0x1E)" severity error;
    report "System demo finished: result=" &
      integer'image(to_integer(unsigned(result))) severity note;
    wait;
  end process;
end architecture;
```

## Expected Output / Waveform

```
LOAD1: reg_q <= 20 (0x14)
ADD1:  reg_q <= 20 + 10 = 30 (0x1E)
STORE1/HALT: mem[0x12] = 30, result=1E done=1
# System demo finished: result=30
```

## Conclusion

End-to-end system verified: 20 + 10 = 30 flows from RAM through the register and ALU back to RAM. This file, with L01-L05, completes Module V (CPU design + interfacing, 6 lectures) and ties all five lab modules together.
