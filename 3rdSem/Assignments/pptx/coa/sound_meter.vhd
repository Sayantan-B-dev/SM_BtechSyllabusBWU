library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sound_meter is
    Port (
        clk   : in  STD_LOGIC;
        rst   : in  STD_LOGIC;
        din   : in  STD_LOGIC_VECTOR(7 downto 0);
        db    : out STD_LOGIC_VECTOR(7 downto 0);
        peak  : out STD_LOGIC_VECTOR(7 downto 0)
    );
end sound_meter;

architecture rtl of sound_meter is
    signal p : unsigned(7 downto 0) := (others => '0');
begin

    process(clk)
        variable d : unsigned(7 downto 0);
    begin
        if rising_edge(clk) then
            if rst = '1' then
                db <= (others => '0');
                peak <= (others => '0');
                p <= (others => '0');
            else
                d := unsigned(din);

                db <= std_logic_vector(d);

                if d > p then
                    p <= d;
                end if;

                peak <= std_logic_vector(p);
            end if;
        end if;
    end process;

end rtl;