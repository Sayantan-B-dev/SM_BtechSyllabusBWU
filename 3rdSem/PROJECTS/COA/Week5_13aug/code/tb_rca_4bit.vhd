library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_rca_4bit is        -- testbench, no ports
end tb_rca_4bit;

architecture Test of tb_rca_4bit is

    signal A, B : STD_LOGIC_VECTOR(3 downto 0);
    signal Cin  : STD_LOGIC;
    signal Sum  : STD_LOGIC_VECTOR(3 downto 0);
    signal Cout : STD_LOGIC;

begin

    -- device under test
    DUT: entity work.rca_4bit
        port map (
            A    => A,
            B    => B,
            Cin  => Cin,
            Sum  => Sum,
            Cout => Cout
        );

    -- apply test inputs
    process
    begin

        A <= "0101"; B <= "0011"; Cin <= '0';    -- 5 + 3 = 8
        wait for 10 ns;

        A <= "1111"; B <= "0001"; Cin <= '0';    -- 15 + 1 = 16 (overflow)
        wait for 10 ns;

        A <= "1010"; B <= "0101"; Cin <= '0';    -- 10 + 5 = 15
        wait for 10 ns;

        A <= "1111"; B <= "1111"; Cin <= '0';    -- 15 + 15 = 30 (overflow)
        wait for 10 ns;

        A <= "1010"; B <= "0011"; Cin <= '1';    -- 10 + 3 + 1 = 14
        wait for 10 ns;

        wait;
    end process;

end Test;
