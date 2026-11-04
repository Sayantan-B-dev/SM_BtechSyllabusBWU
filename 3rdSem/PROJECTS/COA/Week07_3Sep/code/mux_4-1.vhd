library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
    port(
        X : in  STD_LOGIC_VECTOR(3 downto 0);
        S : in  STD_LOGIC_VECTOR(1 downto 0);
        Y : out STD_LOGIC
    );
end mux;

architecture Behavioral of mux is
begin
    process(X, S)
    begin
        case S is
            when "00" => Y <= X(0);
            when "01" => Y <= X(1);
            when "10" => Y <= X(2);
            when "11" => Y <= X(3);
            when others => Y <= '0';
        end case;
    end process;
end Behavioral;