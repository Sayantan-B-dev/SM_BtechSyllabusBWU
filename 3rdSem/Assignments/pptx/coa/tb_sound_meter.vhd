
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_sound_meter is
end tb_sound_meter;

architecture sim of tb_sound_meter is

    signal clk  : STD_LOGIC := '0';
    signal rst  : STD_LOGIC := '1';
    signal din  : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal db   : STD_LOGIC_VECTOR(7 downto 0);
    signal peak : STD_LOGIC_VECTOR(7 downto 0);

begin

    uut: entity work.sound_meter
        port map (
            clk  => clk,
            rst  => rst,
            din  => din,
            db   => db,
            peak => peak
        );

    clk <= not clk after 5 ns;

    process
    begin
        rst <= '1';
        wait for 20 ns;

        rst <= '0';

        din <= x"10";
        wait for 100 ns;

        din <= x"30";
        wait for 100 ns;

        din <= x"50";
        wait for 100 ns;

        din <= x"70";
        wait for 100 ns;

        din <= x"90";
        wait for 100 ns;

        din <= x"60";
        wait for 100 ns;

        din <= x"40";
        wait for 100 ns;

        din <= x"A0";
        wait for 100 ns;

        din <= x"20";
        wait for 100 ns;

        din <= x"00";
        wait for 100 ns;

        rst <= '1';
        wait for 30 ns;

        rst <= '0';
        din <= x"80";
        wait for 100 ns;

        wait;
    end process;

end sim;