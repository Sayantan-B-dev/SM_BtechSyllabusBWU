library ieee;
use ieee.std_logic_1164.all;

entity full_subtractor is
    Port (
        A    : in  std_logic;
        B    : in  std_logic;
        Bin  : in  std_logic;
        Diff : out std_logic;
        Bout : out std_logic
    );
end full_subtractor;

architecture Behavioral of full_subtractor is
begin

    -- Truth Table
    -- A  B  Bin | Diff  Bout
    -- 0  0   0  |   0     0
    -- 0  0   1  |   1     1
    -- 0  1   0  |   1     1
    -- 0  1   1  |   0     1
    -- 1  0   0  |   1     0
    -- 1  0   1  |   0     0
    -- 1  1   0  |   0     0
    -- 1  1   1  |   1     1

    Diff <= A xor B xor Bin;
    Bout <= ((not A) and B) or
            (Bin and (A xnor B));

end Behavioral;