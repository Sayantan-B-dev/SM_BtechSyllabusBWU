library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    Port (
        A    : in  std_logic;
        B    : in  std_logic;
        Cin  : in  std_logic;
        Sum  : out std_logic;
        Cout : out std_logic
    );
end full_adder;

architecture Behavioral of full_adder is
begin

    -- Full Adder Truth Table
    --
    -- A  B  Cin | Sum  Cout
    -- ---------------------
    -- 0  0   0  |  0    0
    -- 0  0   1  |  1    0
    -- 0  1   0  |  1    0
    -- 0  1   1  |  0    1
    -- 1  0   0  |  1    0
    -- 1  0   1  |  0    1
    -- 1  1   0  |  0    1
    -- 1  1   1  |  1    1

    Sum  <= A xor B xor Cin;
    Cout <= (A and B) or (Cin and (A xor B));

end Behavioral;