
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder is
    port(
      C :in STD_LOGIC_VECTOR(1 downto 0);
      D :out STD_LOGIC_VECTOR(3 downto 0)
    );
end decoder;

architecture Behavioral of decoder is
begin
    process (C)
    begin
	case C is
	    when "00" => D <= "0001";
	    when "01" => D <= "0010";
	    when "10" => D <= "0100";
	    when "11" => D <= "1000";
	    when others => D <= "XXXX";
	end case;
    end process;
end Behavioral;