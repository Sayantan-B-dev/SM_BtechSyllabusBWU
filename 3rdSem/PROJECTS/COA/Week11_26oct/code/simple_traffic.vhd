library ieee;
use ieee.std_logic_1164.all;

entity simple_traffic is
    port (
        clk      : in  std_logic;
        reset    : in  std_logic;
        ns_green : out std_logic;
        ns_red   : out std_logic;
        ew_green : out std_logic;
        ew_red   : out std_logic
    );
end simple_traffic;

architecture behavioral of simple_traffic is

    type state_type is (ns_go, ew_go);
    signal state : state_type := ns_go;

begin

    process(clk, reset)
    begin
        if reset = '1' then
            state <= ns_go;
        elsif rising_edge(clk) then
            case state is
                when ns_go =>
                    state <= ew_go;

                when ew_go =>
                    state <= ns_go;
            end case;
        end if;
    end process;

    process(state)
    begin
        case state is
            when ns_go =>
                ns_green <= '1';
                ns_red   <= '0';
                ew_green <= '0';
                ew_red   <= '1';

            when ew_go =>
                ns_green <= '0';
                ns_red   <= '1';
                ew_green <= '1';
                ew_red   <= '0';
        end case;
    end process;

end behavioral;