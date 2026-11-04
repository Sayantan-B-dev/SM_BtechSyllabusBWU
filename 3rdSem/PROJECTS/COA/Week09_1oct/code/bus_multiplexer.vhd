library ieee;
use ieee.std_logic_1164.all;

entity bus_multiplexer is 
	Port(
		A:in std_logic_vector(7 downto 0);
		B:in std_logic_vector(7 downto 0);
		C:in std_logic_vector(7 downto 0);		
		sel:in std_logic_vector(1 downto 0);
		X:out std_logic_vector(7 downto 0)
	);
end bus_multiplexer;
architecture Behavioral of bus_multiplexer is
begin
	process(A,B,C,sel)
	begin
		case sel is
			when "00" => X <= A;
			when "01" => X <= B;
			when "10" => X <= C;
			when others => X <= "00000000";
		end case;
	end process;
end Behavioral;