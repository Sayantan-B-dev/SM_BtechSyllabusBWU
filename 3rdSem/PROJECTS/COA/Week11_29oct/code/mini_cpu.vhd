library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mini_cpu is
    port (
        clk, reset : in std_logic;
        acc_out : out std_logic_vector(7 downto 0);
        halted : out std_logic
    );
end mini_cpu;

architecture behavioral of mini_cpu is

    signal acc : unsigned(7 downto 0) := (others => '0');
    signal pc : integer range 0 to 3 := 0;
    signal stop : std_logic := '0';

begin

    process(clk, reset)
    begin
        if reset = '1' then
            acc <= (others => '0');
            pc <= 0;
            stop <= '0';

        elsif rising_edge(clk) then
            if stop = '0' then
                case pc is
                    when 0 =>
                        acc <= to_unsigned(5, 8);

                    when 1 =>
                        acc <= acc + 3;

                    when 2 =>
                        acc <= acc - 2;

                    when 3 =>
                        stop <= '1';
                end case;

                if pc < 3 then
                    pc <= pc + 1;
                end if;
            end if;
        end if;
    end process;

    acc_out <= std_logic_vector(acc);
    halted <= stop;

end behavioral;
