library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux_1_8 is
    port(
        X : in  STD_LOGIC;
        S : in  STD_LOGIC_VECTOR(2 downto 0);
        Y : out STD_LOGIC_VECTOR(7 downto 0)
    );
end demux_1_8;

architecture Behavioral of demux_1_8 is
begin
    process(X, S)
    begin
        Y <= "00000000";

        case S is
            when "000" => Y(0) <= X;
            when "001" => Y(1) <= X;
            when "010" => Y(2) <= X;
            when "011" => Y(3) <= X;
            when "100" => Y(4) <= X;
            when "101" => Y(5) <= X;
            when "110" => Y(6) <= X;
            when "111" => Y(7) <= X;
            when others => Y <= "XXXXXXXX";
        end case;
    end process;
end Behavioral;