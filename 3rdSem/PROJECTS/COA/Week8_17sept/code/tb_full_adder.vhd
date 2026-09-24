library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_full_adder is
end tb_full_adder;

architecture Behavioral of tb_full_adder is

    -- Component declaration
    component full_adder
        Port (
            A    : in  STD_LOGIC;
            B    : in  STD_LOGIC;
            Cin  : in  STD_LOGIC;
            Sum  : out STD_LOGIC;
            Cout : out STD_LOGIC
        );
    end component;

    -- Signals to connect to the Full Adder
    signal A    : STD_LOGIC := '0';
    signal B    : STD_LOGIC := '0';
    signal Cin  : STD_LOGIC := '0';
    signal Sum  : STD_LOGIC;
    signal Cout : STD_LOGIC;

begin

    -- Instantiate the Full Adder
    UUT: full_adder
        port map (
            A    => A,
            B    => B,
            Cin  => Cin,
            Sum  => Sum,
            Cout => Cout
        );

    -- Test process
    stim_proc: process
    begin

        -- Test 1: 000
        A <= '0'; B <= '0'; Cin <= '0';
        wait for 10 ns;

        -- Test 2: 001
        A <= '0'; B <= '0'; Cin <= '1';
        wait for 10 ns;

        -- Test 3: 010
        A <= '0'; B <= '1'; Cin <= '0';
        wait for 10 ns;

        -- Test 4: 011
        A <= '0'; B <= '1'; Cin <= '1';
        wait for 10 ns;

        -- Test 5: 100
        A <= '1'; B <= '0'; Cin <= '0';
        wait for 10 ns;

        -- Test 6: 101
        A <= '1'; B <= '0'; Cin <= '1';
        wait for 10 ns;

        -- Test 7: 110
        A <= '1'; B <= '1'; Cin <= '0';
        wait for 10 ns;

        -- Test 8: 111
        A <= '1'; B <= '1'; Cin <= '1';
        wait for 10 ns;

        -- End simulation
        wait;
    end process;

end Behavioral;