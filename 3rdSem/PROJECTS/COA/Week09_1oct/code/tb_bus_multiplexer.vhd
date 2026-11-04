library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_bus_multiplexer is
end tb_bus_multiplexer;

architecture Behavioral of tb_bus_multiplexer is

    component bus_multiplexer
        Port (
            A      : in  STD_LOGIC_VECTOR(7 downto 0);
            B      : in  STD_LOGIC_VECTOR(7 downto 0);
            C      : in  STD_LOGIC_VECTOR(7 downto 0);
            sel    : in  STD_LOGIC_VECTOR(1 downto 0);
            X      : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal A      : STD_LOGIC_VECTOR(7 downto 0) := (others =>'0');
    signal B      : STD_LOGIC_VECTOR(7 downto 0) := (others =>'0');
    signal C      : STD_LOGIC_VECTOR(7 downto 0) := (others =>'0');
    signal sel    : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal X      : STD_LOGIC_VECTOR(7 downto 0);

begin
    A <= "01010101";
    B <= "10101010";
    C <= "11001100";
    UUT: bus_multiplexer
        port map (
            A      => A,
            B      => B,
            C      => C,
            sel    => sel,
            X   => X
        );

    stim_proc: process
    begin

        sel <= "00";
        wait for 10 ns;

        sel <= "01";
        wait for 10 ns;

        sel <= "10";
        wait for 10 ns;

        sel <= "11";
        wait for 10 ns;

        wait;

    end process;

end Behavioral;
