library ieee;
use ieee.std_logic_1164.all;

entity tb_simple_traffic is
end tb_simple_traffic;

architecture test of tb_simple_traffic is

    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal ns_green, ns_red, ew_green, ew_red : std_logic;

begin

    uut: entity work.simple_traffic
        port map (
            clk => clk,
            reset => reset,
            ns_green => ns_green,
            ns_red => ns_red,
            ew_green => ew_green,
            ew_red => ew_red
        );

    clk <= not clk after 5 ns;

    process
    begin
        reset <= '1';
        wait for 10 ns;

        reset <= '0';
        wait for 40 ns;

        wait;
    end process;

end test;
