-- ============================================
-- XNOR Gate
-- Description: XNOR (exclusive-NOR) gate outputs 1
--              when inputs are the SAME.
-- Truth Table:
--   A | B | C
--   0 | 0 | 1
--   0 | 1 | 0
--   1 | 0 | 0
--   1 | 1 | 1
-- ============================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xnor_gate is
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        C : out STD_LOGIC
    );
end xnor_gate;

architecture Behavioral of xnor_gate is
begin
    C <= A XNOR B;
end Behavioral;
