# CPU-Memory Interfacing and Bus Timing with HDL

**Course:** Computer Organization and Architecture Lab  
**Module:** 5 | **Lecture:** 5  
**Date:** 16-Oct-2026  
**Faculty:** DR. SUBHANKAR SHOME  
**CO:** CO 5  
**Learning Methodology:** Simulation  
**Reference:** Book & Lab Manual

## Lab Objectives

- Interface the 8-bit CPU (L01-L02) with external memory (L03-L04).
- Understand address/data/control buses and read/write timing.
- Simulate a fetch cycle: MAR -> memory -> MDR -> IR.

## Theory

**Three buses** connect CPU and memory:
- **Address bus (8-bit, CPU -> MEM):** carries MAR content; selects one of 256 locations.
- **Data bus (8-bit, bidirectional):** carries MDR content; needs tri-state or mux control.
- **Control bus:** `MemRead`, `MemWrite`, `Clk`, `Reset`.

**Read timing (2 cycles):** cycle 1 — CPU drives address, asserts MemRead; cycle 2 — memory drives data, CPU latches into MDR on rising edge. **Write timing** mirrors it with MemWrite and CPU driving data.

## VHDL Code

```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- 256x8 synchronous RAM with separate read/write strobes
entity ram_256x8 is
  port (
    clk      : in  std_logic;
    addr     : in  std_logic_vector(7 downto 0);
    din      : in  std_logic_vector(7 downto 0);
    dout     : out std_logic_vector(7 downto 0);
    mem_read : in  std_logic;
    mem_write: in  std_logic
  );
end entity;

architecture rtl of ram_256x8 is
  type mem_t is array (0 to 255) of std_logic_vector(7 downto 0);
  signal mem : mem_t := (others => (others => '0'));
begin
  process (clk)
  begin
    if rising_edge(clk) then
      if mem_write = '1' then
        mem(to_integer(unsigned(addr))) <= din;
      end if;
      if mem_read = '1' then
        dout <= mem(to_integer(unsigned(addr)));
      end if;
    end if;
  end process;
end architecture;

-- Minimal CPU fetch unit: PC -> MAR -> MEM -> MDR -> IR
entity cpu_fetch is
  port (
    clk      : in  std_logic;
    reset    : in  std_logic;
    mem_data : in  std_logic_vector(7 downto 0);
    mem_addr : out std_logic_vector(7 downto 0);
    mem_read : out std_logic;
    ir       : out std_logic_vector(7 downto 0)
  );
end entity;

architecture rtl of cpu_fetch is
  signal pc : unsigned(7 downto 0) := (others => '0');
begin
  process (clk, reset)
  begin
    if reset = '1' then
      pc <= (others => '0');
    elsif rising_edge(clk) then
      mem_addr <= std_logic_vector(pc);
      mem_read <= '1';
      ir       <= mem_data;   -- latch fetched instruction
      pc       <= pc + 1;
    end if;
  end process;
end architecture;
```

## Testbench Code

```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_cpu_mem is
end entity;

architecture sim of tb_cpu_mem is
  signal clk, reset, rd, wr : std_logic := '0';
  signal addr, din, dout, ir : std_logic_vector(7 downto 0) := (others => '0');
begin
  mem: entity work.ram_256x8
    port map (clk => clk, addr => addr, din => din, dout => dout,
              mem_read => rd, mem_write => wr);
  cpu: entity work.cpu_fetch
    port map (clk => clk, reset => reset, mem_data => dout,
              mem_addr => addr, mem_read => rd, ir => ir);

  clk <= not clk after 5 ns;
  process begin
    reset <= '1'; wait for 12 ns; reset <= '0';
    wait for 100 ns;
    wait;
  end process;
end architecture;
```

## Expected Output / Waveform

```
t=12ns reset released, PC=00
t=15ns addr=00 rd=1 dout=mem[0] ir<=mem[0] PC=01
t=25ns addr=01 rd=1 dout=mem[1] ir<=mem[1] PC=02
Address increments every 10ns; IR follows memory content with 1-cycle lag.
```

## Conclusion

Fetch-stage interfacing verified: PC/MAR drive the address bus, MemRead strobes the RAM, and IR captures the instruction — the heartbeat linking L01-L04 into one system.
