library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_8_1 is
    port(
        X : in  STD_LOGIC_VECTOR(7 downto 0);
        S : in  STD_LOGIC_VECTOR(2 downto 0);
        Y : out STD_LOGIC
    );
end mux_8_1;

architecture Behavioral of mux_8_1 is
begin
    process(X, S)
    begin
        case S is
            when "000" => Y <= X(0);
            when "001" => Y <= X(1);
            when "010" => Y <= X(2);
            when "011" => Y <= X(3);
            when "100" => Y <= X(4);
            when "101" => Y <= X(5);
            when "110" => Y <= X(6);
            when "111" => Y <= X(7);
            when others => Y <= '0';
        end case;
    end process;
end Behavioral;