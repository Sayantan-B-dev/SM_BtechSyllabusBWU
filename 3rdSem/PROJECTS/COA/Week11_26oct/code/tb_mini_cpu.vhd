library ieee;
use ieee.std_logic_1164.all;

entity tb_mini_cpu is
end tb_mini_cpu;

architecture test of tb_mini_cpu is

    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal acc_out : std_logic_vector(7 downto 0);
    signal halted : std_logic;

begin

    uut: entity work.mini_cpu
        port map (
            clk => clk,
            reset => reset,
            acc_out => acc_out,
            halted => halted
        );

    clk <= not clk after 5 ns;

    process
    begin
        reset <= '1';
        wait for 10 ns;

        reset <= '0';
        wait for 50 ns;

        wait;
    end process;

end test;