library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux is
    port(
        X : in  STD_LOGIC;
        S : in  STD_LOGIC_VECTOR(1 downto 0);
        Y : out STD_LOGIC_VECTOR(3 downto 0)
    );
end demux;

architecture Behavioral of demux is
begin
    process(X, S)
    begin
        Y <= "0000";

        case S is
            when "00" => Y(0) <= X;
            when "01" => Y(1) <= X;
            when "10" => Y(2) <= X;
            when "11" => Y(3) <= X;
            when others => Y <= "XXXX";
        end case;
    end process;
end Behavioral;