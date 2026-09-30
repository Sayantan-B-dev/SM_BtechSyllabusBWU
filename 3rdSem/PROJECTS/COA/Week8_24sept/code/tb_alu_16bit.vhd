library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_alu_16bit is
end tb_alu_16bit;

architecture Behavioral of tb_alu_16bit is

    component alu_16bit
        Port (
            A      : in  STD_LOGIC_VECTOR(15 downto 0);
            B      : in  STD_LOGIC_VECTOR(15 downto 0);
            sel    : in  STD_LOGIC_VECTOR(1 downto 0);
            Result : out STD_LOGIC_VECTOR(15 downto 0);
            Cout   : out STD_LOGIC
        );
    end component;

    signal A      : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal B      : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal sel    : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal Result : STD_LOGIC_VECTOR(15 downto 0);
    signal Cout   : STD_LOGIC;

begin

    UUT: alu_16bit
        port map (
            A      => A,
            B      => B,
            sel    => sel,
            Result => Result,
            Cout   => Cout
        );

    stim_proc: process
    begin

        -- Test 1: ADD
        -- 5 + 3 = 8
        A <= x"0005";
        B <= x"0003";
        sel <= "00";
        wait for 10 ns;

        -- Test 2: SUB
        -- 5 - 3 = 2
        A <= x"0005";
        B <= x"0003";
        sel <= "01";
        wait for 10 ns;

        -- Test 3: AND
        -- 000A AND 000C = 0008
        A <= x"000A";
        B <= x"000C";
        sel <= "10";
        wait for 10 ns;

        -- Test 4: OR
        -- 000A OR 000C = 000E
        A <= x"000A";
        B <= x"000C";
        sel <= "11";
        wait for 10 ns;

        -- Test 5: ADD with carry
        -- FFFF + 0001 = 0000, Cout = 1
        A <= x"FFFF";
        B <= x"0001";
        sel <= "00";
        wait for 10 ns;

        -- Test 6: SUB with borrow
        -- 3 - 5 = FFFE (16-bit 2's complement)
        A <= x"0003";
        B <= x"0005";
        sel <= "01";
        wait for 10 ns;

        -- End simulation
        wait;

    end process;

end Behavioral;